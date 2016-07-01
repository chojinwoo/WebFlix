package com.springapp.videos.service;

import com.springapp.videos.dao.VideosDao;
import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-19.
 */
@Service
@PropertySource("classpath:application.properties")
public class VideosServiceImpl implements VideosService {

    @Autowired
    private Environment env;

    @Autowired
    private VideosDao videosDao;

    @Override
    @Transactional(readOnly = true)
    public List<VideosEntity> findAll() {
        return videosDao.findAll();
    }

    @Override
    public List<VideosEntity> adminFindAll() {
        return videosDao.adminFindAll();
    }

    @Override
    @Transactional(readOnly = true)
    public VideosEntity findOne(Integer seq) {
        return videosDao.findOne(seq);
    }

    @Override
    @Transactional
    public void deleteVideo(int video_seq) {
        System.out.println(video_seq);
        VideosEntity videosEntity = this.findOne(video_seq);
        String filePath  = env.getProperty("file.video.delete.path") + videosEntity.getFile_path()+ videosEntity.getFile_name();
        String thumbnailPath = env.getProperty("file.video.delete.path") + videosEntity.getFile_path() + "thumbnail/" + videosEntity.getThumbnail();
        File videoFile = new File(filePath);
        File thumbnailFile = new File(thumbnailPath);

        this.videosDao.deleteVideo(video_seq);
        videoFile.delete();
        thumbnailFile.delete();
    }

    @Override
    @Transactional(readOnly = true)
    public VideoFavouritesEntity findFavouritesIdAndSeq(String id, String video_seq) {
        return videosDao.findFavouritesIdAndSeq(id, video_seq);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public String favouriteSave(VideoFavouritesEntity videoFavouritesEntity) {
        VideoFavouritesEntity entity = this.videosDao.findFavouriteVideoSeq(videoFavouritesEntity.getVideo_seq());
        if(entity  == null) {
            this.videosDao.favouriteSave(videoFavouritesEntity);
            return "1";
        } else {
            this.videosDao.favouriteDelete(entity.getVideo_favourites_seq());
            return "0";
        }

    }

    @Override
    @Transactional(readOnly = true)
    public List<VideosEntity> findVideoTitle1AndTitle2(String title1, String title2) {
        return this.videosDao.findVideoTitle1AndTitle2(title1, title2);
    }

    @Override
    @Transactional(readOnly = true)
    public List<VideosEntity> findVideoListFavouriteId(String id) {
        return this.videosDao.findVideoListFavouriteId(id);
    }

    @Override
    public List<VideoKindEntity> findVideoKindAll() {
        return this.videosDao.findVideoKindAll();
    }

    @Override
    public List<VideoKindEntity> findAdminVideoKindAll() {
        return this.videosDao.findAdminVideoKindAll();
    }

    @Override
    public List<VideosEntity> findVideoKindSeq(String videoKindSeq) {
        return this.videosDao.findVideoKindSeq(videoKindSeq);
    }

    @Override
    public VideoKindEntity findVideoKindOne(int videoKindSeq) {
        return this.videosDao.findVideoKindOne(videoKindSeq);
    }

    @Override
    @Transactional
    public void saveVideo(VideosEntity videosEntity) {
        this.videosDao.saveVideo(videosEntity);
    }

    @Override
    @Transactional
    public void saveVideoKind(VideoKindEntity videoKindEntity) {
        this.videosDao.saveVideoKind(videoKindEntity);
    }

    @Override
    @Transactional
    public void deleteVideoKind(int video_kind_seq) {
        this.videosDao.deleteVideoKind(video_kind_seq);
    }
}
