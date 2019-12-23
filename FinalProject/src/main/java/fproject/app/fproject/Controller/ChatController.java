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
			int clnum=chatService.getRoomforName("�굹���쓽 梨꾪똿");
			if(clnum>0){
				chatService.updateAttendinfo(new AttendinfoVo(clnum, num, 1));
			}else{
				chatService.createChatRoom("�굹���쓽 梨꾪똿");
				clnum=chatService.getRoomforName("�굹���쓽 梨꾪똿");
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
				System.out.println("�궡�젙蹂� �닔�젙! alreadyHave:"+alreadyHave+",num:"+num);
				chatService.updateAttendinfo(new AttendinfoVo(alreadyHave, fnum, 1));
				System.out.println("移쒓뎄�젙蹂� �닔�젙! alreadyHave:"+alreadyHave+",num:"+fnum);
				Fclnum=alreadyHave;
			}
		}else{
			int clnum=0;
			for(int i=0;i<fvalue.length;++i){
				int fnum=Integer.parseInt(fvalue[i]);
				ProfilesVo pvo=profilesService.info(fnum);
				if(i==0){
					String strChatName=pvo.getName()+"�쇅 "+((fvalue.length)-1)+"紐�";
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
		
		// �깮�꽦�븳 諛⑹쑝濡� 諛붾줈 �꽭�똿�븯湲� �쐞�븳 �젙蹂� �쟾�떖
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
		model.addAttribute("ChatList",clist); // 紐⑤뱺 梨꾪똿由ъ뒪�듃 (�씠由꾩쓣 媛��졇�삤湲� �쐞�븿)
		
		Map<Integer, String> clnameMap=new HashMap<>(); // �씠由꾩쓣 �떞湲곗쐞�븳 留�
		for(int i=0;i<clist.size();++i){
			String clname=chatService.getLastChat(clist.get(i).getClnum());
			clnameMap.put(clist.get(i).getClnum(), clname); // key:clnum,value:clname
		}
		model.addAttribute("clnameMap", clnameMap);
		
		List<AttendinfoVo> ailist=chatService.getAttendInfo(num); // �쁽�옱 �룷�븿�릺�뼱�엳�뒗 諛� �쟾泥대ぉ濡�
		model.addAttribute("AcList",ailist);
		
		model.addAttribute("clnum",clnum); // �쁽�옱 �뱾�뼱���엳�뒗 諛�
		
		if(clnum>0){
			ChatlistVo cvo=chatService.checkRoom(clnum); // �쁽�옱 �뱾�뼱���엳�뒗 諛� �젙蹂�
			model.addAttribute("clvo",cvo);
		}
		session.setAttribute("clnum", clnum);
		
		List<ChatVo> cvolist=chatService.getChat(clnum); // �빐�떦 諛⑹쓽 梨꾪똿 紐⑸줉
		model.addAttribute("chat",cvolist);
		
		Map<Integer, Integer> readinfomap=new HashMap<>(); // �씫�� �궗�엺 �젙蹂대�� �떞湲곗쐞�븳 留�
		for(int i=0;i<cvolist.size();++i){
			ReadinfoVo readvo=new ReadinfoVo(cvolist.get(i).getCnum(), clnum, num);
			// 梨꾪똿�쓣 �븳媛쒖뵫 �룎硫댁꽌 �쐞�쓽 �젙蹂닿� �뱾�뼱�엳�뒗吏� �솗�씤(clnum, num)
			int is=chatService.getReadInfo(readvo); // clnum,num �씠 �룞�씪�븳 �젙蹂닿� �엳�뒗吏� �솗�씤
			if(is==0){
				chatService.addReadInfo(readvo); // �뾾�쑝硫� 異붽�
			}
			int readcount=chatService.getCountReadInfo(cvolist.get(i).getCnum()); // �씫�� �궗�엺 �닔
			int usercount=chatService.getAttendCount(clnum); // �쁽�옱 諛� �씤�썝�닔
			int rc=usercount-readcount;
			readinfomap.put(cvolist.get(i).getCnum(), rc); // key:cnum,value:count
		}
		model.addAttribute("readinfomap",readinfomap);
		
		List<ChatVo> cvotimelist=chatService.getChattime(clnum); // 梨꾪똿 �엯�젰�떆媛� �젙蹂�
		model.addAttribute("chattime",cvotimelist);
		
		String friname="";
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname); // 議고쉶�븷 �씠由�
		map.put("num", num);
		List<HashMap<String, Object>> fvolist=friendsService.list(map); // �빐�떦 �쉶�썝�쓽 移쒓뎄紐⑸줉
		
		List<ProfilesVo> pvolist=new ArrayList<ProfilesVo>();
		for(HashMap<String,Object> aa:fvolist){
			int fnum=((BigDecimal)aa.get("FNUM")).intValue();
			ProfilesVo fvo=profilesService.info(fnum); // 移쒓뎄 紐⑸줉�쓣 �룎硫댁꽌 �젙蹂대�� 由ъ뒪�듃�뿉 �떞湲� 
			pvolist.add(fvo);
		}
		model.addAttribute("pvolist",pvolist);
		
		List<AttendinfoVo> savolist=chatService.sameAttendInfo(clnum); // 媛숈�諛⑹뿉 議댁옱�븯�뒗 �궗�엺 �젙蹂�
		Map<Integer, String> attname=new HashMap<>();
		for(int i=0;i<savolist.size();++i){
			ProfilesVo p=profilesService.info(savolist.get(i).getNum());
			attname.put(p.getNum(), p.getName()); // key:�빐�떦�궗�엺�쓽 踰덊샇, value:�씠由�
		}
		model.addAttribute("attname",attname); // 梨꾪똿 �쐞�뿉 �씠由꾩쓣 �쓣�슦湲� �쐞�븿
		
		Map<Integer, Integer> chatCountMap= new HashMap<>();
		for(int i=0;i<ailist.size();++i){ // �쁽�옱 �룷�븿�릺�뼱�엳�뒗 諛⑸뱾�쓣 �룎硫댁꽌
			int aclnum=ailist.get(i).getClnum(); // 諛⑸뱾�쓽 踰덊샇 �뼸湲� 
			int readChatCount=chatService.getChatReadCount(new ReadinfoVo(0, aclnum, num));
			// �빐�떦 諛⑹뿉�꽌 �궡媛� �씫�� 湲��쓽 媛��닔 �뼸湲�
			int chatCount=chatService.getChatCount(aclnum); // �빐�떦 諛⑹쓽 珥� 梨꾪똿 媛��닔 �뼸湲�
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
	@RequestMapping(value="updateRoomName")
	public String updateRoomName(int clnum,String name){
		ChatlistVo clvo=new ChatlistVo(clnum, name);
		chatService.updateChatName(clvo);
		return "ChatList";
	}
}
