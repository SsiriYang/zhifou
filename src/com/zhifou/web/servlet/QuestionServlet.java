package com.zhifou.web.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.service.QuestionServiceImpl;


@WebServlet("/ask")
public class QuestionServlet extends BaseServlet {
	
	
	public void ask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Question question = new Question();
		String questiontitle= request.getParameter("questiontitle");
		String questioncontent= request.getParameter("questioncontent");
		String questionphoto=request.getParameter("questionphoto");
		String categoryid =request.getParameter("categoryid");
		
		question.setQuestiontitle(questiontitle);
		question.setQuestioncontent(questioncontent);
		question.setQuestionphoto(questionphoto);
		question.setCategoryid(Integer.parseInt(categoryid));
		User user=(User) request.getSession().getAttribute("user");		
		question.setQuestionproposer(user.getUserid());				
		// 数据库的插入
		QuestionServiceImpl service = new QuestionServiceImpl();
		response.sendRedirect("/zhifou/recommend?method=searchQuestionIndex");
		service.add(question);
	}
}
