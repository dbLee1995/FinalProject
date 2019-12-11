package fproject.app.fproject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.vo.FriendlistVo;

@Controller
public class FriendsController {
	@Autowired private FriendsService service;
	@RequestMapping("/friends/list")
	public String list(Model model,int num){
		List<FriendlistVo> list=service.list(num);
		model.addAttribute("list", list);
		return "friends/friendslist";
	}
}
