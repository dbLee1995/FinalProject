package fproject.app.fproject.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fproject.app.fproject.Util.Paging_WishList;
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
	public String pageMove(Model model, HttpServletRequest req, @RequestParam(value="page", required=false, defaultValue="1") int thisPage) {
		String userID = (String)req.getSession().getAttribute("id"); // 사용자 아이디 받아오기
		int userNum = memberService. getUserAccountInfo(userID).getNum(); // 사용자 번호 받아오기
		
		Paging_WishList pg = new Paging_WishList(10, favorListService.getCount(userNum), thisPage);
		model.addAttribute("startPage", pg.getStartPage());
		model.addAttribute("endPage", pg.getEndPage());
		//model.addAttribute()
		
		return "emoticonShop/emoBasket";
	}
}
