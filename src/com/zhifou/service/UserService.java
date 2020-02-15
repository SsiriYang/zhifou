package com.zhifou.service;

import com.zhifou.bean.User;
import com.zhifou.dao.UserDao;

public class UserService {
	UserDao userdao = new UserDao();
	public Boolean userNameIsExit(String username){
		return userdao.userNameIsExit(username);
	}

	public User login(String usermail, String password) {
		return userdao.login(usermail,password);

	}

	public Boolean register(String username, String userpassword, String usermail) {
		return userdao.register(username,userpassword,usermail);
	}
	//检查邮箱是否存在
	public Boolean usermailcheck(String usermail) {
		return userdao.usermailcheck(usermail);
	}
	//忘记密码
	public Boolean forgetpassword(String usermail,String userpassword) {
		return userdao.forgetpassword(usermail,userpassword);
	}
	

}
