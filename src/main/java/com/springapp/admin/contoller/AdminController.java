package com.springapp.admin.contoller;

import com.springapp.admin.service.AdminService;
import com.springapp.common.service.ExcelService;
import com.springapp.common.service.UploadService;
import com.springapp.videos.entity.VideoKindEntity;
import com.springapp.videos.entity.VideosEntity;
import com.springapp.videos.service.VideosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-21.
 */
@Controller
@RequestMapping("/admin")
@PropertySource("classpath:application.properties")
public class AdminController {
    @Autowired
    private Environment env;

    @Autowired
    private ExcelService excelService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private VideosService videosService;

    @Autowired
    private UploadService uploadService;

    @RequestMapping(value="/main", method = RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("videoKinds", this.videosService.findVideoKindAll());
        model.addAttribute("videos", this.videosService.adminFindAll());
        return "admin/admin";
    }

    @RequestMapping(value="/video_delete/{video_seq}", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String video_delete(@PathVariable("video_seq")int video_seq) {
        String msg = "삭제완료";
        try {
            videosService.deleteVideo(video_seq);
        } catch (Exception e) {
            msg = "삭제오류 : "+ e.getMessage();
        }
        return msg;
    }

    @RequestMapping(value="/video_up", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String video_up(MultipartRequest multipartRequest, @ModelAttribute("command")VideosEntity videosEntity) {
        String resultMsg = "업로드 완료";
        List<MultipartFile> files = multipartRequest.getFiles("files");
        System.out.println(videosEntity.toString());
        VideoKindEntity videoKindEntity = this.videosService.findVideoKindOne(videosEntity.getVideo_kind_seq());
        String coverPath = videoKindEntity.getCoverPath();
        String filePath = coverPath.substring(0, coverPath.lastIndexOf("cover"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        String[] title = videosEntity.getTitle3().split("///");
        String[] story = videosEntity.getStory().split("///");

        int fileSize = files.size();
        if((fileSize == title.length) && (fileSize == story.length)) {

            int fileCount = 0;
            try {
                for(MultipartFile file : files) {
                    String fileName = file.getOriginalFilename();
                    VideosEntity en = videosEntity;
                    en.setStory(story[fileCount]);
                    en.setFile_path(filePath);
                    en.setFile_name(fileName);
                    en.setTitle3(title[fileCount]);
                    en.setReg_date(sdf.format(new Date()));
                    en.setThumbnail(fileName.substring(0, fileName.lastIndexOf("mp4")) + "jpg");
                    boolean flag = uploadService.videoUpload(file, en);
                    if (flag) {
                        this.videosService.saveVideo(en);
                    }
                }
                fileCount++;
            } catch(Exception e) {
                resultMsg = "전송실패 : " + e.toString();
            }

        } else {
            resultMsg = "업로드파일갯수와 제목 스토리의 갯수가 동일 하지못합니다.";
        }
        return resultMsg;
    }

    @RequestMapping(value="/video_excel_up", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String excel_up(MultipartRequest multipartRequest) throws IOException {
        MultipartFile multipartFile = multipartRequest.getFile("file");
        List<HashMap> excelList = excelService.ExcelRead(multipartFile.getInputStream());
        return this.adminService.videoSave(excelList);

    }

    @RequestMapping(value="/video_excel_temp", method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public void excelTemp(HttpServletRequest req, HttpServletResponse res) {
        File file = new File(env.getProperty("file.absolutePath")+env.getProperty("download.excelTemp"));
        FileInputStream fis = null;
        OutputStream os = null;
        res.setContentType("application/octet-stream");
        res.setHeader("Cache-Control", "no-store");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);
        res.setHeader("Content-Disposition","attachment;filename=" + file.getName());
        res.setContentLength((int) file.length());

        try {
            fis = new FileInputStream(file);
            os = res.getOutputStream();
            byte[] b = new byte[(int) file.length()];
            int s = 0;
            while((s = fis.read(b)) > -1) {
                os.write(b, 0, s);
            }
            os.flush();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if(fis != null) try {
                fis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            if(os != null) try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value="/kind", method = RequestMethod.GET)
    public String videoKind(Model model) {
        model.addAttribute("videoKinds", this.videosService.findAdminVideoKindAll());
        return "admin/kind";
    }

    @RequestMapping(value="/kind_up", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String videoKindUp(MultipartRequest multipartRequest, @ModelAttribute("command") VideoKindEntity videoKindEntity) {
        String msg = "전송완료";
        MultipartFile file = multipartRequest.getFile("file");
        videoKindEntity.setCoverName(file.getOriginalFilename());
        try {
            this.uploadService.kindUpload(file, videoKindEntity);
            videoKindEntity.setCoverPath(env.getProperty("file.path") + videoKindEntity.getCoverPath());
            this.videosService.saveVideoKind(videoKindEntity);
            System.out.println(videoKindEntity.toString());
        } catch(Exception e) {
            msg = "전송실패 : " + e.toString();
        }
        return msg;
    }

    @RequestMapping(value="/kind_delete/{video_kind_seq}", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String kind_delete(@PathVariable("video_kind_seq")int video_kind_seq) {
        String msg = "";
        try {
            this.videosService.deleteVideoKind(video_kind_seq);
            msg = "삭제완료";
        } catch(Exception e) {
            msg = "삭제오류 : " + e.getMessage();

        }

        return msg;
    }

    @RequestMapping(value="/kind_thumbnail/{video_kind_seq}", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String kind_thumbnail(@PathVariable("video_kind_seq")int video_kind_seq) {
        VideoKindEntity videoKindEntity = this.videosService.findVideoKindOne(video_kind_seq);
        String coverPath = videoKindEntity.getCoverPath();
        String path = "/appl/WebFlix"+lastIndexOfLoop(coverPath, "/", 2) + "/";
        String command = "/appl/WebFlix/attach/thumbnailAuto.sh "+path;
        Runtime runtime = Runtime.getRuntime();
        try {
            Process process = runtime.exec(command);
            InputStream is = process.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            String line = "";
            while((line = br.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "seuccess";
    }

    public String lastIndexOfLoop(String str, String targetStr, int index) {
        String strs = str;
        int i= 0;
        while(i < index) {
            strs = str.substring(0, strs.lastIndexOf(targetStr));
            i++;
        }
        return strs;
    }
}
