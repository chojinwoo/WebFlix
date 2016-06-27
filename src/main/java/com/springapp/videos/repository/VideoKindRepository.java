package com.springapp.videos.repository;

import com.springapp.videos.entity.VideoKindEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bangae1 on 2016-06-27.
 */
public interface VideoKindRepository extends JpaRepository<VideoKindEntity, Integer> {
}
