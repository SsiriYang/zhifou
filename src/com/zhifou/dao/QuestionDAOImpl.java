package com.zhifou.dao;
import java.sql.PreparedStatement;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;

import com.zhifou.bean.Question;
import com.zhifou.utils.DataSourceUtils;

public class QuestionDAOImpl implements QuestionDAO {
	@Override
	public void add(Question question) {
		// TODO Auto-generated method stub
		
		
		String sql = "insert into question(questiontitle,questioncontent,questionphoto,categoryid,questionproposer,questionmadetime)"
				+ " values(?,?,?,?,?,?)";

		PreparedStatement psmt=null;
		try {
			
			psmt = DataSourceUtils.getConnection().prepareStatement(sql);	
			System.out.println(question.getQuestiontitle());
			psmt.setString(1, question.getQuestiontitle());
			psmt.setString(2, question.getQuestioncontent());
			psmt.setString(3, question.getQuestionphoto());
			psmt.setObject(4, question.getCategoryid());	
			psmt.setObject(5, question.getQuestionproposer());
			psmt.setObject(6,new Date());
			psmt.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
