package com.springapp.videos.controller;

import com.google.gson.Gson;
import com.springapp.users.entity.UsersEntity;
import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideosEntity;
import com.springapp.videos.service.VideosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.annotation.ServletSecurity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.security.Principal;

/**
 * Created by bangae11 on 2016-06-19.
 */
@Controller
public class VideosController {
    @Autowired
    private VideosService videosService;

    @RequestMapping(value="/videoFindOne/{video_seq}", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public String videoFindOne(@PathVariable("video_seq")String video_seq) {
        return new Gson().toJson(this.videosService.findOne(Integer.parseInt(video_seq)));
    }

    @RequestMapping(value = "/video_favourite/{video_seq}", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String video_favourite(Model model, @PathVariable("video_seq")int video_seq) {
        UsersEntity usersEntity = (UsersEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        VideoFavouritesEntity videoFavouritesEntity = new VideoFavouritesEntity();
        videoFavouritesEntity.setVideo_seq(video_seq);
        videoFavouritesEntity.setId(usersEntity.getId());
        return this.videosService.favouriteSave(videoFavouritesEntity);
    }
}
