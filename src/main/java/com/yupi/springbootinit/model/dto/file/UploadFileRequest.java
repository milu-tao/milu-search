package com.yupi.springbootinit.model.dto.file;

import lombok.Data;

import java.io.Serializable;


@Data
public class UploadFileRequest implements Serializable {

    /**
     * 业务
     */
    private String biz;

    private static final long serialVersionUID = 1L;
}