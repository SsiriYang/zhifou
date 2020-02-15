package com.zhifou.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.zhifou.bean.active;
import com.zhifou.utils.DataSourceUtils;
import com.zhifou.utils.JsonUtils;

public class DateDao {
	QueryRunner queryrunner = new QueryRunner(DataSourceUtils.getDataSource());

	// 把redis的数同步到mysql中
	public void addday(int sum) {
		String sql = "insert into active(dateday,num) values(?,?) ";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime = sdf.format(new Date());

		try {
			int update = queryrunner.update(sql, nowTime, sum);
			System.out.println(update);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	//查询mysql中的active表
	public String querys() {
		List<active> activarr = new ArrayList<active>();
		String sql = "SELECT dateday,num FROM active ";
		try {
			activarr  = queryrunner.query(sql,new BeanListHandler<active>(active.class));
			//System.out.println(update);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String str = JsonUtils.objectToJson(activarr);
		System.out.println(str);
		return str;
	}

}
