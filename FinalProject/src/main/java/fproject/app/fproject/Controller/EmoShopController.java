package fproject.app.fproject.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmoShopController {
	
	@RequestMapping(value="/emoShop", method=RequestMethod.GET)
	public String pageMove(Model model, HttpServletRequest req) {
		String userId = (String)req.getSession().getAttribute("id"); // 로그인 검사
		if(userId!=null) {
			
		} else {
			
		}
		return "emoticonShop/main";
	}
}