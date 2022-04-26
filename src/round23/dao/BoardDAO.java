package round23.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import round23.dto.BoardDTO;

public class BoardDAO {
	private Connection conn;

	public BoardDAO() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (ClassNotFoundException ex) {
		}
		
		String url = "jdbc:mysql://localhost:3306/world";
		try {
			conn = DriverManager.getConnection(url, "root", "1234");
		} catch (SQLException ex) {
			System.err.println("create error  = " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public int registerMember(BoardDTO dto) {
		int result = 0;
		try {
			String query = "insert into bbs_content_tb values(null, ?,?,?, now())";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getContent_title());
			pstmt.setString(2, dto.getContent_writer());
			pstmt.setString(3, dto.getContent_contents());
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}

	public ArrayList<BoardDTO> getBoardList() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			String query = "select * from bbs_content_tb";
			java.sql.Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContent_num(rs.getInt(1));
				dto.setContent_title(rs.getString(2));
				dto.setContent_writer(rs.getString(3));
				dto.setContent_contents(rs.getString(4));
				dto.setContent_regdate(rs.getTimestamp(5));
				list.add(dto);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.err.println(" getList error : " + e.getMessage());
			e.printStackTrace();
			return null;
		}
		return list;
	}
}
