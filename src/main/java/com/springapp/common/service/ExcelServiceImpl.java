package com.springapp.common.service;

import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.*;
import org.apache.taglibs.standard.lang.jstl.Evaluator;
import org.springframework.stereotype.Service;

import java.io.*;
import java.text.DecimalFormat;
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
        String[] columns = new String[]{"file_name","story","thumbnail","title3","video_kind_seq"};

        FileInputStream fis = null;
        XSSFWorkbook workbook = null;
        DecimalFormat df = new DecimalFormat();
        try {
            workbook = new XSSFWorkbook(is);

            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
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
                            if(!(cell.toString().equalsIgnoreCase("")) ){
                                if(evaluator.evaluateFormulaCell(cell)==XSSFCell.CELL_TYPE_NUMERIC){
                                    double fddata = cell.getNumericCellValue();
                                    value = df.format(fddata);
                                }else if(evaluator.evaluateFormulaCell(cell)==XSSFCell.CELL_TYPE_STRING){
                                    value = cell.getStringCellValue();
                                }else if(evaluator.evaluateFormulaCell(cell)==XSSFCell.CELL_TYPE_BOOLEAN){
                                    boolean fbdata = cell.getBooleanCellValue();
                                    value = String.valueOf(fbdata);
                                }
                                break;
                            }
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
                    System.out.println(columns[ii] + " : " + value);
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
