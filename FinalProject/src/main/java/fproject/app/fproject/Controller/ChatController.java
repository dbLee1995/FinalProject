package fproject.app.fproject.Controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fproject.app.fproject.service.ChatService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatlistVo;


@Controller
public class ChatController {
	@Autowired ChatService chatService;
	@RequestMapping(value="/ChatList", method=RequestMethod.GET)
	public String chat(Model model, HttpServletRequest req){
		//AccountVo avo=(AccountVo)req.getSession().getAttribute("login");
		AccountVo avo=new AccountVo(0, "test", "1234");
		if(avo==null){
			return "home";
		}
		List<ChatlistVo> clist=chatService.getRoomList();
		model.addAttribute("ChatList",clist);
		System.out.println(clist.get(0).getName());
		System.out.println(clist.get(1).getName());
		model.addAttribute("id","test");
		return "ChatList";
	}
	@RequestMapping(value="/CreateChat", 
			method={RequestMethod.POST,RequestMethod.GET})
	public String createChat(
			Model model, HttpServletRequest req, ChatlistVo clvo){
		AccountVo avo=(AccountVo)req.getSession().getAttribute("login");
		if(avo==null){
			return "home";
		}
		// 방 이름
		int n=chatService.createChatRoom(new ChatlistVo(0, "test"));
		if(n>0){
			
		}else{
			System.out.println("방 생성 실패 ㅜㅜㅜ");
		}
		// 인원 수만큼
		chatService.addAttendInfo(new AttendinfoVo(1, 1, 1));
		chatService.addAttendInfo(new AttendinfoVo(1, 2, 1));
		return "";
	}
}
