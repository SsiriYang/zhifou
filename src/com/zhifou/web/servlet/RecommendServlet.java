package com.zhifou.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhifou.bean.Answer;
import com.zhifou.bean.Category;
import com.zhifou.bean.Collection;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.bean.UserIndex;
import com.zhifou.service.Adminservice;
import com.zhifou.service.CollectionService;
import com.zhifou.service.RecommendService;
import com.zhifou.utils.JsonUtils;

import redis.clients.jedis.Jedis;

@WebServlet("/recommend")
public class RecommendServlet extends BaseServlet {
	private int pz = 3;// 定义每页显示的记录数
	private int count = 1;// 进入首页后默认查看更多是没有点击过的，直接查询前十条

	public void searchQuestionIndex(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		User loginuser = (User) request.getSession().getAttribute("user");
		RecommendService service = new RecommendService();// 生成RecommendService对象
		if (request.getSession().getAttribute("search") != null) {
			request.getSession().removeAttribute("search");
		}
		count = 1;
		List<Answer> answers = service.FindQuestionByPage(count, pz);// 进入首页首先获取pz条数据
		count++;
		List<UserIndex> userindexs = new ArrayList<>();
		// 遍历answer，通过answerid查询到问题，然后找到作者，找到类型。组装成一个userindex对象
		if(loginuser!=null){
			CollectionService collectionService = new CollectionService();
			for (Answer answer : answers) {
				User user = service.FindUserByID(answer.getAnswerproposer());
				Question question = service.FindQuestionById(answer.getQuestionid());
				Category category = service.FindCategoryByID(question.getCategoryid());
				List<Collection> list = collectionService.getCollection(loginuser.getUserid());
				UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
				for (Collection collection : list) {
					if(collection.getAnswerid()==answer.getAnswerid()){
						userindex.setStatus(1);
					}
				}
				userindexs.add(userindex);
			}
		}else{
			for (Answer answer : answers) {
				User user = service.FindUserByID(answer.getAnswerproposer());
				Question question = service.FindQuestionById(answer.getQuestionid());
				Category category = service.FindCategoryByID(question.getCategoryid());
				UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
				userindexs.add(userindex);
			}
		}
		
		request.getSession().setAttribute("userindexs", userindexs);
		response.sendRedirect("index.jsp");
	}

