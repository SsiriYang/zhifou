package com.zhifou.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zhifou.bean.Message;
import com.zhifou.bean.User;
import com.zhifou.bean.active;
import com.zhifou.utils.DataSourceUtils;

public class MsgDaoImpl {
	QueryRunner queryrunner = new QueryRunner(DataSourceUtils.getDataSource());
	    public Message getMsgById(int id){
	        String sql = "select id,from_id,to_id,subject,content,create_time,status from message where id =?";
			try {
				Message message  = queryrunner.query(sql,new BeanHandler<Message>(Message.class),id);
				//System.out.println(update);
				return message;
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}		
	    }
	    public User findUserById(int id){
	        String sql = "select userid,username,usermail,userphoto,usermeans from user where userid=?";
	        
			try {
				User user = queryrunner.query(sql, new BeanHandler<User>(User.class),id);
				return user;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
	    }
	    public void updateMessage(Message message){
	    	String sql = "update message set status=? where id=?";
			int update = 0;
			try {
				update = queryrunner.update(sql,message.getStatus(),message.getId());
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	    public List<Message> getMsgByUserId(int id){
	        List<Message> msglist = new ArrayList();
	        String sql = "select id,from_id,to_id,subject,content,create_time,status from message where to_id ="+id+" and status!=3";
			try {
				msglist  = queryrunner.query(sql,new BeanListHandler<Message>(Message.class));
				//System.out.println(update);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	        System.out.println(msglist);
	        return msglist;
	    }
	    public List<Message> getMsgBytoUserId(int id){
	        List<Message> msglist = new ArrayList();
	        String sql = "select id,from_id,to_id,subject,content,create_time,status from message where from_id ="+id+" and status!=3";
			try {
				msglist  = queryrunner.query(sql,new BeanListHandler<Message>(Message.class));
				//System.out.println(update);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	        System.out.println(msglist);
	        return msglist;
	    }
	    
	    public void addMessage(Message message){
	        String sql = "insert into message(from_id,to_id,subject,content,create_time,status) values(?,?,?,?,?,?)";

	       int update = 0;
			try {
				update = queryrunner.update(sql, message.getFrom_id(),message.getTo_id(),message.getSubject(),message.getContent(),message.getCreate_time(),message.getStatus());
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }


}
