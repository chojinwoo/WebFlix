package com.springapp.common.service;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-21.
 */
@Service
public class ExcelServiceImpl implements ExcelService {

    @Override
    public List<HashMap> ExcelRead(InputStream is) {
        List<HashMap> excelList = new LinkedList<HashMap>();
        String[] columns = new String[]{"actor","country","file_name","file_path","flag","genre","reg_date","star","start_date","story","thumbnail","title1","title2","title3"};

        FileInputStream fis = null;
        XSSFWorkbook workbook = null;

        try {
            workbook = new XSSFWorkbook(is);

            XSSFSheet sheet = workbook.getSheetAt(0);
            int idx = sheet.getPhysicalNumberOfRows();
            System.out.println(idx);
            for(int i=1; i<idx; i++) {
                HashMap cellMap = new HashMap();
                XSSFRow row = sheet.getRow(i);
                int cellIdx = row.getPhysicalNumberOfCells();
                for(int ii =0; ii<cellIdx; ii++) {
                    XSSFCell cell = row.getCell(ii);
                    String value = "";
                    switch (cell.getCellType()){
                        case XSSFCell.CELL_TYPE_FORMULA:
                            value=cell.getCellFormula();
                            break;
                        case XSSFCell.CELL_TYPE_NUMERIC:
                            value=cell.getNumericCellValue()+"";
                            break;
                        case XSSFCell.CELL_TYPE_STRING:
                            value=cell.getStringCellValue()+"";
                            break;
                        case XSSFCell.CELL_TYPE_BLANK:
                            value=cell.getBooleanCellValue()+"";
                            break;
                        case XSSFCell.CELL_TYPE_ERROR:
                            value=cell.getErrorCellValue()+"";
                            break;
                    }
                    cellMap.put(columns[ii], value);
                }

                excelList.add(cellMap);
            }

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
            if(workbook != null) try {
                workbook.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return excelList;
    }
}
