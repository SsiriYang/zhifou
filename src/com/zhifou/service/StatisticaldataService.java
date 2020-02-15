package com.zhifou.service;

import com.zhifou.dao.DateDao;

public class StatisticaldataService {
	DateDao dateDao= new DateDao();
    public void addday(int sum){
    	dateDao.addday(sum);
    }
    public String querys() {
    	String strs = dateDao.querys();
    	return strs;
    }
}	
