package com.font.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.font.model.Country;

@WebServlet("/DataServlct")
public class DataServlct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DataServlct() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String parameter = request.getParameter("key");
		List<Country> list = new ArrayList<Country>();
		for(int i=0;i<10;i++){
			Country country = new Country();
			country.setCode("county_"+parameter+"_"+i);
			country.setName("somgthing"+parameter+"第"+i+"国");
			list.add(country);
		}
		String json = JSONArray.toJSONString(list);
		System.out.println("打印出来的json数据是"+json);
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "Content-Type:application/json; charset=utf-8");
		response.getWriter().println(json);  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
