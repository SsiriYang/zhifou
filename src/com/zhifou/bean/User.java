package com.zhifou.bean;

import java.text.SimpleDateFormat;
import java.util.BitSet;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import redis.clients.jedis.Jedis;

public class User implements HttpSessionBindingListener{
	 private Integer userid;// 用户ID
	 private String username;//用户昵称
	 private String userpassword; //用户密码
	 private String usermail;//用户邮箱
	 private String userphoto;//用户头像
	 private String usermeans;//用户签名
	 
	public String getUsermeans() {
		return usermeans;
	}
	public void setUsermeans(String usermeans) {
		this.usermeans = usermeans;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsermail() {
		return usermail;
	}
	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
    public static BitSet byteArray2BitSet(byte[] bytes) {
        BitSet bitSet = new BitSet(bytes.length * 8);
        int index = 0;
        for (int i = 0; i < bytes.length; i++) {
            for (int j = 7; j >= 0; j--) {
                bitSet.set(index++, (bytes[i] & (1 << j)) >> j == 1 ? true
                        : false);
            }
        }
        return bitSet;
    }
    @Override//上线统计
    public void valueBound(HttpSessionBindingEvent event) {


        System.out.println(this.username+"上线了");
        ServletContext application = event.getSession().getServletContext();
        Integer onlineCount =(Integer)application.getAttribute("onlineCount");
        if(onlineCount==null){
            application.setAttribute("onlineCount",1);

        }else{
            application.setAttribute("onlineCount",onlineCount+1);
        }
        //redis操作
        Jedis j = null;
        try {
            j = new Jedis("127.0.0.1", 6379);
            Date date  = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String nowDate = "login:"+sdf.format(date);
            j.setbit(nowDate, this.userid, true);
            BitSet b = byteArray2BitSet(j.get(nowDate).getBytes());
            int lognum = b.cardinality();
            System.out.println(lognum);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (j != null) {
                j.disconnect();
            }
        }
    }
    @Override
    public void valueUnbound(HttpSessionBindingEvent  event) {
        System.out.println(this.username+"已离线了");
        ServletContext application = event.getSession().getServletContext();
        Integer onlineCount =(Integer)application.getAttribute("onlineCount");
        application.setAttribute("onlineCount",onlineCount-1);
    }

}
