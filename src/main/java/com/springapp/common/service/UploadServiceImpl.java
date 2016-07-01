package com.springapp.common.service;

import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;

/**
 * Created by bangae1 on 2016-06-26.
 */
@Service
@PropertySource("classpath:application.properties")
public class UploadServiceImpl implements UploadService, Serializable {
    @Autowired
    private Environment env;

    public boolean videoUpload(MultipartFile file, VideosEntity videosEntity) {
        boolean msg = true;

        String absolutePath = env.getProperty("file.absolutePath");
        String filePath = videosEntity.getFile_path();
        filePath = filePath.substring(filePath.indexOf("/", 2));
        String fileName = file.getOriginalFilename();
        System.out.println(absolutePath + filePath + fileName);
        try {
            file.transferTo(new File(absolutePath + filePath + fileName));
        } catch (IOException e) {
            e.printStackTrace();
            msg = false;
        }
        return msg;
    }

    public boolean kindUpload(MultipartFile file, VideoKindEntity videoKindEntity) {
        boolean flag = true;
        System.out.println(env.getProperty("file.absolutePath") + videoKindEntity.getCoverPath());
        File newDir = new File(env.getProperty("file.absolutePath") + videoKindEntity.getCoverPath());
        String absolutePath = env.getProperty("file.absolutePath");
        if(!newDir.mkdirs()) {
            System.out.println("create Folder Filed");
        } else {
            System.out.println("create Folder success");
        }

        try {
            file.transferTo(new File(absolutePath + videoKindEntity.getCoverPath() + videoKindEntity.getCoverName()));
        } catch (IOException e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

}
