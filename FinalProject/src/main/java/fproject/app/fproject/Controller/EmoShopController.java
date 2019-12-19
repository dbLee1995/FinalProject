package fproject.app.fproject.Controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import fproject.app.fproject.vo.FavorlistVo;
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
		return "emoShop/main";
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
	
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public String basketPage(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage) {
		List<EmoshopVo> basketList = (List)req.getSession().getAttribute("basketList"); // basketList의 컬렉션(?)이 <EmoshopVo>여야 함
		req.getSession().setAttribute("basketList", basketList);
		//basketList = (List)req.getSession().getAttribute("basketList");
		model.addAttribute("list", basketList);
		return "emoShop/basket";
	}
	
	@RequestMapping(value="/moveBaskettoWish", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody()
	public String moveBaskettoWish(Model model, HttpSession session, @RequestBody List<Integer> moveList) {
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		List<EmoshopVo> wishList = favorListService.getUserWishList(userNum);
		//System.out.println("정렬 전 move: " + moveList);
		Collections.reverse(moveList);
		//System.out.println("정렬 후 move: " + moveList);
		//System.out.println("wishList: " + wishList.size());
		//System.out.println("basketList: " + basketList);
		for(int i : moveList) {
			boolean count = true;
			for(EmoshopVo vo : wishList) {
				if(vo.getEmognum() != basketList.get(i).getEmognum()) continue;
				count = false;
			}
			if(count) {
				favorListService.addUserWishList(new FavorlistVo(0, 0, basketList.get(i).getEmognum(), userNum));
			}
			basketList.remove(i);
		}
		//System.out.println("basketList: " + basketList.size());
		session.setAttribute("basketList", basketList);
		return "선택한 항목을 보관함으로 옮겼습니다.";
	}
	
	@RequestMapping(value="/delBasketItem", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody()
	public String delBasketItem(Model model, HttpSession session, @RequestBody List<Integer> delList) {
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		/*
		for(int i : delList) {
			System.out.print(i + " ");
		}
		System.out.println();
		for(EmoshopVo i : basketList) {
			System.out.print(i.getEmognum() + " ");
		}
		System.out.println();
		System.out.println("listsize: " + delList.size());
		System.out.println();
		/*
		for(int i=delList.size(); i>=0; i--) {
			basketList.remove(i);
		}
		*/
		Collections.reverse(delList);
		for(int i : delList) {
			basketList.remove(i);  
		}
		session.setAttribute("basketList", basketList);
		/*
		for(EmoshopVo i : basketList) {
			System.out.println(i.getEmognum());
		}
		*/
		return "선택한 항목을 삭제했습니다.";
	}
	
	@RequestMapping(value="/wishList", method=RequestMethod.GET)
	public String wishListPage(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage) {
		int userNum = (int)req.getSession().getAttribute("num"); // 사용자 번호 받아오기
		Paging pg = new Paging(4, favorListService.getCount(userNum), 7, thisPage);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pg.getStartRow());
		map.put("endRow", pg.getEndRow());
		map.put("userNum", userNum);
		map.put("startPage", pg.getStartPage());
		map.put("endPage", pg.getEndPage());
		map.put("thisPage", pg.getThisPage());
		List<EmoWishListVo> list = favorListService.getUserWishListPaging(map);
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		return "emoShop/wishList";
	}
	
	@RequestMapping(value="/moveWishtoBasket", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody()
	public String moveWishtoBasket(Model model, HttpSession session, @RequestBody List<Integer> moveList) {
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		for(int i : moveList) {
			boolean count = true;
			for(EmoshopVo vo : basketList) {
				if(vo.getEmognum() != i) continue;
				count = false;
			}
			if(count) {
				EmoshopVo vo = emoShopService.getEmogInfo(i);
				Map<String, Integer> map = new HashMap<String, Integer>();
				basketList.add(vo);
				map.put("emogNum", vo.getEmognum());
				map.put("userNum", userNum);
				favorListService.delUserWishItem(map);
			}
		}
		session.setAttribute("basketList", basketList);
		return "선택한 항목을 바구니로 옮겼습니다.";
	}
	
	@RequestMapping(value="/delWishItem", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody()
	public String delWishItem(Model model, HttpSession session, @RequestBody List<Integer> delList) {
		int userNum = (int)session.getAttribute("num");
		for(int i : delList) {
			EmoshopVo vo = emoShopService.getEmogInfo(i);
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("emogNum", vo.getEmognum());
			map.put("userNum", userNum);
			favorListService.delUserWishItem(map);
		}
		return "선택한 항목을 삭제했습니다.";
	}
	
	@RequestMapping(value="/purchase", method=RequestMethod.POST)
	public String purchasePageMove(Model model, HttpServletRequest req, int[] emognum, int[] prices) {
		List<EmoshopVo> basketList = (List)req.getSession().getAttribute("basketList");
		int userNum = (int)req.getSession().getAttribute("num");
		List<PurchaseVo> list = new ArrayList<PurchaseVo>();
		for(int i : emognum) {
			PurchaseVo vo = new PurchaseVo(0, null, i, userNum);
			list.add(vo);
		}
		emoShopService.savePurchaseList(list);
		return "emoShop/main";
	}
}