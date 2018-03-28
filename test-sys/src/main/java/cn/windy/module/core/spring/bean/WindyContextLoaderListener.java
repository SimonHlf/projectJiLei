package cn.windy.module.core.spring.bean;

import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

public class WindyContextLoaderListener extends ContextLoaderListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);
    }
}
