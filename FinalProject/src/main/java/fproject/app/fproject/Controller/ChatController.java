package fproject.app.fproject.Controller;


import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.ChatService;
import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;
import fproject.app.fproject.vo.FriendlistVo;
import fproject.app.fproject.vo.ProfilesVo;
import fproject.app.fproject.vo.ReadinfoVo;

@Controller
public class ChatController {
	@Autowired ChatService chatService;
	@Autowired AccountService accountService;
	@Autowired FriendsService friendsService;
	@Autowired ProfilesService profilesService;
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
		
		List<FriendlistVo> fvolist=friendsService.list(num);
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		for(int i=0;i<fvolist.size();++i){
			int fnum=fvolist.get(i).getFnum();
			ProfilesVo fvo=profilesService.info(fnum);
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		return "ChatList";
	}
	@RequestMapping(value="/CreateChat", 
			method={RequestMethod.POST,RequestMethod.GET})
	public String createChat(
			Model model, HttpServletRequest req, int num, String[] fvalue){
		
		if(fvalue==null){
			chatService.createChatRoom("나와의 채팅");
			int clnum=chatService.getRoomforName("나와의 채팅");
			chatService.addAttendInfo(new AttendinfoVo(clnum, num, 1));
		}else if(fvalue.length==1){
			int fnum=Integer.parseInt(fvalue[0]);
			// 만약에 위 친구와 개설한 방이 이미 있다면
			// 해당 방으로 이동하게 한다.
			ProfilesVo pvo=profilesService.info(fnum);
			chatService.createChatRoom(pvo.getName());
			int clnum=chatService.getRoomforName(pvo.getName());
			chatService.addAttendInfo(new AttendinfoVo(clnum, num, 1));
			chatService.addAttendInfo(new AttendinfoVo(clnum, fnum, 1));
		}else{
			for(int i=0;i<fvalue.length;++i){
				//int fnum=Integer.parseInt(fvalue[i]);
				//ProfilesVo pvo=profilesService.info(fnum);
				// attendinfo 에 넣기 
				// 다수일때는 다른방을 따로 만들어서 넣기!
			}
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
		
		List<FriendlistVo> fvolist=friendsService.list(num); // 해당 회원의 친구목록
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		int count=1;
		for(int i=0;i<fvolist.size();++i){
			int fnum=fvolist.get(i).getFnum();
			ProfilesVo fvo=profilesService.info(fnum); // 친구 목록을 돌면서 정보를 리스트에 담기 
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		return "ChatList";
	}
	@RequestMapping(value="/ChatAjax", produces="application/json;charset=utf-8")
	@ResponseBody
	public String ChatAjax(int clnum, int num){
		List<ChatVo> cvolist=chatService.getChat(clnum);
		JSONArray jarr=new JSONArray();
		for(int i=0;i<cvolist.size();++i){
			ReadinfoVo readvo=new ReadinfoVo(cvolist.get(i).getCnum(), clnum, num);
			int is=chatService.getReadInfo(readvo);
			if(is==0){
				chatService.addReadInfo(readvo);
			}
			int readcount=chatService.getCountReadInfo(cvolist.get(i).getCnum());
			int usercount=chatService.getAttendCount(clnum);
			int rc=usercount-readcount;
			JSONObject json=new JSONObject();
			json.put("chatnum", cvolist.get(i).getCnum());
			json.put("count", rc);
			jarr.put(json);
		}
		return jarr.toString();
	}
	@RequestMapping(value="/removeChatRoom")
	public String removeChatRoom(Model model, int clnum, int num, 
			HttpSession session){
		
		chatService.updateAttendinfo(new AttendinfoVo(clnum, num, 0));
		
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
}
