package com.springapp.config.webconfig;

import com.springapp.common.util.CustomCommonsMultipartResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

import java.util.Properties;


/**
 * Created by bangae1 on 2016-06-13.
 */
@EnableWebMvc
@Configuration
@ComponentScan(basePackages = {"com.springapp"})
@PropertySource("classpath:application.properties")
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private Environment env;

    @Bean
    public CustomCommonsMultipartResolver multipartResolver() {
        CustomCommonsMultipartResolver multipartResolver = new CustomCommonsMultipartResolver();
        multipartResolver.setDefaultEncoding("utf-8");
        return multipartResolver;
    }


    @Bean
    public ResourceBundleMessageSource messageSource() {
        ResourceBundleMessageSource resourceBundleMessageSource = new ResourceBundleMessageSource();
        resourceBundleMessageSource.setBasename("Messages");
        return resourceBundleMessageSource;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(new String[]{"/resources/**"}).addResourceLocations(new String[]{"/resources/"});
        registry.addResourceHandler(new String[]{"/attach/**"}).addResourceLocations(new String[]{"/attach/"});
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resourceViewResolver = new InternalResourceViewResolver();
        resourceViewResolver.setPrefix("/WEB-INF/tiles");
        resourceViewResolver.setSuffix(".jsp");
        resourceViewResolver.setOrder(1);
        return resourceViewResolver;
    }

    /* tiles view resolver*/
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.tiles().viewClass(TilesView.class);
        registry.order(0);
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer configurer = new TilesConfigurer();
        configurer.setDefinitions("/WEB-INF/tiles-definitions.xml");
        return configurer;
    }


    @Bean
    public JavaMailSenderImpl mailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(env.getProperty("mail.host"));
        mailSender.setPort(Integer.parseInt(env.getProperty("mail.port")));
        mailSender.setUsername(env.getProperty("mail.username"));
        mailSender.setPassword(env.getProperty("mail.password"));
        mailSender.setProtocol(env.getProperty("mail.protocol"));
        Properties javaMailProperties = new Properties();
        javaMailProperties.setProperty("mail.smtp.auth", env.getProperty("mail.smtp.auth"));
        javaMailProperties.setProperty("mail.smtp.ssl.trust", env.getProperty("mail.smtp.ssl.trust"));
        javaMailProperties.setProperty("mail.smtp.starttls.enable", env.getProperty("mail.smtp.starttls.enable"));
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;

    }
}