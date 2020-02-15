package com.zhifou.service;

import java.util.List;

import com.zhifou.bean.Answer;
import com.zhifou.dao.PersonalMessageDao;

public class PersonalMessageService {
	PersonalMessageDao personalmessagedao =new PersonalMessageDao();
	public int uploadpersonalmessage(Integer userid,String userphoto, String username, String userpassword, String usermail,
			String usermeans) {
		return personalmessagedao.uploadpersonalmessage(userid, userphoto, username, userpassword, usermail, usermeans);
	}
	
	public List<Answer> personalAnswer(int userid){
		return personalmessagedao.findAnswerByAnswerproposer(userid);
	}
    
	
	
}
