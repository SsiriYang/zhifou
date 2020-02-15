package com.zhifou.service;

import java.util.List;

import com.zhifou.bean.Answer;
import com.zhifou.bean.Collection;
import com.zhifou.bean.Question;
import com.zhifou.bean.User;
import com.zhifou.dao.Collectiondao;

public class CollectionService {
	Collectiondao collectiondao=new Collectiondao();
	//获得所以收藏的answerid
	public List<Collection> getCollection(int userid){
		return collectiondao.getCollection(userid);
	}
	//根据收藏的answerid找到answer的内容
	public Answer getAnswer(int answerid){
		return collectiondao.getAnswer(answerid);
	}
	//根据answer的questionid找question的内容
	public Question getQuestion(int questionid){
		return collectiondao.getQuestion(questionid);
	}
	//根据回答者id找到此回答者用户信息
	public User FindUserByID(int id){
		return collectiondao.FindUserByID(id);
	}
	//点击收藏时添加到数据库
	public Boolean addCollection(int userid,int questionid,int answerid){
		return collectiondao.addCollection(userid, questionid, answerid);
	}
	
	//删除收藏
		public int deleteCollection(int collectionid){
			return collectiondao.deleteCollection(collectionid);
		}
}
