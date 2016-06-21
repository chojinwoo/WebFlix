package com.springapp.videos.entity;

import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * Created by bangae11 on 2016-06-19.
 */
@Entity
@Table(schema = "bangae1", name = "videos")
public class VideosEntity {
    private int video_seq;
    private String title1;
    private String title2;
    private String title3;
    private String genre; /* 장르 */
    private double star;/* 별점 */
    private String start_date; /* 상영일 */
    private String story; /* 스토리 */
    private String actor; /* 배우 */
    private String country; /* 제작 국가 */
    private String regDate;
    private String fileName;
    private String filePath;
    private String thumbnail;
    private boolean flag;


    public VideosEntity() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="video_seq")
    public int getVideo_seq() {
        return video_seq;
    }

    public void setVideo_seq(int video_seq) {
        this.video_seq = video_seq;
    }

    @Basic
    @Column(name = "genre")
    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    @Basic
    @Column(name = "title1")
    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    @Basic
    @Column(name = "title2")
    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    @Basic
    @Column(name = "title3")
    public String getTitle3() {
        return title3;
    }

    public void setTitle3(String title3) {
        this.title3 = title3;
    }

    @Basic
    @Column(name = "star")
    public double getStar() {
        return star;
    }

    public void setStar(double star) {
        this.star = star;
    }

    @Basic
    @Column(name = "start_date")
    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }


    @Basic
    @Column(name = "story", length = 6000)
    @Type(type="text")
    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    @Basic
    @Column(name = "actor")
    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    @Basic
    @Column(name="country")
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Basic
    @Column(name = "file_name")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Basic
    @Column(name = "file_path")
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    @Basic
    @Column(name = "thumbnail")
    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Basic
    @Column(name = "reg_date")
    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    @Basic
    @Column(name = "flag")
    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "VideosEntity{" +
                "video_seq=" + video_seq +
                ", genre=" + genre +
                ", title1='" + title1 + '\'' +
                ", title2='" + title2 + '\'' +
                ", title3='" + title3 + '\'' +
                ", regDate='" + regDate + '\'' +
                ", fileName='" + fileName + '\'' +
                ", filePath='" + filePath + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", flag=" + flag +
                '}';
    }
}
