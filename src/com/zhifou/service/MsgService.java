package com.zhifou.service;

import java.util.ArrayList;
import java.util.List;

import com.zhifou.bean.*;
import com.zhifou.dao.MsgDaoImpl;

public class MsgService {
	
	    MsgDaoImpl msgDao = new MsgDaoImpl();
	    //DaoImpl userDao = new DaoImpl();
	    public Message doread(int id ){	        
	       Message message = msgDao.getMsgById(id);
	       return message;
	    }
	    public User findUserById(int fromid){
	        //通过i对方送人的id查找发送者
	        User user = msgDao.findUserById(fromid);
	        return user;
	    	
	    }
	    public void updateMessage(Message message){
	        msgDao.updateMessage(message);
	        

	    }
	    public List<Message> getMsgByUserId(int id){
	        List<Message> messageList = new ArrayList();
	        messageList = msgDao.getMsgByUserId(id);
	        return  messageList;
	    }
	    public List<Message> getMsgBytoUserId(int id){
	        List<Message> messageList = new ArrayList();
	        messageList = msgDao.getMsgBytoUserId(id);
	        return  messageList;
	    }
	    public void addMessage(Message message){
	        msgDao.addMessage(message);
	    }
//	    public List<User> getUsersExceptId(int id){
//	        List<User> otherUsers = userDao.getUsersExceptId(id);
//	        return otherUsers;
//	    }

	

}
