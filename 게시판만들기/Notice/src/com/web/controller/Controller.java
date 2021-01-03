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

import com.web.NoticeVo.NoticeVo;

@WebServlet("/notice/index")
public class Controller extends HttpServlet {
	public static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static String JDBC_USER = "song";
	public static String JDBC_PW = "1234";
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		
		String sql = "SELECT * FROM NOTICE";
		List<NoticeVo> list = new ArrayList<>();
		
		
		try {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PW); 
			 ps = conn.prepareStatement(sql);
			 rs = ps.executeQuery();
			
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
			
			System.out.println(list);
			request.setAttribute("notice", list);
			request.getRequestDispatcher("/notice/index.jsp").forward(request, response);
			
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sql 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}

}
