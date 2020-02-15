package com.zhifou.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class RedisListener
 *
 */
@WebListener
public class RedisListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        new timer();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
	
}
