package com.zhifou.web.servlet;

import java.io.IOException;
import java.text.ParseException;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhifou.bean.Answer;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.dao.AnswerDAOImpl;
import com.zhifou.service.AnswerServiceImpl;
import com.zhifou.service.QuestionServiceImpl;

@WebServlet("/answer")
public class AnswerServlet extends BaseServlet {
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Answer answer = new Answer();
		String answercontent = request.getParameter("answercontent");
		answer.setAnswercontent(answercontent);
		User user=(User) request.getSession().getAttribute("user");		
		answer.setAnswerproposer(user.getUserid());
		Question question=(Question) request.getSession().getAttribute("Question");
		Integer questionid=question.getQuestionid();
		answer.setQuestionid(questionid);	
		System.out.println(answer);
		AnswerServiceImpl service = new AnswerServiceImpl();
		response.sendRedirect("/zhifou/recommend?method=showQuestionDetail&questionid="+questionid);
		service.add(answer);
	}
}
