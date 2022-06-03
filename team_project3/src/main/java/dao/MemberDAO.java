package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BuyDTO;
import vo.LikeListBean;
import vo.MemberBean;
import vo.SellerDTO;
import vo.SellerProductDTO;

import static db.JdbcUtil.*;
public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {} //생성자 잠그기
	
	public static MemberDAO getInstance() { 
		return instance;
	};
	
	private Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	//회원가입
	public int joinSuccess(MemberBean memberBean) {
        System.out.println("joinSuccess - DAO");
        int joinCount = 0;
        
        PreparedStatement pstmt = null, pstmt2 = null, pstmt3 = null, pstmt4 = null, pstmt5 = null , pstmt6 = null;

        try {
           String sql = "INSERT INTO member VALUES ((SELECT A.NUM FROM (SELECT IFNULL(MAX(CAST(member_num AS UNSIGNED)), 0) + 1 AS num FROM member) A),REPLACE(UUID(),'-',''),?,?,?,?)";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, memberBean.getMember_nickname());
           pstmt.setString(2, memberBean.getMember_id());
           pstmt.setString(3, memberBean.getMember_passwd());
           pstmt.setString(4, memberBean.getMember_email());
           
           sql = "INSERT INTO member_info (member_info_code,member_info_gender, member_info_age) VALUES ((SELECT member_code FROM member ORDER BY CAST(member_num AS SIGNED) DESC LIMIT 1),?,?)";
           pstmt2 = con.prepareStatement(sql);
           pstmt2.setString(1, memberBean.getMember_info_gender());
           pstmt2.setString(2, memberBean.getMember_info_age());
           
           sql = "INSERT INTO member_info_detail (member_info_detail_code,member_info_detail_like_style, member_info_detail_like_brand, member_info_detail_like_category, member_info_detail_point, member_info_detail_acc_money) VALUES ((SELECT member_code FROM member ORDER BY CAST(member_num AS SIGNED) DESC LIMIT 1),?,?,?,0,0)";
           pstmt3 = con.prepareStatement(sql);
           pstmt3.setString(1, memberBean.getMember_info_detail_like_style());
           pstmt3.setString(2, memberBean.getMember_info_detail_like_brand());
           pstmt3.setString(3, memberBean.getMember_info_detail_like_category());
           
           sql ="INSERT INTO member_service_log VALUES ((SELECT member_code FROM member ORDER BY CAST(member_num AS SIGNED) DESC LIMIT 1), '정상', REPLACE(now(),'-',''), REPLACE(now(),'-',''), REPLACE(now(),'-',''), 0, '0')";
           pstmt4 = con.prepareStatement(sql);
           
           
           joinCount = pstmt.executeUpdate();
           joinCount = pstmt2.executeUpdate();
           joinCount = pstmt3.executeUpdate();
           joinCount = pstmt4.executeUpdate();
        } catch (SQLException e) {
           
        } finally {
           close(pstmt4);
           close(pstmt3);
           close(pstmt2);
           close(pstmt);
        }
        
        return joinCount;
     }

	public MemberBean isLogin(String member_id, String member_passwd) {
		System.out.println("MemberDAO isLogin");
		MemberBean isLogin = null;
		
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null, rs2 = null;
		
		try {
			String sql = "SELECT a.auth_code, a.email FROM auth a JOIN member m ON a.email = m.member_email WHERE m.member_id=?"; //인증여부확인
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs=pstmt.executeQuery();
			if(!rs.next()) { //인증코드가 없을시 로그인 가능
				sql = "SELECT a.member_code, c.grade_name, a.member_nickname, d.member_service_log_status, d.member_service_log_login_date, e.reason_content FROM member AS a JOIN  member_info_detail AS b ON a.member_code=b.member_info_detail_code JOIN member_service_log AS d ON a.member_code = d.member_service_log_code JOIN reason AS e ON d.member_service_log_status_reason = e.reason_num JOIN grade AS c ON b.member_info_detail_acc_money BETWEEN c.lowest_acc_money AND c.highest_acc_money WHERE a.member_id=? AND a.member_passwd=?"; 
				
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, member_id);
				pstmt2.setString(2, member_passwd);
				rs2 = pstmt2.executeQuery();
				
				System.out.println(pstmt2); 
				if(rs2.next()) {
					isLogin = new MemberBean();
					isLogin.setMember_code(rs2.getString("a.member_code"));
					isLogin.setGrade_name(rs2.getString("c.grade_name"));
					isLogin.setMember_nickname(rs2.getString("a.member_nickname"));
					isLogin.setMember_service_log_status(rs2.getString("d.member_service_log_status"));
					isLogin.setMember_service_log_login_date(rs2.getString("d.member_service_log_login_date"));
					isLogin.setReason_content(rs2.getString("e.reason_content"));
				}
			}
		} catch (SQLException e) {

		} finally {
			close(pstmt2);
			close(rs2);
			close(pstmt);
			close(rs);
		}
		System.out.println("dao다 : " + isLogin);
		return isLogin;
	}
	
	


	public MemberBean getMemberArticle(String member_code) {
		MemberBean memberDetail = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT a.member_code"
					+ ", a.member_num"
					+ ", a.member_nickname"
					+ ", a.member_id"
					+ ", a.member_passwd"
					+ ", a.member_email"
					+ ", b.member_info_name"
					+ ", b.member_info_gender"
					+ ", b.member_info_phone"
					+ ", b.member_info_age"
					+ ", b.member_info_post_code"
					+ ", b.member_info_address"
					+ ", b.member_info_address_detail"
					+ ", b.member_info_ship_post_code"
					+ ", b.member_info_ship_address"
					+ ", b.member_info_ship_address_detail"
					+ ", b.member_info_mypage_img_name"
					+ ", b.member_info_mypage_real_img_name"
					+ ", c.member_info_detail_like_style"
					+ ", c.member_info_detail_like_brand"
					+ ", c.member_info_detail_like_category"
					+ ", c.member_info_detail_point"
					+ ", c.member_info_detail_acc_money"
					+ ", d.member_service_log_status"
					+ ", d.member_service_log_join_date"
					+ ", d.member_service_log_passwd_change_date"
					+ ", d.member_service_log_login_date"
					+ ", d.member_service_log_order_count"
					+ ", d.member_service_log_status_reason"
					+ ", e.grade_name "
					+ "FROM member AS a "
					+ "JOIN member_info AS b "
					+ "ON a.member_code = b.member_info_code "
					+ "JOIN member_info_detail AS c "
					+ "ON a.member_code = c.member_info_detail_code "
					+ "JOIN member_service_log AS d "
					+ "ON a.member_code = d.member_service_log_code "
					+ "JOIN grade AS e "
					+ "ON c.member_info_detail_acc_money BETWEEN e.lowest_acc_money AND e.highest_acc_money "
					+ "WHERE a.member_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDetail = new MemberBean();
				memberDetail.setMember_code(rs.getString("a.member_code"));
				memberDetail.setMember_num(rs.getString("a.member_num"));
				memberDetail.setMember_nickname(rs.getString("a.member_nickname"));
				memberDetail.setMember_id(rs.getString("a.member_id"));
				memberDetail.setMember_passwd(rs.getString("a.member_passwd"));
				memberDetail.setMember_email(rs.getString("a.member_email"));
				memberDetail.setMember_info_name(rs.getString("b.member_info_name"));
				memberDetail.setMember_info_gender(rs.getString("b.member_info_gender"));
				memberDetail.setMember_info_phone(rs.getString("b.member_info_phone"));
				memberDetail.setMember_info_age(rs.getString("b.member_info_age"));
				memberDetail.setMember_info_post_code(rs.getString("b.member_info_post_code"));
				memberDetail.setMember_info_address(rs.getString("b.member_info_address"));
				memberDetail.setMember_info_address_detail(rs.getString("b.member_info_address_detail"));
				memberDetail.setMember_info_ship_post_code(rs.getString("b.member_info_ship_post_code"));
				memberDetail.setMember_info_ship_address(rs.getString("b.member_info_ship_address"));
				memberDetail.setMember_info_ship_address_detail(rs.getString("b.member_info_ship_address_detail"));
				memberDetail.setMember_info_mypage_img_name(rs.getString("b.member_info_mypage_img_name"));
				memberDetail.setMember_info_mypage_real_img_name(rs.getString("b.member_info_mypage_real_img_name"));
				memberDetail.setMember_info_detail_like_style(rs.getString("c.member_info_detail_like_style"));
				memberDetail.setMember_info_detail_like_brand(rs.getString("c.member_info_detail_like_brand"));
				memberDetail.setMember_info_detail_like_category(rs.getString("c.member_info_detail_like_category"));
				memberDetail.setMember_info_detail_point(rs.getInt("c.member_info_detail_point")); 
				memberDetail.setMember_info_detail_acc_money(rs.getInt("c.member_info_detail_acc_money")); 
				memberDetail.setMember_service_log_status(rs.getString("d.member_service_log_status"));
				memberDetail.setMember_service_log_join_date(rs.getString("d.member_service_log_join_date").substring(0,8)); 
				memberDetail.setMember_service_log_passwd_change_date(rs.getString("d.member_service_log_passwd_change_date").substring(0,8)); 
				memberDetail.setMember_service_log_login_date(rs.getString("d.member_service_log_login_date").substring(0,8));
				memberDetail.setMember_service_log_order_count(rs.getInt("d.member_service_log_order_count"));
				memberDetail.setReason_num(rs.getString("d.member_service_log_status_reason"));
				memberDetail.setGrade_name(rs.getString("e.grade_name"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println("getMemberArticle" + memberDetail);
		return memberDetail;
	}

	public int getUpdateCount(MemberBean memberBean) { //마이페이지 수정
		int updateCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE member AS a, member_info AS b,member_info_detail AS c"
					+ " SET a.member_passwd=?,a.member_email=?,b.member_info_name=?,b.member_info_gender=?,b.member_info_phone=?,"
					+ "b.member_info_age=?,b.member_info_post_code=?,b.member_info_address=?,b.member_info_address_detail=?,"
					+ "b.member_info_ship_post_code=?,b.member_info_ship_address=?,b.member_info_ship_address_detail=?,"
					+ "c.member_info_detail_like_style=?,c.member_info_detail_like_brand=?,c.member_info_detail_like_category=?"
					+ " WHERE a.member_code=?"
					+ " AND b.member_info_code=?"
					+ " AND c.member_info_detail_code=?";
			
			pstmt = con.prepareStatement(sql);
//			pstmt .setString(1, memberBean.getMember_code());
//			pstmt .setString(2, memberBean.getMember_num());
//			pstmt .setString(3, memberBean.getMember_nickname());
//			pstmt .setString(4, memberBean.getMember_id());
			pstmt .setString(1, memberBean.getMember_passwd());
			pstmt .setString(2, memberBean.getMember_email());
//			pstmt .setString(7, memberBean.getMember_info_code());
			pstmt .setString(3, memberBean.getMember_info_name());
			pstmt .setString(4, memberBean.getMember_info_gender());
			pstmt .setString(5, memberBean.getMember_info_phone());
			pstmt .setString(6, memberBean.getMember_info_age());
			pstmt .setString(7, memberBean.getMember_info_post_code());
			pstmt .setString(8, memberBean.getMember_info_address());
			pstmt .setString(9, memberBean.getMember_info_address_detail());
			pstmt .setString(10, memberBean.getMember_info_ship_post_code());
			pstmt .setString(11, memberBean.getMember_info_ship_address());
			pstmt .setString(12, memberBean.getMember_info_ship_address_detail());
//			pstmt .setString(13, memberBean.getMember_info_grade_code());
//			pstmt .setString(19, memberBean.getMember_info_mypage_img_name());
//			pstmt .setString(20, memberBean.getMember_info_mypage_real_img_name());
//			pstmt .setString(21, memberBean.getMember_info_detail_code());
			pstmt .setString(13, memberBean.getMember_info_detail_like_style());
			pstmt .setString(14, memberBean.getMember_info_detail_like_brand());
			pstmt .setString(15, memberBean.getMember_info_detail_like_category());
//			pstmt .setInt(25, memberBean.getMember_info_detail_point());
//			pstmt .setInt(26, memberBean.getMember_info_detail_acc_money());
//			pstmt .setString(27, memberBean.getMember_service_log_code());
//			pstmt .setString(28, memberBean.getMember_service_log_status());
//			pstmt .setString(29, memberBean.getMember_service_log_join_date());
//			pstmt .setString(30, memberBean.getMember_service_log_passwd_change_date());
//			pstmt .setString(31, memberBean.getMember_service_log_grade_change_date());
//			pstmt .setString(32, memberBean.getMember_service_log_login_date());
//			pstmt .setInt(33, memberBean.getMember_service_log_order_count());
			pstmt .setString(16, memberBean.getMember_code());
			pstmt .setString(17, memberBean.getMember_code());
			pstmt .setString(18, memberBean.getMember_code());
//			pstmt .setString(20, memberBean.getMember_code());
			
			updateCount = pstmt.executeUpdate(); 
			System.out.println("DAO업데이트 :" + updateCount);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	public boolean getMemberUpdate(String member_code, String member_status, String reason) {
		boolean isMemberUpdate = false;
		
		PreparedStatement pstmt = null;
		int sucess = 0;
		
		try {
			if(member_status.equals("정상")) {
				String sql = "UPDATE member_service_log SET member_service_log_status=?,member_service_log_status_reason=0 WHERE member_service_log_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_status);
				pstmt.setString(2, member_code);
				sucess = pstmt.executeUpdate();
			} else if(member_status.equals("정지")) {
				String sql = "UPDATE member_service_log SET member_service_log_status=?,member_service_log_login_date=REPLACE(now(),'-',''),member_service_log_status_reason=? WHERE member_service_log_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_status);
				pstmt.setString(2, reason);
				pstmt.setString(3, member_code);
				sucess = pstmt.executeUpdate();
			} else {
				String sql = "UPDATE member_service_log SET member_service_log_status=?,member_service_log_login_date=REPLACE(now(),'-','') WHERE member_service_log_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_status);
				pstmt.setString(2, member_code);
				sucess = pstmt.executeUpdate();
			}
			
			if(sucess > 0) {
				isMemberUpdate = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return isMemberUpdate;
	}
	
	public int getUpateImg(MemberBean member) { //이미지 수정
		System.out.println("DAO getUpateImg()");
		PreparedStatement pstmt = null;
		int updateCount = 0;
		System.out.println(member.getMember_info_mypage_img_name());
		System.out.println(member.getMember_info_mypage_real_img_name());
		System.out.println(member.getMember_code());
		try {
			String sql = "UPDATE member_info"
					+ " SET member_info_mypage_img_name=?,member_info_mypage_real_img_name=?"
					+ " WHERE member_info_code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_info_mypage_img_name());
			pstmt.setString(2, member.getMember_info_mypage_real_img_name());
			pstmt.setString(3, member.getMember_code());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	
	public boolean checkNickname(String nickname) {
		boolean isDuplicate = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// JdbcUtil 클래스의 getConnection() 메서드를 호출하여 Connection 객체 가져오기
			// 3단계. SQL 구문 작성 및 전달
			// id 가 일치하는 레코드 조회
			String sql = "SELECT * FROM member WHERE member_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 레코드(아이디)가 존재할 경우 아이디가 중복이므로 isDuplicate 을 false 로 변경
			if(rs.next()) {
				isDuplicate = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return isDuplicate;
	}
	
	public boolean checkId(String id) {
		boolean isDuplicate = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// JdbcUtil 클래스의 getConnection() 메서드를 호출하여 Connection 객체 가져오기
			
			// 3단계. SQL 구문 작성 및 전달
			// id 가 일치하는 레코드 조회
			String sql = "SELECT * FROM member WHERE member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			// 레코드(아이디)가 존재할 경우 아이디가 중복이므로 isDuplicate 을 false 로 변경
			if(rs.next()) {
				isDuplicate = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isDuplicate;
	}

	public String isFindId(String nickname, String email) {
		String isFindId = "";
		System.out.println("MemberDAO - isFindId");
		System.out.println(nickname);
		System.out.println(email);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT member_id FROM member WHERE member_nickname=? AND member_email=?"; 
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isFindId = rs.getString("member_id").toString();
//				String decryptedText = rsaCipher.decrypt(isFindId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return isFindId;
	}

	public boolean isFindPasswd(String id, String email, String code) {
		
		boolean isFindPasswd = false;
		
		System.out.println("MemberDAO - isFindPasswd");
		System.out.println("id : " + id);
		System.out.println("email : " + email);
		
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT member_passwd FROM member WHERE member_id=? AND member_email=?"; 
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				System.out.println("passwd : " + rs.getString("member_passwd"));
				sql = "UPDATE member SET member_passwd=? WHERE member_id=? AND member_email=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, code);
				pstmt2.setString(2, id);
				pstmt2.setString(3, email);
				isFindPasswd=pstmt2.execute();
				isFindPasswd = true;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertAuthInfo()");

		} finally {
			close(pstmt2);
			close(pstmt);
			close(rs);
		}
		return isFindPasswd;
	}
	
	//회원가입시 인증코드 보내기
	public boolean insertAuthInfo(String receiver, String code) {
		System.out.println("MemberDAO - insertAuthInfo");
		
		boolean isSendEmail = false;
		
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null; 
		try {
			
			String sql = "SELECT auth_code FROM auth WHERE email=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, receiver);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			// 조회 결과가 존재할 경우(= rs.next() 가 true 일 경우)
			// isAuthenticatedMember 변수값을 true 로 변경
			if(rs.next()) {
				sql = "UPDATE auth SET auth_code=? WHERE email=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, code);
				pstmt2.setString(2, receiver);
				pstmt2.executeUpdate();
				isSendEmail =true;
			}else {
				sql = "INSERT INTO auth VALUES(?,?)";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setString(1, receiver);
				pstmt2.setString(2, code);
				pstmt2.executeUpdate();	
				isSendEmail =true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - insertAuthInfo()");
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
			close(pstmt2);
		}
		return isSendEmail;
	}
	
	//회원가입시 인증
	public int selectAuthInfo(String email, String code) {
		System.out.println("MemberDAO - selectAuthInfo");
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			
			// 3단계. SQL 구문 작성 및 전달
			// => member 테이블의 id 컬럼 조회(단, id 와 auth_status 가 일치하는 레코드 조회)
			String sql = "SELECT auth_code FROM auth WHERE email=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			// 조회 결과가 존재할 경우(= rs.next() 가 true 일 경우)
			// isAuthenticatedMember 변수값을 true 로 변경
			if(rs.next() ) {
				if(code.equals(rs.getString("auth_code"))) {
					result = 1;
				}
			}else {
				result = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - selectAuthInfo()");
		} finally {
			// 자원 반환
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	//인증하기 완료시 auth 테이블에서 값 delete
	public boolean changeAuthStatus(String email) {
		System.out.println("MemberDAO - changeAuthStatus");
		
		boolean AuthStatusResult = false;
		
		PreparedStatement pstmt = null;
		
//		System.out.println("changeAuthStatus" + email + "삭제되었다");
		
		try {
			// 1단계 & 2단계
			// JdbcUtil 객체의 getConnection() 메서드를 호출하여 DB 연결 객체 가져오기
			// 3단계. SQL 구문 작성 및 전달
			// => MemberDTO 객체에 저장된 아이디, 패스워드 이름, 이메일, 전화번호를 추가하고
			//    가입일(date)의 경우 데이터베이스에서 제공되는 now() 함수 사용하여 자동 생성
			String sql = "DELETE FROM auth WHERE email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			AuthStatusResult = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 발생! - changeAuthStatus()");
		} finally {
			// DB 자원 반환
			close(pstmt);
		}
		return AuthStatusResult;
	}
	
	public int selectListCount(String member_code) { //좋아료 리스트
		System.out.println("DAO에서 멤버코드 : " + member_code);
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT count(distinct like_list_item_num), a.sell_title, c.sell_img_real_name"
					+ " FROM like_list AS b"
					+ " JOIN sell AS a"
					+ " ON a.sell_num = b.like_list_item_num"
					+ " JOIN sell_img AS c"
					+ " ON c.sell_img_num = a.sell_num"
					+ " WHERE b.like_list_member_code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("DAO rs.getINT" +rs.getInt(1));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}
	
	public ArrayList<LikeListBean> selectArticleList(int pageNum, int listLimit, String member_code) {
		System.out.println("selectArticleList - DAO");
		ArrayList<LikeListBean> articleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (pageNum - 1) * listLimit;
		
		try {
			String sql = "SELECT a.like_list_num,a.like_list_count,a.like_list_title,a.like_list_img_name,b.sell_num,b.sell_title"
					+ " FROM mypage_like_list AS a"
					+ " JOIN sell AS b"
					+ " ON a.like_list_num = b.sell_num"
					+ " WHERE b.sell_member_code=?"
					+ " ORDER BY like_list_count LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			
			rs = pstmt.executeQuery();
			articleList = new ArrayList<LikeListBean>();
			
			while(rs.next()) {
				LikeListBean article = new LikeListBean();
				article.setLike_list_count(rs.getInt("like_list_count"));
				article.setLike_list_title(rs.getString("like_list_title"));
				article.setLike_list_img_name(rs.getString("like_list_img_name"));
				
				articleList.add(article);
//				System.out.println("DAO에서 articleList - " + articleList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articleList;
	}


	//총 구매목록 수 조회
	public int selectBuyListCount(String tableName) {
		System.out.println("MemberDAO - selectBuyListCount()");
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM "+tableName;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectListCount()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}

	//구매리스트 목록 담아오기
	public ArrayList<SellerProductDTO> selectBuyList(int pageNum, int listLimit, String code) {
		ArrayList<SellerProductDTO> buyList = null;
		SellerProductDTO buy = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (pageNum - 1) * listLimit;
		
		try { // 목록 카테고리에 필요한 값만 저장
			String sql = "SELECT s.sell_title, s.sell_size, b.buy_sell_item_date, b.buy_item_status, si.sell_img_name, si.sell_img_real_name, s.sell_num FROM sell s JOIN buy b ON s.sell_num = b.buy_item_num JOIN sell_img si ON si.sell_img_real_num = s.sell_num WHERE buy_member_code=? ORDER BY buy_sell_item_date DESC LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			
			rs = pstmt.executeQuery();
			
			buyList = new ArrayList<SellerProductDTO>();
			
			while(rs.next()) {
				
				buy = new SellerProductDTO();
				buy.setSell_title(rs.getString("s.sell_title"));
				buy.setSell_size(rs.getString("s.sell_size"));
				buy.setBuy_sell_item_date(rs.getString("b.buy_sell_item_date").substring(0,8));
				buy.setBuy_item_status(rs.getString("b.buy_item_status"));
				buy.setSell_img_name(rs.getString("si.sell_img_name"));
				buy.setSell_img_real_name(rs.getString("si.sell_img_real_name"));
				buy.setSell_num(rs.getInt("s.sell_num"));
				
//				if(rs.getString("sell_list_approve_date") !=null) { //값이 없을 때 .substring(0,8)로 인해 오류발생
//					confirm.setSell_list_approve_date(rs.getString("sell_list_approve_date").substring(0,8));
//				}
				buyList.add(buy);
				
			}
			
//			System.out.println(productConfirmList);
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - selectBuyList()");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return buyList;
	}
	
	public int selectSellListCount(String member_code) { //판매리스트 카운트
		System.out.println("DAO에서 멤버코드 : " + member_code);
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM sell WHERE sell_member_code=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
				System.out.println("DAO rs.getINT" +rs.getInt(1));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생");
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return listCount;
	}

	public ArrayList<SellerDTO> selectSellArticleList(int pageNum, int listLimit, String member_code) { //판매리스트 조회
		System.out.println("selectArticleList - DAO");
		ArrayList<SellerDTO> sellarticleList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int startRow = (pageNum - 1) * listLimit;
		
		try {
			String sql = "SELECT sell_num, sell_member_code, sell_title, sell_category, sell_price, sell_write_date"
					+ " FROM sell"
					+ " WHERE sell_member_code=?"
					+ " ORDER BY sell_num LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			
			rs = pstmt.executeQuery();
			sellarticleList = new ArrayList<SellerDTO>();
			
			while(rs.next()) {
				SellerDTO article = new SellerDTO();
				article.setSell_num(rs.getInt("sell_num"));
				article.setSell_member_code(rs.getString("sell_member_code"));
				article.setSell_title(rs.getString("sell_title"));
				article.setSell_category(rs.getString("sell_category"));
				article.setSell_price(rs.getInt("sell_price"));
				article.setSell_write_date(rs.getString("sell_write_date"));
				
				sellarticleList.add(article);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sellarticleList;
		
	}

}
