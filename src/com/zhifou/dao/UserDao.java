package com.zhifou.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.zhifou.bean.User;
import com.zhifou.utils.DataSourceUtils;


public class UserDao {
	QueryRunner queryrunner = new QueryRunner(DataSourceUtils.getDataSource());
	//检查用户名是否存在
	public Boolean userNameIsExit(String username){
		String sql = "select * from user where username = ?";
		User user = null;
		try {
			user = queryrunner.query(sql, new BeanHandler<User>(User.class), username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user!=null?true:false;
	}
	//登录
	public User login(String usermail, String password) {
		String sql = "select * from user where usermail = ? and userpassword = ?";
		User user = null;
		try {
			user = queryrunner.query(sql, new BeanHandler<User>(User.class), usermail,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	//注册
	public Boolean register(String username, String userpassword, String usermail) {
		String sql = "insert into user(username,userpassword,usermail) values(?,?,?)";
		int update = 0;
		try {
			update = queryrunner.update(sql, username,userpassword,usermail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update>0?true:false;
	}
	//检查邮箱是否存在
	public Boolean usermailcheck(String usermail) {
		String sql = "select * from user where usermail = ?";
		User user = null;
		try {
			user = queryrunner.query(sql, new BeanHandler<User>(User.class), usermail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user!=null?true:false;
	}
	//忘记密码
	public Boolean forgetpassword(String usermail, String userpassword) {
		String sql = "UPDATE user SET userpassword =? WHERE usermail = ?";
		int row = 0;
		try {
			row = queryrunner.update(sql, userpassword,usermail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row>0?true:false;
	}
 
	

}
