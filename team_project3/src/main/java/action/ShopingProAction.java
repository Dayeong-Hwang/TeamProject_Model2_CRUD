package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.SellerShopingService;
import vo.ActionForward;
import vo.MemberBean;
import vo.SellerDTO;
import vo.SellerProductDTO;

public class ShopingProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ShopingProAction - 쇼핑카트 작업 ");
		ActionForward forward = null;	
		String member_code = request.getParameter("member_code");
		int sell_num = Integer.parseInt(request.getParameter("sell_num"));
//		System.out.println("sell_num:"+sell_num);	//20
//		System.out.println("sell_code:"+member_code);	//판매자 코드 
		
		//articleList 
		SellerShopingService service = new SellerShopingService();
		SellerProductDTO sellerDTO = new SellerProductDTO();
		MemberBean memberBean = new MemberBean();
		
		
		
		sellerDTO = service.getShoping(sell_num);  		//상세정보한 값 다시 불러오기
		memberBean = service.getMemberShop(member_code);	//멤버에서 필요한 값 가져오기
//      sell_member_code를 이용하여 (member) member_nickname ,
//		 (member_info) name,post_code , address&detail,ship_address&detail
//		(grade) lowest_acc_money,highest_acc_money
//		(buy_list)  이건?		
//		memberBean = service.getMember(sell_list_num, sell_brand);
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("sellerDTO", sellerDTO);
		System.out.println("구매자:"+memberBean);    //구매자 정보들
		System.out.println("판매정보:"+sellerDTO);		//판매제품 정보들
		forward = new ActionForward();
		forward.setPath("ShopingForm.pr");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
