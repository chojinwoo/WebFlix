package com.springapp.common.util;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Created by bangae1 on 2016-07-01.
 */
public class CustomRequestWrapper extends HttpServletRequestWrapper {


    /**
     * Constructs a request object wrapping the given request.
     *
     * @param request
     * @throws IllegalArgumentException if the request is null
     */
    public CustomRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    public String[] getParameterValues(String parameter) {

        String[] values = super.getParameterValues(parameter);
        if (values==null)  {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for (int i = 0; i < count; i++) {
            encodedValues[i] = cleanXSS(values[i]);
        }
        return encodedValues;
    }

    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return cleanXSS(value);
    }

    private String cleanXSS(String value) {
        //You'll need to remove the spaces from the html entities below
        value = value.replaceAll("<", "").replaceAll(">", "");
        value = value.replaceAll("'", "");
        value = value.replaceAll("\"", "");
        value = value.replaceAll("script", "");
        System.out.println("filtering : " + value);
        return value;
    }
}
