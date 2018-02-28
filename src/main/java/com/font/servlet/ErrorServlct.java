package com.font.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.font.model.Country;

/**
 * 测试返回的http状态码为500的ajax调用情况
 * @author Administrator
 *
 */
@WebServlet("/ErrorServlct")
public class ErrorServlct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ErrorServlct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Country country = new Country();
		country.setName("这是一段错误数据");
		country.setCode("500");
		String json = JSON.toJSONString(country);
		response.getWriter().print(json);
		//设置http状态码
		response.setStatus(500);
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
