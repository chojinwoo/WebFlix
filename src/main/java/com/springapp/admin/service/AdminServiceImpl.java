package com.springapp.admin.service;

import com.springapp.admin.dao.AdminDao;
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

    @Override
    @Transactional
    public String videoSave(List<HashMap> videoList) {
        try {
            for (HashMap map : videoList) {
                VideosEntity en = new VideosEntity();
                en.getVideoKindEntity().setActor((String) map.get("actor"));
                en.getVideoKindEntity().setCountry((String) map.get("country"));
                en.setFile_name((String) map.get("file_name"));
                en.setFile_path(env.getProperty("file.path") + map.get("file_path"));
                if (map.get("flag").equals("Y")) {
                    en.getVideoKindEntity().setFlag(true);
                } else {
                    en.getVideoKindEntity().setFlag(false);
                }
                en.getVideoKindEntity().setGenre((String) map.get("genre"));
                en.setReg_date((String) map.get("reg_date"));
                en.getVideoKindEntity().setStar(Double.parseDouble((String) map.get("star")));
                en.getVideoKindEntity().setStart_date((String) map.get("start_date"));
                en.setStory((String) map.get("story"));
                en.setThumbnail((String) map.get("thumbnail"));
                en.getVideoKindEntity().setTitle1((String) map.get("title1"));
                en.getVideoKindEntity().setTitle2((String) map.get("title2"));
                en.setTitle3((String) map.get("title3"));


                this.adminDao.videoSave(en);
            }
            return "success";
        } catch(Exception e) {
            e.printStackTrace();
            return "failed";
        }
    }
}
