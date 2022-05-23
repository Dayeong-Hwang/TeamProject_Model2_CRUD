package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import dao.MemberDAO;
import vo.MemberBean;

public class MemberManagementListService {

	public int getListCount() {
		int listCount = 0;
		
		Connection con = getConnection();
		AdminDAO adminDAO= AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		String tableName = "member";
		
		listCount = adminDAO.selectListCount(tableName);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<MemberBean> getMemberManagementList(int pageNum, int listLimit) {
		ArrayList<MemberBean> memberManagementList = null;
		
		Connection con = getConnection();
		AdminDAO adminDAO= AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		memberManagementList = adminDAO.selectMemberManagementList(pageNum, listLimit);
		
		close(con);
		
		// 7. 조회 결과 리턴
		return memberManagementList;
	}

	public MemberBean getStatusCount() {
		MemberBean bean = null;
		
		Connection con = getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.setConnection(con);
		
		bean = dao.getMemberStatus();
		
		close(con);
		
		return bean;
	}

	public ArrayList<MemberBean> getClassificationList(int pageNum, int listLimit, String value) {
		ArrayList<MemberBean> classificationList = null;
		
		Connection con = getConnection();
		AdminDAO adminDAO= AdminDAO.getInstance();
		
		adminDAO.setConnection(con);
		
		classificationList = adminDAO.selectClassificationList(pageNum, listLimit, value);
		
		close(con);
		
		// 7. 조회 결과 리턴
		return classificationList;
	}

}
