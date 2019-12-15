package fproject.app.fproject.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		//List<EmoticongroupVo> emolist = emoShopService.getList();
		//model.addAttribute("list", emolist);
		return "emoShop/main";
	}
	
	@RequestMapping(value="/wishList", method=RequestMethod.GET)
	public String wishListPage(Model model, HttpServletRequest req, @RequestParam(defaultValue="1") int thisPage, HttpServletResponse res) {
		int userNum = (int)req.getSession().getAttribute("num"); // ����� ��ȣ �޾ƿ���
		
		List<EmoshopVo> basketList = (List)req.getSession().getAttribute("basketList");
		basketList.add(emoShopService.getEmogInfo(42));
		req.getSession().setAttribute("basketList", basketList);
		basketList = (List)req.getSession().getAttribute("basketList");
		
		Paging pg = new Paging(4, favorListService.getCount(userNum), 7, thisPage);
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
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList"); // basketList�� �÷���(?)�� <EmoshopVo>���� ��
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
		JSONObject json = new JSONObject("'result':'��ٱ��Ͽ� ��ҽ��ϴ�.'");
		return json.toString();
	}
	
	@RequestMapping(value="/moveBasket", method=RequestMethod.POST)
	@ResponseBody
	public String moveBasket(Model model, int[] moveList, HttpSession session) {
		int userNum = (int)session.getAttribute("num");
		List<EmoshopVo> basketList = (List)session.getAttribute("basketList");
		for(int i : moveList) {
			boolean count = true;
			for(EmoshopVo vo : basketList) {
				if(vo.getEmognum() != i) continue;
				count = false;
			}
			if(count) basketList.add(emoShopService.getEmogInfo(i));	
		}
		return "���������� �Ű���ϴ�.";
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
		model.addAttribute("feature", "�̸�Ƽ�� ����");
		List<PurchaseVo> list = vo.getList();
		if(list != null) {
			emoShopService. savePurchaseList(list);
			return "emoShop/main";
		} else {
			return "test/error";
		}
	}
}