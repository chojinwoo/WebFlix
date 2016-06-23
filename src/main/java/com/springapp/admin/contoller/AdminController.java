package com.springapp.admin.contoller;

import com.springapp.admin.service.AdminService;
import com.springapp.common.service.ExcelService;
import com.springapp.videos.service.VideosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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

    @RequestMapping(value="/main", method = RequestMethod.GET)
    public String admin(Model model) {
        model.addAttribute("videos", this.videosService.findAll());
        return "admin/admin";
    }


    @RequestMapping(value="/excel_up", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String excel_up(MultipartRequest multipartRequest) throws IOException {
        MultipartFile multipartFile = multipartRequest.getFile("file");
        List<HashMap> excelList = excelService.ExcelRead(multipartFile.getInputStream());
        return this.adminService.videoSave(excelList);

    }

    @RequestMapping(value="/excel_temp", method = RequestMethod.POST)
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
}
