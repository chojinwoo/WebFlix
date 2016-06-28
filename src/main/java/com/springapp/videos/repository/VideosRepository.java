package com.springapp.videos.repository;

import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideosEntity;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.HashMap;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-19.
 */
public interface VideosRepository extends JpaRepository<VideosEntity, Integer> {
    @Query(value = "select a.* from videos as a inner join video_favourites as b on a.video_seq = b.video_seq and b.id = :id", nativeQuery = true)
    List<VideosEntity> findVideoListFavouriteId(@Param("id") String id);

    @Query(value = "select * from videos where title1 = :title1 and title2 = :title2 order by title3 asc", nativeQuery = true)
    List<VideosEntity> findVideoTitle1AndTitle2(@Param("title1") String tite1, @Param("title2") String title2);

    @Query(value = "select * from videos where video_kind_seq = :video_kind_seq", nativeQuery = true)
    List<VideosEntity> findVideoKindSeq(@Param("video_kind_seq")String video_kind_seq);
}