	public void searchQuestionByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		User loginuser = (User) request.getSession().getAttribute("user");
		RecommendService service = new RecommendService();
		if (request.getSession().getAttribute("search") != null) {
			count = service.GetAllAnswer();// 如果session中有search，说明现在这个界面是搜索得到的。我们不能再显示更多了
		}
		List<Answer> answers = service.FindQuestionByPage(count, pz);
		count++;
		List<UserIndex> userindexs = new ArrayList<>();
		if(loginuser!=null){
			CollectionService collectionService = new CollectionService();
			for (Answer answer : answers) {
				User user = service.FindUserByID(answer.getAnswerproposer());
				Question question = service.FindQuestionById(answer.getQuestionid());
				Category category = service.FindCategoryByID(question.getCategoryid());
				List<Collection> list = collectionService.getCollection(loginuser.getUserid());
				UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
				for (Collection collection : list) {
					if(collection.getAnswerid()==answer.getAnswerid()){
						userindex.setStatus(1);
					}
				}
				userindexs.add(userindex);
			}
		}else{
			for (Answer answer : answers) {
				User user = service.FindUserByID(answer.getAnswerproposer());
				Question question = service.FindQuestionById(answer.getQuestionid());
				Category category = service.FindCategoryByID(question.getCategoryid());
				UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
				userindexs.add(userindex);
			}
		}
		String jsonData = JsonUtils.objectToJson(userindexs);
		System.out.println(jsonData);
		response.getWriter().write(jsonData);
	}

	public void showAnswerDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String value = request.getParameter("answerid");
		User loginuser=(User)request.getSession().getAttribute("user");
		int answerid = Integer.parseInt(value);
		RecommendService service = new RecommendService();
		service.addAnswerCount(answerid);//浏览次数+1
		CollectionService collectionService = new CollectionService();
		Answer answer = service.FindAnswerByID(answerid);
		User user = service.FindUserByID(answer.getAnswerproposer());
		Question question = service.FindQuestionById(answer.getQuestionid());
		Category category = service.FindCategoryByID(question.getCategoryid());
		UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
		List<Collection> list = collectionService.getCollection(loginuser.getUserid());
		for (Collection collection : list) {
			if(collection.getAnswerid()==answer.getAnswerid()){
				userindex.setStatus(1);
			}
		}
		int number = service.GetCollectNumber(answerid);
		Jedis j = null;
		j = new Jedis("127.0.0.1", 6379);
		if ((j.get("answer:" + answerid)) != null) {

			BitSet b = byteArray2BitSet(j.get("answer:" + answerid).getBytes());

			int lognum = b.cardinality();
			System.out.println("问题编号" + answerid + "点赞数是：" + lognum);
			request.getSession().setAttribute("nums", lognum);
		}else{
			int lognum = 0;
			request.getSession().setAttribute("nums", lognum);
		}
		// response.getWriter().print(lognum);
		request.getSession().setAttribute("AnswerDetail", userindex);
		request.getSession().setAttribute("collectnumber", number);
		// request.setAttribute("nums", lognum);
		try {
			response.sendRedirect("/zhifou/html/detail.jsp");
			// request.getRequestDispatcher("html/detail.jsp").forward(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static BitSet byteArray2BitSet(byte[] bytes) {
		BitSet bitSet = new BitSet(bytes.length * 8);
		int index = 0;
		for (int i = 0; i < bytes.length; i++) {
			for (int j = 7; j >= 0; j--) {
				bitSet.set(index++, (bytes[i] & (1 << j)) >> j == 1 ? true : false);
			}
		}
		return bitSet;
	}

	public void searchLikeQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fuzzy = request.getParameter("search");
		request.getSession().setAttribute("search", fuzzy);
		RecommendService service = new RecommendService();
		if(fuzzy==""){		
			searchQuestionIndex(request,response);
			return;
		}
		List<Question> questions = service.searchLikeQuestion(fuzzy);
		List<UserIndex> userindexs = new ArrayList<>();
		for (Question question : questions) {
			Answer answer = service.MaxCountAnswer(question.getQuestionid());
			Category category = service.FindCategoryByID(question.getCategoryid());
			User user = service.FindUserByID(answer.getAnswerproposer());
			UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
			userindexs.add(userindex);
		}
		request.getSession().setAttribute("userindexs", userindexs);
		response.sendRedirect("index.jsp");
	}

	public void showQuestionDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String value = request.getParameter("questionid");
		int questionid = Integer.parseInt(value);
		RecommendService service = new RecommendService();
		Question q = service.FindQuestionByQuestionID(questionid);
		int number = service.GetQuestionNumber(questionid);
		request.getSession().setAttribute("number", number);
		request.getSession().setAttribute("Question", q);// 存一个question，存放最上面标题等信息
		service.addQuestionCount(questionid);//问题浏览次数+1
		List<Answer> answers = service.FindAllAnswer(questionid);
		List<UserIndex> userindexs = new ArrayList<>();
		for (Answer answer : answers) {
			User user = service.FindUserByID(answer.getAnswerproposer());
			Question question = service.FindQuestionById(answer.getQuestionid());
			Category category = service.FindCategoryByID(question.getCategoryid());
			UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
			userindexs.add(userindex);
		}
		request.getSession().setAttribute("AllAnswers", userindexs);
		response.sendRedirect("/zhifou/html/answerlist.jsp");
	}

	// 搜索字段自动显示
	public void searchword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * response.setContentType("text/html;charset=UTF-8");
		 * request.setCharacterEncoding("UTF-8");
		 */
		String word = request.getParameter("word");
		if (word != null) {
			Adminservice adminservice = new Adminservice();
			List<Object> list = adminservice.searchword(word);
			String json = JsonUtils.objectToJson(list);
			/*
			 * Gson gson = new Gson(); String json = gson.toJson(list);
			 */
			response.getWriter().write(json);
		}
	}
	public void SearchCategory(HttpServletRequest request, HttpServletResponse response) throws IOException{
		RecommendService service = new RecommendService();
		List<Category> categorys = service.SearchCategory();
		String jsondata = JsonUtils.objectToJson(categorys);
		System.out.println(jsondata);
		response.getWriter().write(jsondata);
	}
	public void getAllQuestions(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		RecommendService service = new RecommendService();
		List<Question> questions = service.getAllQuestions();
		request.setAttribute("questions",questions);
		request.getRequestDispatcher("/html/QuestionIndex.jsp").forward(request, response);
	}
	public void findUserCenter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String userid = request.getParameter("userid");
		Integer id = Integer.parseInt(userid);
		RecommendService service = new RecommendService();
		List<Answer> answers = service.GetAnswerByUserId(id);
		User user = service.FindUserByID(id);
	    List<UserIndex> userindexs = new ArrayList<>();
		for (Answer answer : answers) {
			Question question = service.FindQuestionById(answer.getQuestionid());
			Category category = service.FindCategoryByID(question.getCategoryid());
			UserIndex userindex = service.CreateUserIndex(user, answer, question, category);
			userindexs.add(userindex);
		}
		request.setAttribute("otherUser", user);
		request.setAttribute("answers", userindexs);
		request.getRequestDispatcher("personalCenter.jsp").forward(request, response);		
	}
}
