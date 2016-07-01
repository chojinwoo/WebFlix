package com.springapp.videos.repository;

import com.springapp.videos.entity.VideoKindEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by bangae1 on 2016-06-27.
 */
public interface VideoKindRepository extends JpaRepository<VideoKindEntity, Integer> {
    public List<VideoKindEntity> findByFlag(boolean flag);
}
