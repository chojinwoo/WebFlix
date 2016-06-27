package com.springapp.videos.service;

import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;

import java.util.List;

/**
 * Created by bangae11 on 2016-06-19.
 */
public interface VideosService {
    public List<VideosEntity> findAll();
    public List<VideosEntity> adminFindAll();
    public VideosEntity findOne(Integer seq);
    public VideoFavouritesEntity findFavouritesIdAndSeq(String id, String video_seq);
    public String favouriteSave(VideoFavouritesEntity videoFavouritesEntity);
    public List<VideosEntity> findVideoTitle1AndTitle2(String title1, String title2);
    public List<VideosEntity> findVideoListFavouriteId(String id);
    public List<VideoKindEntity> findVideoKindAll();
}
