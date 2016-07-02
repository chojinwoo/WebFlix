package com.springapp.main.controller;

import com.google.gson.Gson;
import com.springapp.users.entity.UsersEntity;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.service.VideosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
            mainSet(model, usersEntity);
            return "main/index";
        }catch(Exception e) {
            return "/login/login";
        }
    }
    @RequestMapping(value="/", method=RequestMethod.POST)
    public String main(Model model) {
        UsersEntity usersEntity = (UsersEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        mainSet(model, usersEntity);
        return "main/index";
    }

    private void mainSet(Model model, UsersEntity usersEntity) {
        List<VideoKindEntity> videoKindEntities = this.videosService.findVideoKindAll();
        model.addAttribute("json_videoKind", new Gson().toJson(videoKindEntities));
        model.addAttribute("json_favorite", new Gson().toJson(this.videosService.findVideoListFavouriteId(usersEntity.getId())));
        model.addAttribute("lastUpdate", this.videosService.lastUpdateVideo());
    }

    @RequestMapping(value="/viewList/{videoKindSeq}", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public String findVideoKindSeq(@PathVariable("videoKindSeq")String videoKindSeq) {
        return  new Gson().toJson(this.videosService.findVideoKindSeq(videoKindSeq));
    }

    @RequestMapping(value="/playList", method = RequestMethod.GET)
    public String playList(Model model) {
        UsersEntity usersEntity = (UsersEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("json_videos", new Gson().toJson(this.videosService.findPlayList(usersEntity.getId())));
        model.addAttribute("json_favorite", new Gson().toJson(this.videosService.findVideoListFavouriteId(usersEntity.getId())));
        model.addAttribute("lastUpdate", this.videosService.lastUpdateVideo());
        return "main/playList";
    }
}
