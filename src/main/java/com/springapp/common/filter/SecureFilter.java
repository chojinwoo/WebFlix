package com.springapp.common.filter;

import com.springapp.common.util.CustomRequestWrapper;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by bangae1 on 2016-07-01.
 */
public class SecureFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("SecureFilter Start!");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        chain.doFilter(new CustomRequestWrapper(req), res);
    }

    @Override
    public void destroy() {

    }
}
