package com.springapp.admin.dao;

import com.springapp.videos.entity.VideosEntity;
import com.springapp.videos.repository.VideosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by bangae11 on 2016-06-21.
 */
@Repository
public class AdminDaoImpl implements AdminDao {
    @Autowired
    private VideosRepository videosRepository;

    @Override
    public void videoSave(VideosEntity videosEntity) {
        this.videosRepository.save(videosEntity);
    }
}
