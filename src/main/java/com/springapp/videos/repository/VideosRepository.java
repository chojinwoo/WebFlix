package com.springapp.videos.repository;

import com.springapp.videos.entity.VideosEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by bangae11 on 2016-06-19.
 */
public interface VideosRepository extends JpaRepository<VideosEntity, Integer> {
    @Query(value = "select * from videos where title1 = :title1 and title2 = :title2 order by title3 asc", nativeQuery = true)
    public List<VideosEntity> findVideoTitle1AndTitle2(@Param("title1")String tite1, @Param("title2")String title2);
}
