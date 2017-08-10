package com.ajax.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Servlet3.0的新特性，可以用注解来实现映射路径
@WebServlet(description = "ajax访问的servlct方法", urlPatterns =  "/AjaxServlct" )
public class AjaxServlct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxServlct() {
        super();
    }
    /**
     * 睡眠几秒钟后返回一串字符串
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int time=Integer.parseInt(request.getParameter("time"));
			Thread.sleep(time);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("要来一发吗");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
