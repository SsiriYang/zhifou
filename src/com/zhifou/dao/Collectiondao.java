package com.zhifou.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.zhifou.bean.Answer;
import com.zhifou.bean.Collection;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.utils.DataSourceUtils;

public class Collectiondao {
	QueryRunner queryrunner= new QueryRunner(DataSourceUtils.getDataSource());
	//获得所以收藏记录集合
	public List<Collection> getCollection(int userid){
		
		String sql="select * from collection where userid=?";
		List<Collection> list=null;
        try {
			list=queryrunner.query(sql, new BeanListHandler<Collection>(Collection.class),userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return list;
	}
	
	
	
	//根据收藏的answerid找到answer的内容
	public Answer getAnswer(int answerid){
		String sql="select * from answer where answerid=?";
		Answer answer=new Answer();
		try {
			answer=queryrunner.query(sql, new BeanHandler<Answer>(Answer.class),answerid);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return answer;
	}
	//根据answer的questionid找question的内容
	public Question getQuestion(int questionid){
		String sql="select * from question where questionid=?";
		Question question=new Question();
		try {
			question=queryrunner.query(sql, new BeanHandler<Question>(Question.class),questionid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question;
	}
	
	//根据回答者id找到此回答者用户信息
	public User FindUserByID(int id){
		String sql = "select * from user where userid = ?";
		User user = null;
		try {
			user = queryrunner.query(sql, new BeanHandler<User>(User.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	//点击收藏时添加到数据库
	public Boolean addCollection(int userid,int questionid,int answerid){
		String sql="insert into collection(userid,questionid,answerid) values(?,?,?)";
		int update=0;
		
		try {
			update=queryrunner.update(sql,userid,questionid,answerid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return update>0?true:false;
		
	}
	
	
	//删除收藏
		public int deleteCollection(int collectionid){
			String sql = "delete from collection where collectionid=?";
			int row = 0;
			try {
				row = queryrunner.update(sql,collectionid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return row;
		}		


	
	
	
}
