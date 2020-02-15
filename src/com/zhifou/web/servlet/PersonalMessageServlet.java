package com.zhifou.web.servlet;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.zhifou.bean.Answer;
import com.zhifou.bean.Category;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.bean.UserIndex;
import com.zhifou.service.PersonalMessageService;
import com.zhifou.service.RecommendService;


@WebServlet("/personalmessageservlet")
public class PersonalMessageServlet extends BaseServlet {
	RecommendService recommendService = new RecommendService();
	PersonalMessageService personalmessageservice = new PersonalMessageService();
	public void uploadpersonalmessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userphoto = request.getParameter("userphoto");
		String username = request.getParameter("username");
		String userpassword = request.getParameter("userpassword");
		String usermail = request.getParameter("usermail");
		String usermeans = request.getParameter("usermeans");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");		
		int row = personalmessageservice.uploadpersonalmessage(user.getUserid(),userphoto,username,userpassword,usermail,usermeans);
		user.setUsermeans(usermeans);
		session.setAttribute("user", user);
		response.getWriter().write(row>0?"1":"0");
	}
	
	
	public void personalAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	   User user = (User)request.getSession().getAttribute("user");
	   int userid = user.getUserid();  
	   List<Answer> answers = personalmessageservice.personalAnswer(userid);
	   RecommendService recommendService = new RecommendService();
	   List<UserIndex> userindexs = new ArrayList<>();
	   for (Answer answer : answers) {
		   Question question = recommendService.FindQuestionById(answer.getQuestionid());
		   Category category = recommendService.FindCategoryByID(question.getCategoryid());
		   UserIndex userindex = recommendService.CreateUserIndex(user, answer, question, category);
		   userindexs.add(userindex);
	}
	   request.setAttribute("otherUser", user);
	   request.setAttribute("answers", userindexs);
	   request.getRequestDispatcher("personalCenter.jsp").forward(request, response);		
	}
	
	
	public void modifyData(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");		
		User user = (User)request.getSession().getAttribute("user");
		Integer userid = user.getUserid();
		String userphoto = user.getUserphoto();
		String usermeans = user.getUsermeans();
		String username = null;
		String userpassword = null;
		String usermail = null ;	
		
		try {
			// 浣跨敤Apache鏂囦欢涓婁紶缁勪欢澶勭悊鏂囦欢涓婁紶姝ラ锛�
			// 1銆佸垱寤轰竴涓狣iskFileItemFactory宸ュ巶
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2銆佸垱寤轰竴涓枃浠朵笂浼犺В鏋愬櫒
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 瑙ｅ喅涓婁紶鏂囦欢鍚嶇殑涓枃涔辩爜  
            upload.setHeaderEncoding("utf-8"); 
						
			// 4銆佷娇鐢⊿ervletFileUpload瑙ｆ瀽鍣ㄨВ鏋愪笂浼犳暟鎹紝瑙ｆ瀽缁撴灉杩斿洖鐨勬槸涓�涓狶ist<FileItem>闆嗗悎锛屾瘡涓�涓狥ileItem瀵瑰簲涓�涓狥orm琛ㄥ崟鐨勮緭鍏ラ」
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// 濡傛灉fileitem涓皝瑁呯殑鏄櫘閫氳緭鍏ラ」鐨勬暟鎹�
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("UTF-8");
					switch(name){
						case "username": 
							username = value;
							break;
						case "userpassword":
							userpassword= value;
							break;
						case "usermail": 
							usermail=value;
							break;
						case "usermeans":
							usermeans = value;							
							break;						
					}
					System.out.println(name + "=" + value);
					System.out.println(usermeans);

				} else {
					
				  if(item!=null){
					// 璇诲彇涓婁紶鐨勬枃浠�
					InputStream is = item.getInputStream();
					// aa.jpg bb.txt cc.rar
					String filename = item.getName();
					String subfix = filename.substring(filename.indexOf("."));
					String nfilename = new Date().getTime() + subfix;

					userphoto = "/img/" + filename;
					File file = new File("/home/www/upload/"+filename);	
				//	File file = new File("E:\\upload\\" + filename);
					if (!file.exists()) {
						file.createNewFile();
					}

					FileOutputStream fos = new FileOutputStream(file);

					// 杞瓨鏂囦欢
					byte[] b = new byte[512];
					int len = -1;// 鏍囪鏂囦欢鏄惁璇诲彇缁撴潫
					while ((len = is.read(b)) != -1) {
						fos.write(b, 0, len);
					}
					is.close();
					fos.close();
				  }
				  
				  
				}
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		//璋冪敤service灞傛彃鍏ユ暟鎹簱
		int row = personalmessageservice.uploadpersonalmessage(userid, userphoto, username, userpassword, usermail, usermeans);
		//鏇存柊鐢ㄦ埛淇℃伅
		User user1 = recommendService.FindUserByID(userid);
		request.getSession().setAttribute("user", user1);
		request.getRequestDispatcher("personalmessageservlet?method=personalAnswer").forward(request, response);	
	}


}












