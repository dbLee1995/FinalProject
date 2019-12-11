package fproject.app.fproject.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fproject.app.fproject.Util.Paging;
import fproject.app.fproject.service.EmoShopService;
import fproject.app.fproject.service.FavorListService;
import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.vo.EmoWishListVo;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.EmoticongroupVo;
import fproject.app.fproject.vo.PurchaseVo;

@Controller
@RequestMapping("emoShop")
public class EmoShopController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FavorListService favorListService;
	@Autowired
	private EmoShopService emoShopService;

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainPage(Model model, HttpServletRequest req) {
		int userNum = (int)req.getSession().getAttribute("num");
		List<EmoticongroupVo> emolist = emoShopService.getList();
		model.addAttribute("list", emolist);
		return "emoShop/main";
	}
	
	@RequestMapping(value="/wishList", method=RequestMethod.GET)
	public String wishListPage(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage) {
		String userID = (String)req.getSession().getAttribute("id"); // 사용자 아이디 받아오기
		int userNum = memberService. getUserAccountInfo(userID).getNum(); // 사용자 번호 받아오기
		Paging pg = new Paging (10, favorListService.getCount(userNum), 7, thisPage);
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
		return "emoShop/wishList";
	}
	
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public String basketPage(Model model, HttpSession session, int thisPage) {
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList"); // basketList의 컬렉션(?)이 <EmoshopVo>여야 함
		Paging pg = new Paging(10, basketList.size(), 10, thisPage, 0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pg.getStartRow());
		map.put("endRow", pg.getEndRow());
		map.put("userNum", pg.getEndRow());
		map.put("startPage", pg.getStartPage());
		map.put("endPage", pg.getEndPage());
		map.put("thisPage", pg.getThisPage());
		model.addAttribute("basketList", basketList);
		model.addAttribute("map", map);
		return "emoShop/basket";
	}
	
	@RequestMapping(value="/putBasket")
	@ResponseBody
	public String putBasket(Model model, HttpSession session, EmoshopVo vo) {
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		basketList.add(vo);
		session.setAttribute("basketList", basketList);
		JSONObject json = new JSONObject("'result':'장바구니에 담았습니다.'");
		return json.toString();
	}
	
	@RequestMapping(value="/purchase")
	public String purchasePageMove(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage) {
		List<EmoshopVo> basketList = (List)req.getSession().getAttribute("basketList");
		Paging pg = new Paging(10, basketList.size(), 10, thisPage, 0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pg.getStartRow());
		map.put("endRow", pg.getEndRow());
		map.put("userNum", pg.getEndRow());
		map.put("startPage", pg.getStartPage());
		map.put("endPage", pg.getEndPage());
		map.put("thisPage", pg.getThisPage());
		model.addAttribute("basketList", basketList);
		model.addAttribute("map", map);
		return "emoShop/purchase";
	}
	
	@RequestMapping(value="/purchase/buy", method=RequestMethod.POST)
	public String purchase(Model model, @RequestBody PurchaseVo vo) {
		model.addAttribute("feature", "이모티콘 구매");
		List<PurchaseVo> list = vo.getList();
		if(list != null) {
			emoShopService.savePurchaseList(list);
			emoShopService.saveUserEmoticonGroup(list); // 방법 생각할 것
			return "emoShop/purchase";
		} else {
			return "test/error";
		}
	}
}