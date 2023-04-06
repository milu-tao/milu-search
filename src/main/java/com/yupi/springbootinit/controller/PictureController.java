package com.yupi.springbootinit.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yupi.springbootinit.common.BaseResponse;
import com.yupi.springbootinit.common.ErrorCode;
import com.yupi.springbootinit.common.ResultUtils;
import com.yupi.springbootinit.exception.ThrowUtils;
import com.yupi.springbootinit.model.dto.picture.PictureQueryRequest;
import com.yupi.springbootinit.model.entity.Picture;
import com.yupi.springbootinit.service.PictureService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/picture")
@Slf4j
public class PictureController {

    @Resource
    private PictureService pictureService;

    /**
     * 分页获取列表（封装类）
     *
     * @param PictureQueryRequest
     * @param request
     * @return
     */
    @PostMapping("/list/page/vo")
    public BaseResponse<Page<Picture>> listPostVOByPage(@RequestBody PictureQueryRequest PictureQueryRequest,
            HttpServletRequest request) {
        long current = PictureQueryRequest.getCurrent();
        long size = PictureQueryRequest.getPageSize();
        // 限制爬虫
        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
        String searchText = PictureQueryRequest.getSearchText();

        Page<Picture> picturePage = pictureService.searchPicture(searchText, current, size);
        return ResultUtils.success(picturePage);
    }

}
