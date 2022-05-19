package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CommunityBoardWriteProAction;
import action.EventDetailAction;
import action.EventListAction;
import action.EventSearchAction;
import action.MemberDetailAction;
import action.MemberManagementListAction;
import action.MemberUpdateAction;
import action.NoticeDetailAction;
import action.NoticeListAction;
import action.NoticeModifyFormAction;
import action.NoticeModifyProAction;
import action.NoticeSearchAction;
import vo.ActionForward;

// 커뮤니티 게시판 Controller
@WebServlet("*.co")
public class CommunityFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println("CommunityFrontController");

		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
//		System.out.println("command : " + command);

		Action action = null;
		ActionForward forward = null;

		// 서블릿 주소 판별
		// 1. 글쓰기 폼에 대한 요청 판별("/CommunityWriteForm.co")
		if (command.equals("/CommunityWriteForm.co")) {
			forward = new ActionForward("AdminPage/confirm/communityWrite.jsp", false);

		} else if (command.equals("/CommunityBoardWritePro.co")) { // 작성완료 버튼 클릭시
			action = new CommunityBoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeList.co")) {// 공지사항 리스트(/NoticeList.co) 요청
			action = new NoticeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NoticeDetail.co")) {// 공지사항 상세정보(/NoticeDetail.co) 요청
			action = new NoticeDetailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeSearch.co")) {// 공지사항 검색(/NoticeSearch.co) 요청
			action = new NoticeSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeModifyForm.co")) { // 공지사항 수정하는 상세정보(/NoticeModifyForm.co) 요청
			action = new NoticeModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeModifyPro.co")) {// 공지사항 수정(/NoticeModifyPro.co) 요청
			action = new NoticeModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/EventList.co")) {// 이벤트 리스트(/EventList.co) 요청
			action = new EventListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/EventDetail.co")) {// 이벤트 상세정보(/EventDetail.co) 요청
			action = new EventDetailAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/EventSearch.co")) {// 이벤트 검색(/EventSearch.co) 요청
			action = new EventSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		

		else if (command.equals("/MemberManagement.co")) { // 가입된 회원 목록
			action = new MemberManagementListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberDetail.co")) { // 회원의 상세 정보
			action = new MemberDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdate.co")) { // 회원의 상태 변경
			action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ProductConfirm.co")) { // 이벤트 글 목록
			forward = new ActionForward("AdminPage/productConfirm.jsp", false);
		} else if (command.equals("/QusetionList.co")) { // Q&A 목록
			forward = new ActionForward("AdminPage/questionList.jsp", false);
		}

		
		
		
		
		
		
		
		// ActionForward 객체에 저장된 포워딩 정보에 따른 포워딩 작업 수행
		if (forward != null) { // ActionForward 객체가 비어있지 않을 경우
			// Redirect 방식 vs Dispatcher 방식 판별하여 각 방식으로 포워딩
			if (forward.isRedirect()) { // Redirect 방식
				response.sendRedirect(forward.getPath());
			} else { // Dispatcher 방식
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {
			// ActionForward 객체가 비어있을 경우 메세지 출력(임시)
			System.out.println("ActionForward 객체가 null 입니다!");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
