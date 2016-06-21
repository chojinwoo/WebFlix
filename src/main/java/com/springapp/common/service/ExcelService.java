package com.springapp.common.service;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

/**
 * Created by bangae11 on 2016-06-21.
 */
public interface ExcelService {
    public List<HashMap> ExcelRead(InputStream is);
}
