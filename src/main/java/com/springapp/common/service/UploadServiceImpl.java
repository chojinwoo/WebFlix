package com.springapp.common.service;

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

    public String videoUpload(List<MultipartFile> files, String filePath) {
        String msg = "Send To Success";
        InputStream is = null;
        FileOutputStream fos = null;

        String absolutePath = env.getProperty("file.absolutePath");
        File createDir = new File(absolutePath + filePath);
        System.out.println(absolutePath + filePath);
        if(!createDir.isDirectory()) {
            System.out.println("Folder create");
            createDir.mkdir();
        }
        for(MultipartFile file : files) {
            String fileName = file.getOriginalFilename();
            try {
                file.transferTo(new File(absolutePath + filePath + "/" + fileName));
            } catch (IOException e) {
                e.printStackTrace();
                msg = "Send To Filed";
            }
        }
        return msg;
    }
}
