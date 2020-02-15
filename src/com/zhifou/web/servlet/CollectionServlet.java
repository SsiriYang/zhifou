package com.zhifou.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhifou.bean.Answer;
import com.zhifou.bean.Collection;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.bean.UserIndex;
import com.zhifou.service.CollectionService;

@WebServlet("/collection")
public class CollectionServlet extends BaseServlet{
	CollectionService collectionservice=new CollectionService();
	//查询显示在用户收藏页面收藏列表的
	public void getMyCollection(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		User user1=(User)request.getSession().getAttribute("user");
		int userid=user1.getUserid();
		
		List<UserIndex> Uindex=new ArrayList();
		List<Collection> list=collectionservice.getCollection(userid);
		for (Collection collection : list) {
			Answer answer=collectionservice.getAnswer(collection.getAnswerid());
			Question question=collectionservice.getQuestion(answer.getQuestionid());
			//这个是从回答表中得到回答者的id
			int id=answer.getAnswerproposer();
			//调用方法得到回答者的信息
			User user=collectionservice.FindUserByID(id);
			//得到的都封装到一个userindex对象里
			UserIndex userindex=new UserIndex();
			userindex.setAnswer_count(answer.getAnswer_count());
			userindex.setAnswercontent(answer.getAnswercontent());
			userindex.setAnswerid(answer.getAnswerid());
			userindex.setAnswerproposer(answer.getAnswerproposer());
			userindex.setAnswertime(answer.getAnswertime());
			userindex.setCategoryid(question.getCategoryid());
			userindex.setIspassaudit(question.getIspassaudit());
			userindex.setQuestion_count(question.getQuestion_count());
			userindex.setQuestioncontent(question.getQuestioncontent());
			userindex.setQuestionid(question.getQuestionid());
			userindex.setQuestionmadetime(question.getQuestionmadetime());
			userindex.setQuestionphoto(question.getQuestionphoto());
			userindex.setQuestionproposer(question.getQuestionproposer());
			userindex.setQuestiontitle(question.getQuestiontitle());
			userindex.setUserid(user.getUserid());
			userindex.setUsermail(user.getUsermail());
			userindex.setUsername(user.getUsername());
			userindex.setUserphoto(user.getUserphoto());
			userindex.setUserpassword(user.getUserpassword());
			userindex.setCollectionid(collection.getCollectionid());
			//再添加到一个Uindex集合
			Uindex.add(userindex);
		
		}
		request.getSession().setAttribute("uindex", Uindex);
		response.sendRedirect("html/collect.jsp");
	
	}
	
	//点击收藏添加到收藏表中
	
	public void addCollection(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		//得到当前userid
		User user=(User)request.getSession().getAttribute("user");
		int userid=user.getUserid();
		//得到ajax传来的参数
		String answerid=request.getParameter("answerid");
		int answerid1=Integer.parseInt(answerid);
		String questionid=request.getParameter("questionid");
		int questionid1=Integer.parseInt(questionid);
		//得到数据库已有的answerid,和要收藏的比较，如果一样则不能再收藏
		List<Collection> list=collectionservice.getCollection(userid);
		for (Collection collection : list) {
			if(answerid1==collection.getAnswerid()){
				return;
			}
			
		}
		Boolean collect=collectionservice.addCollection(userid, questionid1, answerid1);
		try {
		//判断插入成功才跳收藏成功
		response.getWriter().write(collect==true?"true":"false");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	
	//删除收藏
    public void deleteCollection(HttpServletRequest request, HttpServletResponse response) throws IOException{
   	request.setCharacterEncoding("UTF-8");
 		response.setContentType("UTF-8");
 		String collectionid = request.getParameter("collectionid");
 		int id = Integer.parseInt(collectionid);
 		int deletecollection = collectionservice.deleteCollection(id);
 		response.getWriter().write(deletecollection==1?"1":"0");
    }
	
	
}
