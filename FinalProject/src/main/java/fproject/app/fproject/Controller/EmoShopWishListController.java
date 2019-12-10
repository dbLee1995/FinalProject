package fproject.app.fproject.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fproject.app.fproject.Util.Paging;
import fproject.app.fproject.service.FavorListService;
import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.vo.EmoWishListVo;

@Controller
public class EmoShopWishListController {
	@Autowired
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Autowired
	private FavorListService favorListService;
	public void setFavorListService(FavorListService favorListService) {
		this.favorListService = favorListService;
	}
	
	@RequestMapping(value="/emoShop/wishList", method=RequestMethod.GET)
	public String pageMove(Model model, HttpServletRequest req, @RequestParam(required=false, defaultValue="1") int thisPage) {
		String userID = (String)req.getSession().getAttribute("id"); // 사용자 아이디 받아오기
		int userNum = memberService. getUserAccountInfo(userID).getNum(); // 사용자 번호 받아오기
		Paging pg = new Paging(10, favorListService.getCount(userNum), thisPage);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pg.getStartRow());
		map.put("endRow", pg.getEndRow());
		map.put("userNum", userNum);
		map.put("startPage", pg.getStartPage());
		map.put("endPage", pg.getEndPage());
		map.put("thisPage", pg.getThisPage());
		List<EmoWishListVo> list = favorListService.getUserWishList(map);
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		   
		
		return "emoticonShop/emoBasket";
	}
}
