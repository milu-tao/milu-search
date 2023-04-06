milu的聚合搜索平台

基于SpringBoot + Elastic Stack 的信息聚合搜索平台，用户可以在同一个页面查询不同来源、不同类型的数据（文章、图片、用户、视频等），开发者可以二次开发并接入自己项目

添加一个数据源，也可以是远程调用，但要符合DataSource中的规范

![image](https://user-images.githubusercontent.com/91822069/230319352-8fdeecc6-845d-431e-b536-82f750c37bdc.png)

```java
public interface DataSource<T> {


    /**
     * 搜索方法 规范
     * @param searchText
     * @param pageNum
     * @param pageSize
     * @return
     */
    Page<T> doSearch(String searchText, long pageNum, long pageSize);
}
```

文章实例，实现对应的数据源方法（适配器）

```java
@Service
@Slf4j
public class PostDataSource implements DataSource<PostVO> {

    @Resource
    private PostService postService;

    @Override
    public Page<PostVO> doSearch(String searchText, long pageNum, long pageSize) {
        PostQueryRequest postQueryRequest = new PostQueryRequest();
        postQueryRequest.setSearchText(searchText);
        postQueryRequest.setCurrent(pageNum);
        postQueryRequest.setPageSize(pageSize);

        ServletRequestAttributes servletRequestAttributes =  (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();

        Page<Post> postVOPage = postService.searchFromEs(postQueryRequest);

        return postService.getPostVOPage(postVOPage,request);
    }
}
```

SearchFacade的中代码（这里会调用对应DataSource）（门面模式）
```java
            DataSource<?> dataSourceByType = dataSourceRegistry.getDataSourceByType(type);
            SearchVO searchVO = new SearchVO();
            Page<?> page = dataSourceByType.doSearch(searchText, current, pageSize);
            searchVO.setDataList(page.getRecords());
            return searchVO;
```
给对应枚举加上实现的数据源类型
```java
public enum SearchTypeEnum {

    POST("帖子","post"),
    PICTURE("照片","picture"),
    USER("用户","user"),
    ;
}
```

