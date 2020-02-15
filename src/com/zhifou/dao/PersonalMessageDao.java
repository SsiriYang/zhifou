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
public class PersonalMessageDao {
	
	QueryRunner queryrunner = new QueryRunner(DataSourceUtils.getDataSource());
	public int uploadpersonalmessage(Integer userid, String userphoto, String username, String userpassword,
			String usermail, String usermeans) {
		String sql = "UPDATE user SET username = ?, userpassword = ?,usermail = ?, userphoto = ? , usermeans = ? WHERE userid = ?";
		int row = 0;
		try {
			row = queryrunner.update(sql, username,userpassword,usermail,userphoto,usermeans,userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	//根据用户id查询answer表中answerproposer对应的记录 参数是userid，返回结果是List<Answer>
	public List<Answer>  findAnswerByAnswerproposer(int userid){
		String sql = "select * from answer where answerproposer = ?";
		List<Answer> answerList=null;
		try {
			answerList = queryrunner.query(sql, new BeanListHandler<Answer>(Answer.class),userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return answerList;	
	}
	
	//根据answer表回答的外键questionid去查question表里的记录。返回结果是Question，参数是questionID
		
	//根据回答表的问题id查询出该问题
		public Question FindQuestionById(int questionid){
			String sql = "select * from question where questionid = ?";
			Question question = new Question();
			try {
				question = queryrunner.query(sql, new BeanHandler<Question>(Question.class),questionid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return question;	
		}
	
	
}
