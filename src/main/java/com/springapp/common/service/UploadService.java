package com.springapp.common.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by bangae1 on 2016-06-26.
 */
public interface UploadService {
    public String videoUpload(List<MultipartFile> files, String filePath);
}
