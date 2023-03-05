package dao;

import static db.JdbcUtil.*;	// JdbcUtil 클래스의 모든 멤버들을 자유롭게 사용
import java.util.*;
import java.sql.*;
import vo.*;

public class MemberProcInDao {
		private static MemberProcInDao memberProcInDao;
		private Connection conn;
		private MemberProcInDao() {}
		
		public static MemberProcInDao getInstance() {
			if (memberProcInDao == null) { 
				memberProcInDao = new MemberProcInDao();
			}
			return memberProcInDao;
		}
		public void setConnection(Connection conn) {
			this.conn = conn;
		}
		public int memberProcIn(MemberInfo memberInfo) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			try {
				String sql = "insert into t_member_info (mi_id, mi_pw, " + 
				"mi_name, mi_gender, mi_birth, mi_phone, mi_email, " + 
				"mi_zip, mi_addr1, mi_addr2, mi_point) " +
				"value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberInfo.getMi_id());
				pstmt.setString(2, memberInfo.getMi_pw());
				pstmt.setString(3, memberInfo.getMi_name());
				pstmt.setString(4, memberInfo.getMi_gender());
				pstmt.setString(5, memberInfo.getMi_birth());
				pstmt.setString(6, memberInfo.getMi_phone());
				pstmt.setString(7, memberInfo.getMi_email());
				pstmt.setString(8, memberInfo.getMi_zip());
				pstmt.setString(9, memberInfo.getMi_addr1());
				pstmt.setString(10, memberInfo.getMi_addr2());
				pstmt.setInt(11, memberInfo.getMi_point());
				result = pstmt.executeUpdate();
					
				if (result == 1) {
					sql = "insert into t_member_point " + 
					" (mi_id, mp_point, mp_desc) values(?, ?, '가입축하금')";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, memberInfo.getMi_id());
					pstmt.setInt(2, memberInfo.getMi_point());
					result += pstmt.executeUpdate();
				}
				
			} catch (Exception e) {
				System.out.println("MemberProcInDao 클래스의 memberProcIn() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
}
