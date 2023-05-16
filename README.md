## 项目介绍
milu信息聚合平台
</br>
应用场景：当系统的模糊搜索已经没办法符合需求的时候，想要让系统的搜索更加智能，让用户用起来更加方便，也方便搜索到更多的结果，一般我们需要引入一个Elastic Search作为搜索的入口
</br>
这个项目主要是提供一个SpringBoot + Elastic Search 的一个整合模板，当一个系统需要引入信息的搜索功能的时候，可以对这个项目进行引入，并且该项目的扩展性比较好，
</br>
使用了门面模式、适配器模式，当我们增加一个数据源的时候，需要对另一类数据也进行绝活搜索的时候，就可以非常优雅的加入，不会修改到之前的代码
</br>
用户可以在同一个页面查询不同来源、不同类型的数据（在这个文章、图片、用户、视频等）
</br>
例子：类比B站，当我们点在首页的搜索的时候，我们能发现他会跳转到一个新的域名下面，虽然看似我们在同一个页面之下，但其实我们请求的是另一个服务器，B站对于这种服务是做了服务拆分，所以类似这种聚合搜索的平台也比较适合作为一个微服务。并且在很多知名的、运营得很好的软件系统中，我们都能发现这种聚合搜索的存在。因此这里我也模仿着做了一个平台搜索的功能
![image](https://github.com/milu-tao/milu-search/assets/91822069/1b010e1d-c320-4809-b8b0-3b9f86ba0ac1)
![image](https://github.com/milu-tao/milu-search/assets/91822069/99dc5b7d-8c55-4d42-8620-147714055b87)



## 添加数据源要点
该项目其他地方都是一个常规的SpringBoot项目，主要是这里的设计模式，演示大概的添加数据源的过程
</br>
如果要给ES添加一个数据源（当然也可以是RPC远程调用，但要符合DataSource中的规范，利用Dubbo或者Fegin或者Http进行远程调用）
</br>
![image](https://user-images.githubusercontent.com/91822069/230319352-8fdeecc6-845d-431e-b536-82f750c37bdc.png)

这里是DataSource的接口规范

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

文章实例，实现对应的数据源方法，也就是doSearch方法（适配器）

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
注意：
</br>
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
## 当前项目的测试结果
接口的吞吐量在50/sec（2核2G）

![image](https://user-images.githubusercontent.com/91822069/230327011-08e09620-e3b1-4691-ba65-74c491448da9.png)


该网站我也放在互联网上，提供了访问的接口，不过仍有改进的地方，并且数据并没有伪造很多，还请谅解！
访问链接：http://150.158.98.98:8000/
