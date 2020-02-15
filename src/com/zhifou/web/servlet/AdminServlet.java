package com.zhifou.web.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhifou.bean.Admin;
import com.zhifou.bean.Category;
import com.zhifou.bean.Notice;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.service.Adminservice;
import com.zhifou.utils.JsonUtils;



@WebServlet("/adminservlet")
public class AdminServlet extends BaseServlet {
	Adminservice adminservice = new Adminservice();
	//管理员登录
/*	public void adminlogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		String adminmail = request.getParameter("adminmail");
		String adminpassword = request.getParameter("adminpassword");
		Admin admin = adminservice.adminlogin(adminmail,adminpassword);
		if(admin!=null){
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			response.sendRedirect("admin/admin-index.jsp");
		}else{
			response.sendRedirect("adminlogin.jsp");
		}
	}*/
	public void questionmanage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//问题首页
		//分页显示
	 	//获取当前页currentpage
	 	int currentpage = 1;
	 	if(request.getParameter("currentpage")!=null){
	 		currentpage = Integer.parseInt(request.getParameter("currentpage"));
	 	}
	 	//根据当前页获取数据集合
	 	List<Question> list = adminservice.getcurrentlist(currentpage);
	 	//获取数据总数totalquestion  总页数page
	 	int totalquestion = adminservice.totalquestion();
	 	int page = totalquestion%15==0?totalquestion/15:totalquestion/15+1;
	 	request.setAttribute("totalquestion", totalquestion);
	 	request.setAttribute("page", page);
	 	request.setAttribute("list", list);
	 	request.setAttribute("currentpage", currentpage);
	 	request.setAttribute("method", "questionmanage");
	 	
