package com.zhifou.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zhifou.bean.Admin;
import com.zhifou.bean.Category;
import com.zhifou.bean.Notice;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.utils.DataSourceUtils;

public class Admindao {
	QueryRunner queryrunner= new QueryRunner(DataSourceUtils.getDataSource());
	//获取每页的问题集合
	public List<Question> getcurrentlist(int currentpage) {
		/*	pc 
		 *   1   0,15      15*(currentpage-1)
		 * 	 2   15,15
		 * 	 3   30,15
		 */
		String sql = "select * from question limit "+15*(currentpage-1)+",15 ";
		List<Question> list = null;
		try {
			list = queryrunner.query(sql, new BeanListHandler<Question>(Question.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//获取问题总数
	public int totalquestion() {
		String sql = "select count(*) from question";
		Number count = 0;
		try {
			count = (Number) queryrunner.query(sql, new ScalarHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count.intValue();
	}
	//获取问题类型结果总数 下拉框
	public List<Category> getcategory() {
		String sql = "select * from category";
		List<Category> categorylist = null;
		try {
			categorylist=queryrunner.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categorylist;
	}
	//审核通过
	public int ispassaudit(int questionid) {
		String sql = "UPDATE question SET ispassaudit =1 WHERE questionid = ?";
		int row = 0;
		try {
			row = queryrunner.update(sql,questionid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	//撤销通过
	public int nopassaudit(int questionid) {
		String sql = "UPDATE question SET ispassaudit =0 WHERE questionid = ?";
		int row = 0;
		try {
			row = queryrunner.update(sql,questionid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	//获取问题类型结果集合 下拉框
	public List<Question> issearched(int categoryid, int currentpage) {
		String sql = "select * from question where categoryid = ? limit "+15*(currentpage-1)+",15 ";
		List<Question> list = null;
		try {
			list = queryrunner.query(sql, new BeanListHandler<Question>(Question.class),categoryid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//获取问题类型结果总数 下拉框
	public int categorytotalquestion(int categoryid) {
		String sql = "select count(*) from question where categoryid = ?";
		Number count = 0;
		try {
			count = (Number) queryrunner.query(sql, new ScalarHandler(),categoryid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count.intValue();
	}
	//搜索字段自动显示  //单词字段查询搜索显示
	public List<Object> searchword(String word) {
		String sql = "select * from question where questiontitle like ? limit 0,5";
		List<Object> list = null;
		try {
//			list = queryrunner.query(sql, new ColumnListHandler(), "%"+word+"%");
			list = queryrunner.query(sql, new ColumnListHandler("questiontitle"), "%"+word+"%");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	//模糊查询
	//根据模糊条件得到集合
	public List<Question> fuzzysearch(String fuzzy, int currentpage) {
		String sql = "select * from question where questiontitle like ? limit "+15*(currentpage-1)+",15 ";
		List<Question> list = null;
		try {
			list = queryrunner.query(sql, new BeanListHandler<Question>(Question.class), "%"+fuzzy+"%");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//模糊查询 根据条件结果总数
	public int fuzzytotalquestion(String fuzzy) {
		String sql = "select count(*) from question where questiontitle like ?";
		Number count = 0;
		try {
			count = (Number) queryrunner.query(sql, new ScalarHandler(), "%"+fuzzy+"%");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count.intValue();
	}
	//管理员登录
	public Admin adminlogin(String adminmail, String adminpassword) {
		String sql = "select * from admin where adminmail = ? and adminpassword = ?";
		Admin admin = null;
		try {
			admin = queryrunner.query(sql, new BeanHandler<Admin>(Admin.class), adminmail,adminpassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
	//查询所有用户
	public List<User> getallusers() {
		String sql = "select * from user";
		List<User> list = null;
		try {
			list = queryrunner.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//发布公告并回显
	public Notice addnotice(String noticetitle, String noticecontent, Integer noticeproposer, String noticerelease) {
		String sql = "insert into notice (noticetitle,noticecontent,noticerelease,noticeproposer) values(?,?,?,?)";
		String sql2 = "select * from notice where noticetitle = ? ";
		Notice notice = null;
		try {
			queryrunner.update(sql, noticetitle,noticecontent,noticerelease,noticeproposer);
			notice = queryrunner.query(sql2, new BeanHandler<Notice>(Notice.class),noticetitle);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}
	//获取所有管理员
	public List<Admin> getalladmin() {
		String sql = "select * from admin";
		List<Admin> list = null;
		try {
			list = queryrunner.query(sql, new BeanListHandler<Admin>(Admin.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//获取最新公告
	public Notice getnewnotice() {
		String sql = "select * from notice ORDER BY noticeid DESC LIMIT 1";
		Notice newnotice = null;
		try {
			newnotice = queryrunner.query(sql, new BeanHandler<Notice>(Notice.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newnotice;
	}
	//添加新问题类型
	public int addnewcategory(String newcategory) {
		String sql = "insert into category (categoryname) values(?)";
		int row = 0;
		try {
			row = queryrunner.update(sql, newcategory);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}
	//检查公告名是否存在
	public Boolean checktitle(String title) {
		String sql = "select * from notice where noticetitle = ?";
		Notice notice = null;
		try {
			notice = queryrunner.query(sql, new BeanHandler<Notice>(Notice.class), title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice!=null?true:false;
	}
	//检查管理员是否存在
	public Boolean checkproposer(String proposer) {
		String sql = "select * from admin where adminname = ?";
		Admin admin = null;
		try {
			admin = queryrunner.query(sql, new BeanHandler<Admin>(Admin.class), proposer);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin!=null?true:false;
	}
	//检查问题类型名是否存在
	public Boolean checknewcategory(String newcategory) {
		String sql = "select * from category where categoryname = ?";
		Category category = null;
		try {
			category = queryrunner.query(sql, new BeanHandler<Category>(Category.class), newcategory);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return category!=null?true:false;
	}
	//管理员修改个人信息
	public Admin changeadmininformation(Integer adminid,String adminname, String adminpassword, String adminmail) {
		/*List<String> messagelist = null;
		Admin admin = null;
		try {
			String sql = "select * from admin where adminid = ? ";
			admin = queryrunner.query(sql,new BeanHandler<Admin>(Admin.class),adminid);
		} catch (SQLException e){
			e.printStackTrace();
		}
		if(admin.getAdminname().trim().equals(adminname)){
			messagelist.add(adminname);
		}
		if(admin.getAdminpassword().trim().equals(adminpassword)){
			messagelist.add(adminpassword);
		}
		if(admin.getAdminmail().trim().equals(adminmail)){
			messagelist.add(adminmail);
		}
		if(messagelist!=null){
			return messagelist;
		}else{
			String sql = "UPDATE admin SET adminname = ? and adminpassword = ? and adminmail = ? WHERE adminid = ?";
			try {
				queryrunner.update(sql, adminname,adminpassword,adminmail);
			} catch (SQLException e){
				e.printStackTrace();
			}
			return null;
	
		}*/
		String sql = "UPDATE admin SET adminname = ? , adminpassword = ? , adminmail = ? WHERE adminid = ?";
		String sql2 = "select * from admin where adminid = ?";
		int row = 0;
		Admin newadmin = null;
		try {
			row = queryrunner.update(sql, adminname,adminpassword,adminmail,adminid);
		} catch (SQLException e){
			e.printStackTrace();
		}
		if(row>0){
			try {
				newadmin = queryrunner.query(sql2, new BeanHandler<Admin>(Admin.class), adminid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return newadmin;
	}

}
