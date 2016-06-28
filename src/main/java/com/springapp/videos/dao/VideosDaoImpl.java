package com.springapp.videos.dao;

import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;
import com.springapp.videos.repository.VideoFavouritesRepository;
import com.springapp.videos.repository.VideoKindRepository;
import com.springapp.videos.repository.VideosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by bangae11 on 2016-06-20.
 */
@Repository
public class VideosDaoImpl implements VideosDao {

    @Autowired
    private VideosRepository videosRepository;

    @Autowired
    private VideoFavouritesRepository videoFavouritesRepository;

    @Autowired
    private VideoKindRepository videoKindRepository;

    @Override
    public List<VideosEntity> findAll() {
        return this.videosRepository.findAll();
    }

    @Override
    public List<VideosEntity> adminFindAll() {
        return this.videosRepository.findAll();
    }

    private Sort sortByTitle3() {
        return new Sort(Sort.Direction.ASC, "title3");
    }

    @Override
    public VideosEntity findOne(Integer seq) {
        return this.videosRepository.findOne(seq);
    }

    @Override
    public VideoFavouritesEntity findFavouritesIdAndSeq(String id, String video_seq) {
        return this.videoFavouritesRepository.findFavouritesIdAndSeq(id, video_seq);
    }

    @Override
    public List<VideosEntity> findVideoListFavouriteId(String id) {
        return this.videosRepository.findVideoListFavouriteId(id);
    }

    @Override
    public VideoFavouritesEntity findFavouriteVideoSeq(Integer video_seq) {
        return this.videoFavouritesRepository.findFavouriteVideoSeq(video_seq);
    }

    @Override
    public void favouriteSave(VideoFavouritesEntity videoFavouritesEntity) {
        this.videoFavouritesRepository.save(videoFavouritesEntity);
    }

    @Override
    public void favouriteDelete(Integer video_favourites_seq) {
        this.videoFavouritesRepository.delete(video_favourites_seq);
    }

    @Override
    public List<VideosEntity> findVideoTitle1AndTitle2(String title1, String title2) {
        return this.videosRepository.findVideoTitle1AndTitle2(title1, title2);
    }

    @Override
    public List<VideoKindEntity> findVideoKindAll() {
        return this.videoKindRepository.findAll();
    }

    @Override
    public List<VideosEntity> findVideoKindSeq(String videoKindSeq) {
        return this.videosRepository.findVideoKindSeq(videoKindSeq);
    }

}
