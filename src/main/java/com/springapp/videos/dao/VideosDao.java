package com.springapp.videos.dao;

import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;

import java.util.List;

/**
 * Created by bangae11 on 2016-06-20.
 */
public interface VideosDao {
    public List<VideosEntity> findAll();
    public List<VideosEntity> adminFindAll();
    public VideosEntity findOne(Integer seq);
    public void deleteVideo(int video_seq);
    public VideoFavouritesEntity findFavouritesIdAndSeq(String id, String video_seq);
    public List<VideosEntity> findVideoListFavouriteId(String id);
    public VideoFavouritesEntity findFavouriteVideoSeq(Integer video_seq);
    public void favouriteSave(VideoFavouritesEntity videoFavouritesEntity);
    public void favouriteDelete(Integer video_favourites_seq);
    public List<VideosEntity> findVideoTitle1AndTitle2(String title1, String title2);
    public List<VideoKindEntity> findVideoKindAll();
    public List<VideosEntity> findVideoKindSeq(String videoKindSeq);
    public VideoKindEntity findVideoKindOne(int videoKindSeq);
    public void saveVideo(VideosEntity videosEntity);
    public void saveVideoKind(VideoKindEntity videoKindEntity);
    public void deleteVideoKind(int video_kind_seq);
    public List<VideoKindEntity> findAdminVideoKindAll();

}
