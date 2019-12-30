package fproject.app.fproject.Controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import fproject.app.fproject.vo.FavorlistVo;
import fproject.app.fproject.vo.PurchaseVo;

@Controller
@RequestMapping("emoShop")
public class EmoShopController {
	@Autowired
	private FavorListService favorListService;
	@Autowired
	private EmoShopService emoShopService;

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String mainPage(Model model, HttpServletRequest req) {
		int userNum = (int)req.getSession().getAttribute("num");
		List<EmoticongroupVo> emogroupList = emoShopService.getPopulEmoList();
		List<EmoshopVo> populEmoList = new ArrayList<EmoshopVo>();
		for(EmoticongroupVo vo : emogroupList) {
			populEmoList.add(emoShopService.getEmogInfo(vo.getEmognum())); 
		}
		List<EmoshopVo> userEmoList = emoShopService.getUserEmoList(userNum);
		Map<Integer, Integer> purchaseMap = new HashMap<Integer, Integer>();
		for(EmoshopVo userEvo : userEmoList) {
			purchaseMap.put(userEvo.getEmognum(), 0);
		}
		model.addAttribute("purchaseMap", purchaseMap);
		model.addAttribute("newEmoList", emoShopService.getNewEmoList());
		model.addAttribute("populEmoList", populEmoList);
		model.addAttribute("category3", emoShopService.getCategoryEmoList("분위기"));
		model.addAttribute("category2", emoShopService.getCategoryEmoList("동물"));
		model.addAttribute("category1", emoShopService.getCategoryEmoList("연말"));
		return "emoShop/main";
	}
	
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public String basketPage(Model model, HttpServletRequest req) {
		List<EmoshopVo> basketList = (List)req.getSession().getAttribute("basketList"); // basketList의 컬렉션(?)이 <EmoshopVo>여야 함
		req.getSession().setAttribute("basketList", basketList);
		model.addAttribute("list", basketList);
		return "emoShop/basket";
	}
	
