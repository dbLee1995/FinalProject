package fproject.app.fproject.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fproject.app.fproject.service.MemberService;

@Controller
public class EmoShopBasketController {
	@Autowired
	private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/emoShop/basket", method=RequestMethod.GET)
	public String pageMove(Model model, HttpServletRequest req) {
		String userId = (String)req.getSession().getAttribute("id");
		int userNum = service.getUserAccountInfo(userId).getNum();
		List<BasketVo> list = service.getUserBasket(userNum);
		model.add
		return "emoShop/emoBasket";
	}
}