	 	//获取问题的类型
	 	List<Category> categorylist = adminservice.getcategory();
	 	request.setAttribute("categorylist", categorylist);
	 	//查询所有用户
	 	List<User> userlist = adminservice.getallusers();
		request.setAttribute("userlist", userlist);
	 	request.getRequestDispatcher("admin/admin-table.jsp").forward(request, response);
	}
	//审核通过
	public void ispassaudit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String questionid = request.getParameter("questionid");
		int ispassaudit = adminservice.ispassaudit(Integer.parseInt(questionid));
		response.getWriter().write(ispassaudit==1?"1":"0");

	}
	
	//撤销通过
	public void nopassaudit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String questionid = request.getParameter("questionid");
		int nopassaudit = adminservice.nopassaudit(Integer.parseInt(questionid));
		response.getWriter().write(nopassaudit==1?"1":"0");

	}
	//问题类型下拉框选择
	public void issearched(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取当前页currentpage
	 	int currentpage = 1;
	 	if(request.getParameter("currentpage")!=null){
	 		currentpage = Integer.parseInt(request.getParameter("currentpage"));
	 	}
		//根据类型id得到集合
	 	int categoryid = 0;
	 	if(request.getParameter("categoryid")!=null){
	 		categoryid = Integer.parseInt(request.getParameter("categoryid"));
	 	}
		List<Question> list = adminservice.issearched(categoryid,currentpage);
		
	 	//获取数据总数totalquestion  总页数page
	 	int totalquestion = adminservice.categorytotalquestion(categoryid);
	 	int page = totalquestion%15==0?totalquestion/15:totalquestion/15+1;
	 	request.setAttribute("totalquestion", totalquestion);
	 	request.setAttribute("page", page);
	 	request.setAttribute("list", list);
	 	request.setAttribute("currentpage", currentpage);
	 	request.setAttribute("method", "issearched");
	 	request.setAttribute("categoryid", categoryid);
	 	//查询所有用户
	 	List<User> userlist = adminservice.getallusers();
		request.setAttribute("userlist", userlist);
	 	//获取问题的类型 -- 调用方法
	 	List<Category> categorylist = null;
	 	categorylist = getcategorylist(request,response);
	 	request.setAttribute("categorylist", categorylist);
	 	request.getRequestDispatcher("admin/admin-table.jsp").forward(request, response);
	}
	//获取问题的类型
	public List<Category> getcategorylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
		List<Category> categorylist = adminservice.getcategory();
		return categorylist;
	}
	//问题类型增加删除
	public void categorymanage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取问题的类型 -- 调用方法
		/*response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
	 	List<Category> categorylist = null;
	 	categorylist = getcategorylist(request,response);
	 	String json = JsonUtils.objectToJson(categorylist);
	 	response.getWriter().write(json);
	}
	//添加新问题类型
	public void addcategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
		String newcategory = request.getParameter("newcategory");
		System.out.println(newcategory);
		int row = adminservice.addnewcategory(newcategory);
		response.getWriter().write(row);
	}
	//搜索字段自动显示
	public void searchword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
		String word = request.getParameter("word");
		if(word!=null){
			List<Object> list = adminservice.searchword(word);
			String json = JsonUtils.objectToJson(list);
			/*Gson gson = new Gson();
			String json = gson.toJson(list);*/
			response.getWriter().write(json);
		}
	}
	//===================================================================================================================================

	//模糊查询
	public void fuzzysearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
		//获取当前页currentpage
	 	int currentpage = 1;
	 	if(request.getParameter("currentpage")!=null){
	 		currentpage = Integer.parseInt(request.getParameter("currentpage"));
	 	}
		//根据模糊条件得到集合
	 	String fuzzy = request.getParameter("fuzzy");
		List<Question> list = adminservice.fuzzysearch(fuzzy,currentpage);
		
	 	//获取数据总数totalquestion  总页数page
	 	int totalquestion = adminservice.fuzzytotalquestion(fuzzy);
	 	int page = totalquestion%15==0?totalquestion/15:totalquestion/15+1;
	 	request.setAttribute("totalquestion", totalquestion);
	 	request.setAttribute("page", page);
	 	request.setAttribute("list", list);
	 	request.setAttribute("currentpage", currentpage);
	 	request.setAttribute("method", "fuzzysearch");
	 	request.setAttribute("fuzzy", fuzzy);
	 	//查询所有用户
	 	List<User> userlist = adminservice.getallusers();
		request.setAttribute("userlist", userlist);
	 	//获取问题的类型
	 	List<Category> categorylist = adminservice.getcategory();
	 	request.setAttribute("categorylist", categorylist);
	 	request.getRequestDispatcher("admin/admin-table.jsp").forward(request, response);
	}
	//===================================================================================================================================
	//公告
	public void notice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");*/
		String noticetitle = request.getParameter("noticetitle");
		String noticecontent = request.getParameter("noticecontent");
		int noticeproposer = 1;
		//查询所有管理员
	 	List<Admin> adminlist = adminservice.getalladmin();
	 	if(adminlist!=null){
	 		for(Admin i: adminlist){
	 			if(i.getAdminname().equals(request.getParameter("noticeproposer"))){
	 				noticeproposer = i.getAdminid();
	 			}
	 		}
	 	}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String noticerelease = df.format(new java.util.Date());// new Date()为获取当前系统时间 
		Notice newnotice = adminservice.addnotice(noticetitle,noticecontent,noticeproposer,noticerelease);
		String json = JsonUtils.objectToJson(newnotice);
		response.getWriter().write(json);
		
		ServletContext servletContext = this.getServletContext();
		servletContext.setAttribute("newnotice", newnotice);
	}
	//获取最新公告
	/*public void getnewnotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Notice newnotice = adminservice.getnewnotice();
		
	}*/
	//检查公告名是否存在
	public void checktitle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		Boolean isexit = adminservice.checktitle(title);
		response.getWriter().write(isexit?"1":"0");
	}
	//检查管理员是否存在
	public void checkproposer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proposer = request.getParameter("proposer");
		Boolean isexit = adminservice.checkproposer(proposer);
		response.getWriter().write(isexit?"1":"0");
	}
	//检查问题类型名是否存在
	public void checknewcategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newcategory = request.getParameter("newcategory");
		Boolean isexit = adminservice.checknewcategory(newcategory);
		response.getWriter().write(isexit?"1":"0");
	}
	//===================================================================================================================================

	//管理员修改个人信息
	public void changeadmininformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminname = request.getParameter("adminname");
		String adminpassword = request.getParameter("adminpassword");
		String adminmail = request.getParameter("adminmail");
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		int adminid = admin.getAdminid();
		Admin newadmin = adminservice.changeadmininformation(adminid,adminname,adminpassword,adminmail);
		if(newadmin!=null){
			session.setAttribute("admin", newadmin);
			response.getWriter().write("1");
		}else{
			response.getWriter().write("0");
		}
		
	}
	//===================================================================================================================================
	//管理员退出登录
	public void adminexit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getServletContext().removeAttribute("admin");
		response.sendRedirect("/zhifou/adminlogin.jsp");
	}
	
}
