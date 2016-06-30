package com.springapp.common.service;

import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by bangae1 on 2016-06-26.
 */
public interface UploadService {
    public boolean videoUpload(MultipartFile file, VideosEntity videosEntity);
    public boolean kindUpload(MultipartFile file, VideoKindEntity videoKindEntity);
}
