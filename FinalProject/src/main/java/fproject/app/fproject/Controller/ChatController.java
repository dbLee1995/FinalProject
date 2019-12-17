package fproject.app.fproject.Controller;


import java.math.BigDecimal;
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
	
	@RequestMapping(value="/ChatList")
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
		
		String friname="";
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname);
		map.put("num", num);
		List<HashMap<String, Object>> fvolist=friendsService.list(map);
		
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		for(HashMap<String,Object> aa:fvolist){
		
			int fnum=((BigDecimal)aa.get("FNUM")).intValue();
			
			ProfilesVo fvo=profilesService.info(fnum);
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		return "ChatList";
	}
	@RequestMapping(value="/CreateChat", 
			method={RequestMethod.POST,RequestMethod.GET})
	public String createChat(
			Model model, HttpServletRequest req, int num, String[] fvalue,
			HttpSession session){
		
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num);
		int Fclnum=0;
		
		if(fvalue==null){
			chatService.createChatRoom("나와의 채팅");
			int clnum=chatService.getRoomforName("나와의 채팅");
			chatService.addAttendInfo(new AttendinfoVo(clnum, num, 1));
		}else if(fvalue.length==1){
			int fnum=Integer.parseInt(fvalue[0]);
			List<AttendinfoVo> failist=chatService.getAttendInfo(fnum);
			int alreadyHave=0;
			for(int i=0;i<ailist.size();++i){
				for(int j=0;j<failist.size();++j){
					int aa=ailist.get(i).getClnum();
					int ff=failist.get(j).getClnum();
					if(aa == ff){
						int attendcount=chatService.getAttendCount(aa);
						if(attendcount==2)alreadyHave=aa; 
					}
				}
			}
			if(alreadyHave==0){
				ProfilesVo pvo=profilesService.info(fnum);
				chatService.createChatRoom(pvo.getName());
				int clnum=chatService.getRoomforName(pvo.getName());
				Fclnum=clnum;
				chatService.addAttendInfo(new AttendinfoVo(clnum, num, 1));
				chatService.addAttendInfo(new AttendinfoVo(clnum, fnum, 1));
			}else{
				chatService.updateAttendinfo(new AttendinfoVo(alreadyHave, num, 1));
				System.out.println("내정보 수정! alreadyHave:"+alreadyHave+",num:"+num);
				chatService.updateAttendinfo(new AttendinfoVo(alreadyHave, fnum, 1));
				System.out.println("친구정보 수정! alreadyHave:"+alreadyHave+",num:"+fnum);
				Fclnum=alreadyHave;
			}
		}else{
			int clnum=0;
			for(int i=0;i<fvalue.length;++i){
				int fnum=Integer.parseInt(fvalue[i]);
				ProfilesVo pvo=profilesService.info(fnum);
				if(i==0){
					String strChatName=pvo.getName()+"외 "+((fvalue.length)-1)+"명";
					chatService.createChatRoom(strChatName);
					clnum=chatService.getRoomforName(strChatName);
				}
				chatService.addAttendInfo(new AttendinfoVo(clnum, fnum, 1));
			}
			chatService.addAttendInfo(new AttendinfoVo(clnum, num, 1));
			Fclnum=clnum;
		}
		
		ailist=chatService.getAttendInfo(num);
		model.addAttribute("AcList",ailist);
		
		List<ChatlistVo> clist=chatService.getRoomList();
		model.addAttribute("ChatList",clist);
		
		Map<Integer, String> clnameMap=new HashMap<>();
		for(int i=0;i<clist.size();++i){
			String clname=chatService.getLastChat(clist.get(i).getClnum());
			clnameMap.put(clist.get(i).getClnum(), clname);
		}
		model.addAttribute("clnameMap", clnameMap);
		
		AccountVo accvo=accountService.info(num);
		model.addAttribute("id",accvo.getId());
		
		// 생성한 방으로 바로 세팅하기 위한 정보 전달
		model.addAttribute("clnum",Fclnum);
		if(Fclnum>0){
			ChatlistVo cvo=chatService.checkRoom(Fclnum);
			model.addAttribute("clvo",cvo);
		}
		List<ChatVo> cvolist=chatService.getChat(Fclnum);
		model.addAttribute("chat",cvolist);
		List<ChatVo> cvotimelist=chatService.getChattime(Fclnum);
		model.addAttribute("chattime",cvotimelist);
		Map<Integer, Integer> readinfomap=new HashMap<>(); 
		for(int i=0;i<cvolist.size();++i){
			ReadinfoVo readvo=new ReadinfoVo(cvolist.get(i).getCnum(), Fclnum, num);
			int is=chatService.getReadInfo(readvo);
			if(is==0){chatService.addReadInfo(readvo);}
			int readcount=chatService.getCountReadInfo(cvolist.get(i).getCnum());
			int usercount=chatService.getAttendCount(Fclnum);
			int rc=usercount-readcount;
			readinfomap.put(cvolist.get(i).getCnum(), rc);
		}
		model.addAttribute("readinfomap",readinfomap);
		
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
		
		model.addAttribute("clnum",clnum); // 현재 들어와있는 방
		
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
		
		String friname="";
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname); // 조회할 이름
		map.put("num", num);
		List<HashMap<String, Object>> fvolist=friendsService.list(map); // 해당 회원의 친구목록
		
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		for(HashMap<String,Object> aa:fvolist){
			int fnum=((BigDecimal)aa.get("FNUM")).intValue();
			ProfilesVo fvo=profilesService.info(fnum); // 친구 목록을 돌면서 정보를 리스트에 담기 
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		List<AttendinfoVo> savolist=chatService.sameAttendInfo(clnum); // 같은방에 존재하는 사람 정보
		Map<Integer, String> attname=new HashMap<>();
		for(int i=0;i<savolist.size();++i){
			ProfilesVo p=profilesService.info(savolist.get(i).getNum());
			attname.put(p.getNum(), p.getName()); // key:해당사람의 번호, value:이름
		}
		model.addAttribute("attname",attname); // 채팅 위에 이름을 띄우기 위함
		
		return "ChatList";
	}
	@RequestMapping(value="/chatAjax", produces="application/json;charset=utf-8")
	@ResponseBody
	public String chatAjax(int clnum, int num){
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
	@RequestMapping(value="/modiChatNameAjax", produces="application/json;charset=utf-8")
	@ResponseBody
	public String modifyChatNameAjax(int num, int clnum, String name){
		
		chatService.updateChatName(new ChatlistVo(clnum, name));
		return "";
	}
	@RequestMapping(value="/searchChatContentAjax", produces="application/json;charset=utf-8")
	@ResponseBody
	public String searchChatContentAjax(int clnum, String content, HttpSession session){
		
		List<ChatVo> cvolist=
				chatService.searchChatContent(new ChatVo(0, 0, content, null, 0, "", "", 0, clnum, 0));
		session.setAttribute("searchcvolist", cvolist);
		JSONObject json=new JSONObject();
		if(cvolist.size()>0){
			json.put("chatnum", cvolist.get(0).getCnum());
			json.put("chatcount", cvolist.size());
		}else{
			json.put("chatnum", 0);
		}
		return json.toString();
	}
	@RequestMapping(value="/searchChatUpAjax", produces="application/json;charset=utf-8")
	@ResponseBody
	public String searchChatUpAjax(int index, HttpSession session){
		
		List<ChatVo> cvolist=(ArrayList)session.getAttribute("searchcvolist");
		JSONObject json=new JSONObject();
		for(int i=1;i<=cvolist.size();++i){
			if(i==index){
				json.put("chatnum", cvolist.get(i-1).getCnum());
			}
		}
		return json.toString();
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
		
		String friname="";
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname); 
		map.put("num", num);
		List<HashMap<String, Object>> fvolist=friendsService.list(map); 
		
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		for(HashMap<String,Object> aa:fvolist){
			int fnum=((BigDecimal)aa.get("FNUM")).intValue();
			ProfilesVo fvo=profilesService.info(fnum);  
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		session.setAttribute("clnum", 0);
		
		return "ChatList";
	}
}
