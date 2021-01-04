package com.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.NoticeVo.NoticeVo;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/notice/detail")
public class NoticeDetailController extends HttpServlet {

	public static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static String JDBC_USER = "song";
	public static String JDBC_PW = "1234";



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id_ = request.getParameter("id");
		int id = 0;
		if(id_ != null && !id_.equals("")) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		
		List<NoticeVo> list = new ArrayList<>();

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PW);

			String sql = "SELECT * FROM NOTICE WHERE ID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			rs.next();

			NoticeVo vo = new NoticeVo();

			vo.setId(rs.getInt("ID"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setWriter_id(rs.getString("WRITER_ID"));
			vo.setContent(rs.getString("CONTENT"));
			vo.setRegdate(rs.getDate("REGDATE"));
			vo.setHit(rs.getInt("HIT"));
			vo.setFiles(rs.getString("FILES"));
			
			list.add(vo);


			request.setAttribute("list", vo);
			request.getRequestDispatcher("/WEB-INF/view/notice/detail.jsp").forward(request, response);

			rs.close();
			ps.close();
			conn.close();



		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}

}
