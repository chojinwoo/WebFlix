package com.springapp.main.controller;

import com.springapp.users.entity.UsersEntity;
import com.springapp.videos.entity.VideoFavouritesEntity;
import com.springapp.videos.entity.VideosEntity;
import com.springapp.videos.service.VideosService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by bangae11 on 2016-06-18.
 */
@Controller
public class MainController {
    @Autowired
    private VideosService videosService;

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String login(Model model) {
        try {
            UsersEntity usersEntity = (UsersEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            List<VideosEntity> videoList = this.videosService.findAll();
            List<VideosEntity> favouriteList =this.videosService.findVideoListFavouriteId(usersEntity.getId());
            model.addAttribute("videos", videoList);
            model.addAttribute("video_favourite", favouriteList);
            model.addAttribute("json_videos", new JSONArray(videoList).toString());
            model.addAttribute("json_video_favourite", new JSONArray(favouriteList).toString());
            return "main/index";
        }catch(Exception e) {
            return "/login/login";
        }
    }
    @RequestMapping(value="/", method=RequestMethod.POST)
    public String main(Model model) {
        UsersEntity usersEntity = (UsersEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<VideosEntity> videoList = this.videosService.findAll();
        List<VideosEntity> favouriteList =this.videosService.findVideoListFavouriteId(usersEntity.getId());
        model.addAttribute("videos", videoList);
        model.addAttribute("video_favourite", favouriteList);
        model.addAttribute("json_videos", new JSONArray(videoList).toString());
        model.addAttribute("json_video_favourite", new JSONArray(favouriteList).toString());
        return "main/index";
    }
}
