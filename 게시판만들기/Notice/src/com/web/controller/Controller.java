package com.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.Application.Application;
import com.web.NoticeVo.NoticeVo;

@WebServlet("/notice/index")
public class Controller extends HttpServlet {
	public static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static String JDBC_USER = "song";
	public static String JDBC_PW = "1234";
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			Connection conn = new Application().getConn();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			request.setCharacterEncoding("UTF-8");
			
			String sql = "SELECT * FROM NOTICE";
			List<NoticeVo> list = new ArrayList<>();

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				NoticeVo vo = new NoticeVo();
				vo.setId(rs.getInt("ID"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setWriter_id(rs.getString("WRITER_ID"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setRegdate(rs.getDate("REGDATE"));
				vo.setHit(rs.getInt("HIT"));
				vo.setFiles(rs.getString("FILES"));
				list.add(vo);	
			}
			
			
			request.setAttribute("notice", list);
			request.getRequestDispatcher("/WEB-INF/view/notice/index.jsp").forward(request, response);
			
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("sql 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
