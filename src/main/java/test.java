import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-21.
 */
public class test {
    public static void main(String[] args) {
        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        System.out.println(encoder.encodePassword("aa", null));

        String path = "/attach/HeroesSeason2/cover/";
        System.out.println(lastIndexOfLoop(path, "/", 2, true));
    }

    public static String lastIndexOfLoop(String str, String targetStr, int index, boolean targetStrAppend) {
        String strs = str;
        int i= 0;
        while(i < index) {
            strs = str.substring(0, strs.lastIndexOf(targetStr));
            i++;
        }
        if(targetStrAppend) {
            strs += targetStr;
        }
        return strs;
    }
}




































































































