	@RequestMapping(value="/emoticon", method=RequestMethod.GET)
	public String emoDetail(Model model, HttpServletRequest req, int emognum) {
		EmoshopVo emo = emoShopService.getEmogInfo(emognum);
		model.addAttribute("vo", emo);
		model.addAttribute("list", emoShopService.getEmoticonList(emognum));
		model.addAttribute("category", emoShopService.getCategoryEmoList(emo.getCategory()));
		return "emoShop/emoticon";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String emoNew(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage) {
		int userNum = (int)req.getSession().getAttribute("num");
		Paging pg = new Paging(10, emoShopService.getNewEmoTotalCount(), 10, thisPage);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", pg.getStartRow());
		map.put("endRow", pg.getEndRow());
		map.put("userNum", userNum);
		map.put("startPage", pg.getStartPage());
		map.put("endPage", pg.getEndPage());
		map.put("thisPage", pg.getThisPage());
		map.put("lastPage", pg.getTotalPageCount());
		List<EmoshopVo> userEmoList = emoShopService.getUserEmoList(userNum);
		Map<Integer, Integer> purchaseMap = new HashMap<Integer, Integer>();
		for(EmoshopVo userEvo : userEmoList) {
			purchaseMap.put(userEvo.getEmognum(), 0);
		}
		model.addAttribute("purchaseMap", purchaseMap);
		model.addAttribute("newEmoList", emoShopService.getNewEmoPagingList(map));
		model.addAttribute("map", map);
		return "emoShop/new";
	}
	
	@RequestMapping(value="/popular", method=RequestMethod.GET)
	public String popular(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage) {
		int userNum = (int)req.getSession().getAttribute("num");
		List<EmoticongroupVo> sortList = emoShopService.getPopulEmoList();
		List<EmoshopVo> popularList = new ArrayList<EmoshopVo>();
		for(EmoticongroupVo gvo : sortList) {
			popularList.add(emoShopService.getEmogInfo(gvo.getEmognum()));
		}
		model.addAttribute("list", popularList);
		
		
		Paging pg = new Paging(10, emoShopService.getPopularEmoListTotalCount(), 10, thisPage);

		System.out.println(emoShopService.getPopularEmoListTotalCount());
		System.out.println(pg.getStartRow());
		System.out.println(pg.getEndRow());
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", pg.getStartRow());
		map.put("endRow", pg.getEndRow());
		map.put("userNum", userNum);
		map.put("startPage", pg.getStartPage());
		map.put("endPage", pg.getEndPage());
		map.put("thisPage", pg.getThisPage());
		map.put("lastPage", pg.getTotalPageCount());
		List<EmoshopVo> userEmoList = emoShopService.getUserEmoList(userNum);
		Map<Integer, Integer> purchaseMap = new HashMap<Integer, Integer>();
		for(EmoshopVo userEvo : userEmoList) {
			purchaseMap.put(userEvo.getEmognum(), 0);
		}
		model.addAttribute("purchaseMap", purchaseMap);
		model.addAttribute("populEmoList", emoShopService.getPopularEmoPagingList(map));
		model.addAttribute("map", map);
		return "emoShop/popular";
	}
	
	@RequestMapping(value="/style/category", method=RequestMethod.GET)
	public String emoCategory(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage, String c) {
		int userNum = (int)req.getSession().getAttribute("num");
		Paging pg = new Paging(10, emoShopService.getCateEmoTotalCount(c), 10, thisPage);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", (int)pg.getStartRow());
		map.put("endRow", (int)pg.getEndRow());
		map.put("userNum", (int)userNum);
		map.put("startPage", (int)pg.getStartPage());
		map.put("endPage", (int)pg.getEndPage());
		map.put("thisPage", (int)pg.getThisPage());
		map.put("lastPage", (int)pg.getTotalPageCount());
		map.put("category", (String)c);
		List<EmoshopVo> userEmoList = emoShopService.getUserEmoList(userNum);
		Map<Integer, Integer> purchaseMap = new HashMap<Integer, Integer>();
		for(EmoshopVo userEvo : userEmoList) {
			purchaseMap.put(userEvo.getEmognum(), 0);
		}
		model.addAttribute("purchaseMap", purchaseMap);
		model.addAttribute("cateEmoList", emoShopService.getCateEmoPagingList(map));
		model.addAttribute("map", map);
		model.addAttribute("cateList", emoShopService.getCategoryList());
		return "emoShop/category";
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
		map.put("lastPage", pg.getTotalPageCount());
		List<EmoWishListVo> list = favorListService.getUserWishListPaging(map);
		model.addAttribute("wishList", list);
		model.addAttribute("map", map);
		return "emoShop/wishList";
	}
	
	@RequestMapping(value="/purchase", method=RequestMethod.POST)
	public String purchase(Model model, HttpServletRequest req, int[] emognum, int[] prices) {
		List<EmoshopVo> basketList = (List)req.getSession().getAttribute("basketList");
		int userNum = (int)req.getSession().getAttribute("num");
		List<PurchaseVo> list = new ArrayList<PurchaseVo>();
		for(int i : emognum) {
			PurchaseVo vo = new PurchaseVo(0, null, i, userNum);
			list.add(vo);
		}
		try {
			emoShopService.savePurchaseList(list);
			return mainPage(model, req);
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("purchaseError", false);
			return mainPage(model, req);
		}
	}
	
	@RequestMapping(value="/purchaseOne", produces={"application/text;charset=UTF-8"},method=RequestMethod.POST)
	@ResponseBody
	public String purchaseOne(Model model, HttpServletRequest req, String emognum) {
		int emonum = Integer.parseInt(emognum);
		int userNum = (int)req.getSession().getAttribute("num");
		List<EmoshopVo> userEmoList = emoShopService.getUserEmoList(userNum);
		boolean c = true;
		for(EmoshopVo evo : userEmoList) {
			if(evo.getEmognum() != emonum) continue;
			c = false;
		}
		
		if(c) {
			List<PurchaseVo> list = new ArrayList<PurchaseVo>();
			list.add(new PurchaseVo(0, null, emonum, userNum));
			emoShopService.savePurchaseList(list);
			return "구매하였습니다.";
		} else {
			return "이미 구매한 이모티콘입니다.";
		}
	}
	
	@RequestMapping(value="/popular", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody
	public String morePopularList(String thisPage) {
		int page = Integer.parseInt(thisPage);
		System.out.println(page);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", page*10-9);
		map.put("endRow", page*10);
		JSONArray jArray = new JSONArray(emoShopService.getPopularEmoPagingList(map));
		return jArray.toString();
	}
	
	@RequestMapping(value="/putBasket", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody
	public String putBasket(Model model, HttpSession session, String emognum, String check) {
		int emonum = Integer.parseInt(emognum);
		int checknum = Integer.parseInt(check);
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		boolean c = true;
		JSONObject json = new JSONObject();
		for(EmoshopVo evo : basketList) {
			if(evo.getEmognum() != emonum || evo == null) continue;
			c = false;
		}
		if(c) {
			basketList.add(emoShopService.getEmogInfo(emonum));
			json.put("text", "바구니에 담았습니다.");
			json.put("check", 1);
		} else {
			json.put("text", "이미 담아둔 이모티콘입니다.");
			json.put("check", 0);
		}
		return json.toString();
	}
	
	@RequestMapping(value="/putWish", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody
	public String putWishList(Model model, HttpSession session, String emognum, String check) {
		int emonum = Integer.parseInt(emognum);
		int checknum = Integer.parseInt(check);
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> wishList = favorListService.getUserWishList(userNum);
		boolean c = true;
		JSONObject json = new JSONObject();
		for(EmoshopVo evo : wishList) {
			if(evo.getEmognum() != emonum || evo == null) continue;
			c = false;
		}
		if(c) {
			favorListService.addUserWishList(new FavorlistVo(0, 0, emonum, userNum));
			json.put("text", "찜 목록에 추가했습니다.");
			json.put("check", 1);
		} else {
			json.put("text", "이미 찜해둔 이모티콘입니다.");
			json.put("check", 0);
		}
		return json.toString();
	}
	
	@RequestMapping(value="/moveBaskettoWish", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody()
	public String moveBaskettoWish(Model model, HttpSession session, @RequestBody List<Integer> moveList) {
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		List<EmoshopVo> wishList = favorListService.getUserWishList(userNum);
		Collections.reverse(moveList);
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
		session.setAttribute("basketList", basketList);
		return "선택한 항목을 찜 목록으로 옮겼습니다.";
	}
	
	@RequestMapping(value="/delBasketItem", produces={"application/text;charset=UTF-8"}, method=RequestMethod.POST)
	@ResponseBody()
	public String delBasketItem(Model model, HttpSession session, @RequestBody List<Integer> delList) {
		int userNum = (int)session.getAttribute("num");
		System.out.println(delList);
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		Collections.reverse(delList);
		for(int i : delList) {
			basketList.remove(i);  
		}
		session.setAttribute("basketList", basketList);
		return "선택한 항목을 삭제했습니다.";
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
}