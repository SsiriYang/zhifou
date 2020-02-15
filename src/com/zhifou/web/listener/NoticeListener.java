package com.zhifou.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.zhifou.bean.Notice;
import com.zhifou.service.Adminservice;
import com.zhifou.web.servlet.AdminServlet;

@WebListener
public class NoticeListener implements ServletContextListener, ServletContextAttributeListener {
  //域对象内容添加时
    public void attributeAdded(ServletContextAttributeEvent arg0)  { 
    	ServletContext servletContext = arg0.getServletContext();
    	Adminservice adminservice = new Adminservice();
    	Notice newnotice = adminservice.getnewnotice();
    	servletContext.setAttribute("newnotice", newnotice);
    }

  //域对象内容删除时
    public void attributeRemoved(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    }

  //域对象销毁时
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

  //域对象内容替换时
    public void attributeReplaced(ServletContextAttributeEvent arg0)  { 
    	//给前台发信息
    }
    //域对象创建时
    public void contextInitialized(ServletContextEvent arg0)  { 
    	ServletContext servletContext = arg0.getServletContext();
    	Adminservice adminservice = new Adminservice();
    	Notice newnotice = adminservice.getnewnotice();
    	servletContext.setAttribute("newnotice", newnotice);
    }
	
}
