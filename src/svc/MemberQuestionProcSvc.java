package svc;

import static db.JdbcUtil.*;
import java.sql.*;
import java.util.*;
import dao.*;
import vo.*;

public class MemberQuestionProcSvc {

	public int memberQuestionProc(MemberQuestion memberQuestion) {
		int result = 0;
		Connection conn = getConnection();
		MemberQuestionProcDao memberQuestionProcDao = MemberQuestionProcDao.getInstance();
		memberQuestionProcDao.setConnection(conn);
		
		result = memberQuestionProcDao.memberQuestionProcIn(memberQuestion);
		if (result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}