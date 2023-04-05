package com.yupi.springbootinit.model.vo;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yupi.springbootinit.model.entity.Picture;
import lombok.Data;

import java.io.Serializable;
import java.util.List;


@Data
public class SearchVO implements Serializable {

    private Page<UserVO> userList;

    private Page<PostVO> postList;

    private Page<Picture> pictureList;

    private List<?> dataList;

}
