package com.zhifou.web.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhifou.bean.*;
import com.zhifou.service.MsgService;

/**
 * Servlet implementation class MsgServlet
 */
@WebServlet("/msgServlet")
public class MsgServlet extends BaseServlet {
	MsgService service = new MsgService();
	public void findMsgByUserId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		 User u = (User) request.getSession().getAttribute("user");
		 int id = u.getUserid();
		 System.out.println("当前信息id"+id);
		 List<Message> MsgList = new ArrayList<>();
		 MsgList = service.getMsgByUserId(id);
		 request.getSession().setAttribute("msgList", MsgList);
		 response.sendRedirect("html/My_message.jsp");
	}	
	public void findMsgBytoUserId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		 User u = (User) request.getSession().getAttribute("user");
		 int id = u.getUserid();
		 System.out.println("当前信息id"+id);
		 List<Message> MsgList = new ArrayList<>();
		 MsgList = service.getMsgBytoUserId(id);
		 request.getSession().setAttribute("msgList", MsgList);
		 response.sendRedirect("html/My_message.jsp");
	}	
    //读取信息
    public void doread(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String sid = request.getParameter("id");
        int id =Integer.parseInt(sid);
        //通过id查message
        Message message = service.doread(id);
        int   fromId = message.getFrom_id();
        // 通过发送者的Id查找用户
        User fromuser = service.findUserById(fromId);
        //将信息状态改为已读
        message.setStatus(1);
        service.updateMessage(message);
        //request.setAttribute("fromUser",fromuser);
        request.getSession().setAttribute("fromuser", fromuser);
        request.getSession().setAttribute("message", message);
        response.sendRedirect("html/message.jsp");
    }
    //回信息
    public void reSend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 try {
    	Message m = (Message) request.getSession().getAttribute("message");
        int toId = m.getFrom_id();
        int fromId = m.getTo_id();
        String subject = m.getSubject();
        // = request.getParameter("subject");
        String content = request.getParameter("content");
        Date Time = new Date();
        System.out.println(Time);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = sdf.format(Time);
        int status = 2;//未读
        Message message = new Message(0,fromId,toId,subject,content,createTime,status);
        service.addMessage(message);
        response.sendRedirect("msgServlet?method=findMsgByUserId");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    //私信
    public void doreSend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 try {
   		UserIndex u = (UserIndex) request.getSession().getAttribute("AnswerDetail");
   		User uss = (User)request.getSession().getAttribute("user");
       int fromId = uss.getUserid();  
       int toId = u.getAnswerproposer();
       String subject = u.getCategoryname();
       // = request.getParameter("subject");
       String content = request.getParameter("content");
       Date Time = new Date();
       System.out.println(Time);
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String createTime = sdf.format(Time);
       int status = 2;//未读
       Message message = new Message(0,fromId,toId,subject,content,createTime,status);
       service.addMessage(message);
       response.sendRedirect("/zhifou/html/detail.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	 
   }
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Message message =service.doread(id);
        message.setStatus(3);//状态设置为删除（3）
        service.updateMessage(message);
        response.sendRedirect("msgServlet?method=findMsgByUserId");
    }
}
