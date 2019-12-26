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

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.ChatService;
import fproject.app.fproject.service.EmoShopService;
import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.AttendinfoVo;
import fproject.app.fproject.vo.ChatVo;
import fproject.app.fproject.vo.ChatlistVo;
import fproject.app.fproject.vo.ProfilesVo;
import fproject.app.fproject.vo.ReadinfoVo;

@Controller
public class ChatController {
	@Autowired ChatService chatService;
	@Autowired AccountService accountService;
	@Autowired FriendsService friendsService;
	@Autowired ProfilesService profilesService;
	@Autowired EmoShopService emoService;
	
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
		
		Map<Integer, Integer> chatCountMap= new HashMap<>();
		for(int i=0;i<ailist.size();++i){ 
			int aclnum=ailist.get(i).getClnum();
			int readChatCount=chatService.getChatReadCount(new ReadinfoVo(0, aclnum, num));
			int chatCount=chatService.getChatCount(aclnum);
			int fChatCount=chatCount-readChatCount;
			chatCountMap.put(aclnum, fChatCount);
		}
		model.addAttribute("chatCountMap",chatCountMap);
		
		return "ChatList";
	}
	@RequestMapping(value="/CreateChat", 
			method={RequestMethod.POST,RequestMethod.GET})
	public String createChat(
			Model model, HttpServletRequest req, int num, String[] fvalue,
			HttpSession session){
		
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num);
		int Fclnum=0;
		int fintvalue=0;
		if(fvalue !=null){
			fintvalue= Integer.parseInt(fvalue[0]);
		}
		
		if(fvalue==null || fintvalue==num){
			int clnum=chatService.getRoomforName("占쎄돌占쏙옙占쎌벥 筌�袁る샒");
			if(clnum>0){
				chatService.updateAttendinfo(new AttendinfoVo(clnum, num, 1));
			}else{
				chatService.createChatRoom("占쎄돌占쏙옙占쎌벥 筌�袁る샒");
				clnum=chatService.getRoomforName("占쎄돌占쏙옙占쎌벥 筌�袁る샒");
				chatService.addAttendInfo(new AttendinfoVo(clnum, num, 1));
			}
			
			
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
				System.out.println("占쎄땀占쎌젟癰귨옙 占쎈땾占쎌젟! alreadyHave:"+alreadyHave+",num:"+num);
				chatService.updateAttendinfo(new AttendinfoVo(alreadyHave, fnum, 1));
				System.out.println("燁살뮄�럡占쎌젟癰귨옙 占쎈땾占쎌젟! alreadyHave:"+alreadyHave+",num:"+fnum);
				Fclnum=alreadyHave;
			}
		}else{
			int clnum=0;
			for(int i=0;i<fvalue.length;++i){
				int fnum=Integer.parseInt(fvalue[i]);
				ProfilesVo pvo=profilesService.info(fnum);
				if(i==0){
					String strChatName=pvo.getName()+"占쎌뇚 "+((fvalue.length)-1)+"筌륅옙";
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
		
		// 占쎄문占쎄쉐占쎈립 獄쎻뫗�몵嚥∽옙 獄쏅뗀以� 占쎄쉭占쎈샒占쎈릭疫뀐옙 占쎌맄占쎈립 占쎌젟癰귨옙 占쎌읈占쎈뼎
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
		model.addAttribute("ChatList",clist); // 筌뤴뫀諭� 筌�袁る샒�뵳�딅뮞占쎈뱜 (占쎌뵠�뵳袁⑹뱽 揶쏉옙占쎌죬占쎌궎疫뀐옙 占쎌맄占쎈맙)
		
		Map<Integer, String> clnameMap=new HashMap<>(); // 占쎌뵠�뵳袁⑹뱽 占쎈뼖疫꿸퀣�맄占쎈립 筌랃옙
		for(int i=0;i<clist.size();++i){
			String clname=chatService.getLastChat(clist.get(i).getClnum());
			clnameMap.put(clist.get(i).getClnum(), clname); // key:clnum,value:clname
		}
		model.addAttribute("clnameMap", clnameMap);
		
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num); // 占쎌겱占쎌삺 占쎈７占쎈맙占쎈┷占쎈선占쎌뿳占쎈뮉 獄쏉옙 占쎌읈筌ｋ��걠嚥∽옙
		model.addAttribute("AcList",ailist);
		
		model.addAttribute("clnum",clnum); // 占쎌겱占쎌삺 占쎈굶占쎈선占쏙옙占쎌뿳占쎈뮉 獄쏉옙
		
		if(clnum>0){
			ChatlistVo cvo=chatService.checkRoom(clnum); // 占쎌겱占쎌삺 占쎈굶占쎈선占쏙옙占쎌뿳占쎈뮉 獄쏉옙 占쎌젟癰귨옙
			model.addAttribute("clvo",cvo);
		}
		session.setAttribute("clnum", clnum);
		
		List<ChatVo> cvolist=chatService.getChat(clnum); // 占쎈퉸占쎈뼣 獄쎻뫗�벥 筌�袁る샒 筌뤴뫖以�
		model.addAttribute("chat",cvolist);
		
		Map<Integer, Integer> readinfomap=new HashMap<>(); // 占쎌뵭占쏙옙 占쎄텢占쎌뿺 占쎌젟癰귣�占쏙옙 占쎈뼖疫꿸퀣�맄占쎈립 筌랃옙
		for(int i=0;i<cvolist.size();++i){
			ReadinfoVo readvo=new ReadinfoVo(cvolist.get(i).getCnum(), clnum, num);
			// 筌�袁る샒占쎌뱽 占쎈립揶쏆뮇逾� 占쎈즼筌롫똻苑� 占쎌맄占쎌벥 占쎌젟癰귣떯占� 占쎈굶占쎈선占쎌뿳占쎈뮉筌욑옙 占쎌넇占쎌뵥(clnum, num)
			int is=chatService.getReadInfo(readvo); // clnum,num 占쎌뵠 占쎈짗占쎌뵬占쎈립 占쎌젟癰귣떯占� 占쎌뿳占쎈뮉筌욑옙 占쎌넇占쎌뵥
			if(is==0){
				chatService.addReadInfo(readvo); // 占쎈씨占쎌몵筌롳옙 �빊遺쏙옙
			}
			int readcount=chatService.getCountReadInfo(cvolist.get(i).getCnum()); // 占쎌뵭占쏙옙 占쎄텢占쎌뿺 占쎈땾
			int usercount=chatService.getAttendCount(clnum); // 占쎌겱占쎌삺 獄쏉옙 占쎌뵥占쎌뜚占쎈땾
			int rc=usercount-readcount;
			readinfomap.put(cvolist.get(i).getCnum(), rc); // key:cnum,value:count
		}
		model.addAttribute("readinfomap",readinfomap);
		
		List<ChatVo> cvotimelist=chatService.getChattime(clnum); // 筌�袁る샒 占쎌뿯占쎌젾占쎈뻻揶쏉옙 占쎌젟癰귨옙
		model.addAttribute("chattime",cvotimelist);
		
		String friname="";
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname); // 鈺곌퀬�돳占쎈막 占쎌뵠�뵳占�
		map.put("num", num);
		List<HashMap<String, Object>> fvolist=friendsService.list(map); // 占쎈퉸占쎈뼣 占쎌돳占쎌뜚占쎌벥 燁살뮄�럡筌뤴뫖以�
		
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		for(HashMap<String,Object> aa:fvolist){
			int fnum=((BigDecimal)aa.get("FNUM")).intValue();
			ProfilesVo fvo=profilesService.info(fnum); // 燁살뮄�럡 筌뤴뫖以됵옙�뱽 占쎈즼筌롫똻苑� 占쎌젟癰귣�占쏙옙 �뵳�딅뮞占쎈뱜占쎈퓠 占쎈뼖疫뀐옙 
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		List<AttendinfoVo> savolist=chatService.sameAttendInfo(clnum); // 揶쏆늿占썼쳸�뫗肉� 鈺곕똻�삺占쎈릭占쎈뮉 占쎄텢占쎌뿺 占쎌젟癰귨옙
		Map<Integer, String> attname=new HashMap<>();
		for(int i=0;i<savolist.size();++i){
			ProfilesVo p=profilesService.info(savolist.get(i).getNum());
			attname.put(p.getNum(), p.getName()); // key:占쎈퉸占쎈뼣占쎄텢占쎌뿺占쎌벥 甕곕뜇�깈, value:占쎌뵠�뵳占�
		}
		model.addAttribute("attname",attname); // 筌�袁る샒 占쎌맄占쎈퓠 占쎌뵠�뵳袁⑹뱽 占쎌뱽占쎌뒭疫뀐옙 占쎌맄占쎈맙
		
		Map<Integer, Integer> chatCountMap= new HashMap<>();
		for(int i=0;i<ailist.size();++i){ // 占쎌겱占쎌삺 占쎈７占쎈맙占쎈┷占쎈선占쎌뿳占쎈뮉 獄쎻뫖諭억옙�뱽 占쎈즼筌롫똻苑�
			int aclnum=ailist.get(i).getClnum(); // 獄쎻뫖諭억옙�벥 甕곕뜇�깈 占쎈섯疫뀐옙 
			int readChatCount=chatService.getChatReadCount(new ReadinfoVo(0, aclnum, num));
			// 占쎈퉸占쎈뼣 獄쎻뫗肉됵옙苑� 占쎄땀揶쏉옙 占쎌뵭占쏙옙 疫뀐옙占쎌벥 揶쏉옙占쎈땾 占쎈섯疫뀐옙
			int chatCount=chatService.getChatCount(aclnum); // 占쎈퉸占쎈뼣 獄쎻뫗�벥 �룯占� 筌�袁る샒 揶쏉옙占쎈땾 占쎈섯疫뀐옙
			int fChatCount=chatCount-readChatCount;
			chatCountMap.put(aclnum, fChatCount);
		}
		model.addAttribute("chatCountMap",chatCountMap);
		
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
	@RequestMapping(value="/getChatCount", produces="application/json;charset=utf-8")
	@ResponseBody
	public String getChatCount(int num, HttpSession session){
		
		List<AttendinfoVo> attvolist=chatService.getAttendInfo(num);
		JSONArray jarr=new JSONArray();
		for(int i=0;i<attvolist.size();++i){
			int clnum=attvolist.get(i).getClnum();
			int readChatCount=chatService.getChatReadCount(new ReadinfoVo(0, clnum, num));
			int chatCount=chatService.getChatCount(clnum);
			JSONObject json=new JSONObject();
			json.put("clnum", clnum);
			json.put("chatCount", chatCount-readChatCount);
			jarr.put(json);
		}
		return jarr.toString();
	}
	@RequestMapping(value="/removeChatRoom")
	public String removeChatRoom(Model model, int clnum, int num, int check,
			HttpSession session){
		
		chatService.updateAttendinfo(new AttendinfoVo(clnum, num, 0));
		
		if(check==0){
			chatService.deleteReadInfo(clnum);
			chatService.deleteChat(clnum);
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
	@RequestMapping(value="/updateRoomName")
	public String updateRoomName(int clnum,int num,String name,Model model,HttpSession session){
		ChatlistVo clvo=new ChatlistVo(clnum, name);
		chatService.updateChatName(clvo);
		return moveChatRoom(model, clnum, num, session);
	}
	
	@RequestMapping(value="/chat/sendEmoticon", produces={"application/text;charset=UTF-8"})
	@ResponseBody
	public String sendEmoticon(int userNum) {
		JSONArray list = new JSONArray(emoService.getUserEmoList(userNum));
		System.out.println(list.toString());
		return list.toString();
	}
}
