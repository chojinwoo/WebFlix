package com.springapp.videos.repository;

import com.springapp.videos.entity.VideoLogEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by bangae1 on 2016-07-10.
 */
public interface VideoLogRepository extends JpaRepository<VideoLogEntity, Integer> {

    @Query(value = "select max(a.video_log_seq) as video_log_seq, a.id, a.videos_seq, a.insert_date  from (select a.*, @rownum \\:= @rownum + 1 as no from video_log as a, (select @rownum \\:= 0) as b) as a where a.id = :id and a.no < 10 group by a.id, a.videos_seq, a.insert_date  order by video_log_seq desc", nativeQuery = true)
    public List<VideoLogEntity> findVideoLogList(@Param("id")String id);
}
