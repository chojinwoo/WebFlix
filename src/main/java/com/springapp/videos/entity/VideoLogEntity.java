package com.springapp.videos.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by bangae1 on 2016-07-09.
 */
@Entity
@Table(name = "video_log", schema = "dev", uniqueConstraints = @UniqueConstraint(columnNames = {"id", "videos_seq"}))
public class VideoLogEntity {
    private int video_log_seq;
    private String id;
    private int videos_seq;
    private String insert_date;

    @Basic
    @Column(name="insert_date")
    public String getInsert_date() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        return sdf.format(new Date());
    }

    public void setInsert_date(String insert_date) {
        this.insert_date = insert_date;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="video_log_seq")
    public int getVideo_log_seq() {
        return video_log_seq;
    }

    public void setVideo_log_seq(int video_log_seq) {
        this.video_log_seq = video_log_seq;
    }

    @Column(name="id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name="videos_seq")
    public int getVideos_seq() {
        return videos_seq;
    }

    public void setVideos_seq(int videos_seq) {
        this.videos_seq = videos_seq;
    }

    @Override
    public String toString() {
        return "VideoLogEntity{" +
                "video_log_seq=" + video_log_seq +
                ", id='" + id + '\'' +
                ", videos_seq=" + videos_seq +
                '}';
    }
}
