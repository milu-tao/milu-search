package com.yupi.springbootinit.model.dto.postthumb;

import lombok.Data;

import java.io.Serializable;


@Data
public class PostThumbAddRequest implements Serializable {

    /**
     * 帖子 id
     */
    private Long postId;

    private static final long serialVersionUID = 1L;
}