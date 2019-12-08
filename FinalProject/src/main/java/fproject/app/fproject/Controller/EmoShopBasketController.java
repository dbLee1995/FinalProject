package fproject.app.fproject.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.vo.FavorlistVo;

@Controller
public class EmoShopBasketController {
	@Autowired
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value="/emoShop/buyList", method=RequestMethod.GET)
	public String pageMove(Model model, HttpServletRequest req) {
		String userID = (String)req.getSession().getAttribute("id"); // 사용자 아이디 받아오기
		int userNum = memberService. getUserAccountInfo(userID).getNum(); // 사용자 번호 받아오기
		
		int thisPage = 1; // 사용자가 현재 보고있는 페이지 번호(기본 1)
		//int totalCount = favorListService.getTotalCount(userNum); // 보관항목수
		//int totalPageCount = totalNum; // 전체 페이지 수
		
		int pageListNum = 7; // 페이지목록 길이
		//List<FavorlistVo> list = favorListService.selectList(userNum);
		return "emoticonShop/emoBasket";
	}
}
