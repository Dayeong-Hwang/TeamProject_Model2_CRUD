package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SellerDetailService;
import vo.ActionForward;
import vo.SellerDTO;

public class ProductDetailProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductDetailProAction - 상품 상세 조회");
		ActionForward forward =null;
		String pageNum = request.getParameter("page");
		
		
		int sell_num = Integer.parseInt(request.getParameter("sell_num"));
		System.out.println(pageNum);
		System.out.println(sell_num);
		
		SellerDetailService service = new SellerDetailService();
		SellerDTO sellerdto = new SellerDTO(); 
		sellerdto = service.getArticle(sell_num);   //상세정보를 위한 sellerdto 객체 꺼내오기     <request.getparameter sell_list_num 꺼내지는지 확인하기>
		
		// 조회수 증가 작업 요청(단, 게시물 조회 성공 시에만 수행)
		if(sellerdto != null) {
			System.out.println("조회수 증가");
			// BoardDetailService 객체의 increaseReadcount() 메서드 호출
			// => 파라미터 : 글번호(board_num)
			service.increaseReadcount(sell_num);
		}
		

		request.setAttribute("sellerdto", sellerdto);
		
		forward = new ActionForward();
		forward.setPath("adminPage/productDetailForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	
	}

}
