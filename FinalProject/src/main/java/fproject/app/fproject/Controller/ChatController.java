package fproject.app.fproject.Controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import fproject.app.fproject.vo.ReadinfoVo;

@Controller
public class ChatController {
	@Autowired ChatService chatService;
	@Autowired AccountService accountService;
	@RequestMapping(value="/ChatList", method=RequestMethod.GET)
	public String chat(Model model, HttpServletRequest req, int num, int clnum){
		
		List<ChatlistVo> clist=chatService.getRoomList();
		Map<Integer, String> clnameMap=new HashMap<>();
		for(int i=0;i<clist.size();++i){
			String clname=chatService.getLastChat(clist.get(i).getClnum());
			clnameMap.put(clist.get(i).getClnum(), clname);
		}
		model.addAttribute("clnameMap", clnameMap);
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
			Model model, HttpServletRequest req, int num, String[] fvalue){
		
		/*
		chatService.createChatRoom("방생성");
		int roomnum=chatService.getRoomforName("방생성");
		fnum 친구 번호를 같이 받아서 넣기 
		if(fnum==0){
			친구번호가 0이면 나와의채팅
		}
		*/
		for(int i=0;i<fvalue.length;++i){
			System.out.println(fvalue[i]); // fvalue 를 돌면서 
			// 안에 있는 회원번호 꺼내기 (String)
			// attendinfo 에 넣기 
		}
		
		List<ChatlistVo> clist=chatService.getRoomList();
		model.addAttribute("ChatList",clist);
		
		Map<Integer, String> clnameMap=new HashMap<>();
		for(int i=0;i<clist.size();++i){
			String clname=chatService.getLastChat(clist.get(i).getClnum());
			clnameMap.put(clist.get(i).getClnum(), clname);
		}
		model.addAttribute("clnameMap", clnameMap);
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num);
		model.addAttribute("ChatList",clist);
		model.addAttribute("AcList",ailist);
		
		AccountVo accvo=accountService.info(num);
		model.addAttribute("id",accvo.getId());
		
		return "ChatList";
	}
	@RequestMapping(value="/moveChatRoom")
	public String moveChatRoom(Model model, int clnum, int num, 
			HttpSession session){
		
		List<ChatlistVo> clist=chatService.getRoomList();
		model.addAttribute("ChatList",clist); // 모든 채팅리스트 (이름을 가져오기 위함)
		
		Map<Integer, String> clnameMap=new HashMap<>(); // 이름을 담기위한 맵
		for(int i=0;i<clist.size();++i){
			String clname=chatService.getLastChat(clist.get(i).getClnum());
			clnameMap.put(clist.get(i).getClnum(), clname); // key:clnum,value:clname
		}
		model.addAttribute("clnameMap", clnameMap);
		
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num); // 현재 포함되어있는 방 전체목록
		model.addAttribute("AcList",ailist);
		
		model.addAttribute("clnum",clnum); // 현재 들어와있는 방 목록
		
		if(clnum>0){
			ChatlistVo cvo=chatService.checkRoom(clnum); // 현재 들어와있는 방 정보
			model.addAttribute("clvo",cvo);
		}
		session.setAttribute("clnum", clnum);
		
		List<ChatVo> cvolist=chatService.getChat(clnum); // 해당 방의 채팅 목록
		model.addAttribute("chat",cvolist);
		
		Map<Integer, Integer> readinfomap=new HashMap<>(); // 읽은 사람 정보를 담기위한 맵
		for(int i=0;i<cvolist.size();++i){
			ReadinfoVo readvo=new ReadinfoVo(cvolist.get(i).getCnum(), clnum, num);
			// 채팅을 한개씩 돌면서 위의 정보가 들어있는지 확인(clnum, num)
			int is=chatService.getReadInfo(readvo); // clnum,num 이 동일한 정보가 있는지 확인
			if(is==0){
				chatService.addReadInfo(readvo); // 없으면 추가
			}
			int readcount=chatService.getCountReadInfo(cvolist.get(i).getCnum()); // 읽은 사람 수
			int usercount=chatService.getAttendCount(clnum); // 현재 방 인원수
			int rc=usercount-readcount;
			readinfomap.put(cvolist.get(i).getCnum(), rc); // key:cnum,value:count
		}
		model.addAttribute("readinfomap",readinfomap);
		
		List<ChatVo> cvotimelist=chatService.getChattime(clnum); // 채팅 입력시간 정보
		model.addAttribute("chattime",cvotimelist);
		
		return "ChatList";
	}
	@RequestMapping(value="/removeChatRoom")
	public String removeChatRoom(Model model, int clnum, int num, 
			HttpSession session){
		
		chatService.updateAttendinfo(new AttendinfoVo(clnum, num, 0));
		
		return "ChatList";
	}
}
