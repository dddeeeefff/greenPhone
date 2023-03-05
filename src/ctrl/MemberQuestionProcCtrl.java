package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

@WebServlet("/member_question_proc")
public class MemberQuestionProcCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberQuestionProcCtrl() { super(); }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
		
		// 받아온 회원정보들을 저장할 인스턴스 생성
		if (request.getParameter("title").equals("") ||request.getParameter("title").equals(null) ) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('제목이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else { // 회원 정보수정 실패
				MemberQuestion memberQuestion = new MemberQuestion();
				memberQuestion.setMi_id(loginInfo.getMi_id());
				memberQuestion.setBmq_title(request.getParameter("title"));
				memberQuestion.setBmq_content(request.getParameter("content"));
				MemberQuestionProcSvc memberQuestionProcSvc = new MemberQuestionProcSvc();
				int result = memberQuestionProcSvc.memberQuestionProc(memberQuestion);
				if (result == 1) { // 정상적으로 정보수정이 이루어 졌으면
					response.sendRedirect("member_question_list");
				}
				

			}
	}

}
