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
public class UploadServiceImpl implements UploadService {
    @Autowired
    private Environment env;

    public String videoUpload(List<MultipartFile> files, String filePath) {
        String msg = "전송성공";
        InputStream is = null;
        FileOutputStream fos = null;

        String absolutePath = env.getProperty("file.absolutePath");
        File createDir = new File(absolutePath + filePath);
        if(!createDir.isDirectory()) {
            createDir.mkdir();
        }
        for(MultipartFile file : files) {
            try {
                String fileName = file.getOriginalFilename();
                is = file.getInputStream();
                fos = new FileOutputStream(absolutePath + filePath + "/" + fileName);
                byte[] b= file.getBytes();
                int s = 0;
                while((s = is.read(b)) > -1) {
                    fos.write(b, 0, s);
                }
                fos.flush();
            } catch (IOException e) {
                e.printStackTrace();
                msg = "전송실패";
            } finally {
                if(is != null) try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    msg = "전송실패";
                }

                if(fos != null) try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    msg = "전송실패";
                }
            }
        }
        return msg;
    }
}
