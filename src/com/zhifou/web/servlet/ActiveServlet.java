package com.zhifou.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.BitSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhifou.bean.User;
import com.zhifou.service.StatisticaldataService;

import net.sf.json.JSONArray;
import redis.clients.jedis.Jedis;
/**
 * Servlet implementation class ActiveServlet
 */
@WebServlet("/ActiveServlet")
public class ActiveServlet extends BaseServlet {
	private HttpSession session =null;
	StatisticaldataService dataService = new StatisticaldataService();
	public void quearys(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
      
        String activeArr = dataService.querys();
        response.setContentType("text/html; charset=utf-8");
        //ArrayList对象转化为JSON对象
        JSONArray json = JSONArray.fromObject(activeArr);
        System.out.println(json.toString());
        //返回到JSP
        PrintWriter writer = response.getWriter();
        writer.println(json);
        writer.flush();
        //关闭输出流
        writer.close();		
	}
	public void great(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer answerid = Integer.parseInt(request.getParameter("answerid"));
        //Integer userid = Integer.parseInt(request.getParameter("userid"));
        session = request.getSession();
        User u = (User) session.getAttribute("user");
        int userid = u.getUserid();
        System.out.println(answerid+"----"+userid);
        Jedis j = null;
        j = new Jedis("127.0.0.1", 6379);
        j.setbit("answer:"+answerid, userid, true);
        BitSet b = byteArray2BitSet(j.get("answer:"+answerid).getBytes());
        int lognum = b.cardinality();
        System.out.println("问题编号"+answerid+"点赞数是：" + lognum);
        response.getWriter().print(lognum);
		
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

}
