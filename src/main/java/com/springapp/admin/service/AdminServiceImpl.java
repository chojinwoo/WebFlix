package com.springapp.admin.service;

import com.springapp.admin.dao.AdminDao;
import com.springapp.videos.dao.VideosDao;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-21.
 */
@Service
@PropertySource("classpath:application.properties")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private Environment env;

    @Autowired
    private AdminDao adminDao;

    @Autowired
    private VideosDao videosDao;

    @Override
    @Transactional
    public String videoSave(List<HashMap> videoList) {
        try {
            for (HashMap map : videoList) {
                VideosEntity en = new VideosEntity();
                en.setFile_name((String) map.get("file_name"));
                VideoKindEntity videoKindEntity = videosDao.findVideoKindOne(Integer.parseInt((String) map.get("video_kind_seq")));
                String coverPath = videoKindEntity.getCoverPath();
                en.setFile_path(lastIndexOfLoop(coverPath, "/", 2, true));
                en.setStory((String) map.get("story"));
                en.setThumbnail((String) map.get("thumbnail"));
                en.setTitle3((String) map.get("title3"));
                en.setVideo_kind_seq(Integer.parseInt((String) map.get("video_kind_seq")));

                System.out.println(en.toString());
                this.adminDao.videoSave(en);
            }
            return "success";
        } catch(Exception e) {
            e.printStackTrace();
            return "failed";
        }
    }

    public static String lastIndexOfLoop(String str, String targetStr, int index, boolean targetStrAppend) {
        String strs = str;
        int i= 0;
        while(i < index) {
            strs = str.substring(0, strs.lastIndexOf(targetStr));
            i++;
        }
        if(targetStrAppend) {
            strs += targetStr;
        }
        return strs;
    }
}
