package fproject.app.fproject.Controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.ChatService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;

@Controller
public class ChatController {
	@Autowired ChatService chatService;
	@Autowired AccountService accountService;
	@RequestMapping(value="/ChatList", method=RequestMethod.GET)
	public String chat(Model model, HttpServletRequest req, int num, int clnum){
		
		List<ChatlistVo> clist=chatService.getRoomList();
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num);
		model.addAttribute("ChatList",clist);
		model.addAttribute("AcList",ailist);
		
		AccountVo accvo=accountService.info(num);
		model.addAttribute("id",accvo.getId());
		
		model.addAttribute("clnum",clnum);
		
		return "ChatList";
	}
	@RequestMapping(value="/CreateChat", 
			method={RequestMethod.POST,RequestMethod.GET})
	public String createChat(
			Model model, HttpServletRequest req, ChatlistVo clvo){

		return "";
	}
	@RequestMapping(value="/moveChatRoom")
	public String moveChatRoom(Model model, int clnum, int num, 
			HttpSession session){
		
		ModelAndView mv=new ModelAndView("/ChatList");
		
		List<ChatlistVo> clist=chatService.getRoomList();
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num);
		model.addAttribute("ChatList",clist);
		model.addAttribute("AcList",ailist);
		model.addAttribute("clnum",clnum);
		
		if(clnum>0){
			ChatlistVo cvo=chatService.checkRoom(clnum);
			model.addAttribute("clvo",cvo);
		}
		session.setAttribute("clnum", clnum);
		
		// 해당 방번호에 해당하는 채팅내용 로딩하기 
		List<ChatVo> cvolist=chatService.getChat(clnum);
		model.addAttribute("chat",cvolist);
		
		return "ChatList";
	}
}
