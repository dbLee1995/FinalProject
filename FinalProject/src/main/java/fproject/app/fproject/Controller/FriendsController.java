package fproject.app.fproject.Controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.support.BindingAwareModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.CalenderVo;
import fproject.app.fproject.vo.FriendlistVo;


@Controller
public class FriendsController {
	@Autowired private FriendsService service;
	@Autowired private AccountService Aservice;
	int memnum;
	@RequestMapping("/friends/addfriends")
	public String addfriends(){
		return "friends/addfriends";
	}
	@RequestMapping("/showalarm")
	public ModelAndView alarm(String title){
		ModelAndView mv=new ModelAndView("showalarm");
		mv.addObject("title", title);	
		return mv;
	};
	@RequestMapping(value="/friends/list",method = RequestMethod.GET)
	public String list(Model model,int num,String friname){
		if(friname==null){
			friname="";
		}
	
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname);
		map.put("num", num);
		List<HashMap<String, Object>> list=service.list(map);
		model.addAttribute("list", list);
		return "friends/friendslist";
	}
	@RequestMapping(value="/friends/addfri",method = RequestMethod.GET)
	@ResponseBody
	public void addfri(int num,int fnum){
		FriendlistVo vo=new FriendlistVo(num, fnum, 0, 0, 2);
		service.addfri(vo);
	}
	@RequestMapping(value="/friends/searchlist",produces="application/json;charset=utf-8")
	@ResponseBody
	public String searchlist(int num,String friname){
		if(friname==null){
			friname="";
		}
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname",friname);
		map.put("num", num);
		List<HashMap<String, Object>> list=service.list(map);
		JSONArray arr=new JSONArray();
		for (HashMap<String, Object> fri:list){
			JSONObject json=new JSONObject();			
			json.put("fnum", fri.get("FNUM"));
			json.put("favo", fri.get("FAVO"));
			json.put("name", fri.get("NAME"));
			json.put("spam", fri.get("SPAM"));
			json.put("approv", fri.get("APPROV"));
			json.put("phone", fri.get("PHONE"));
			json.put("email", fri.get("EMAIL"));
			json.put("birth", fri.get("BIRTH"));
			json.put("profileimg", fri.get("PROFILEIMG"));
			json.put("backimg", fri.get("BACKIMG"));
			json.put("msg", fri.get("MSG"));
			
			arr.put(json);
		}
		return arr.toString();
	}
	@RequestMapping(value="/friends/friprofile",produces="application/json;charset=utf-8")
	@ResponseBody
	public String friprofile(int num,int fnum){
		
		HashMap<String, Object> map=new HashMap<>();
		map.put("fnum",fnum);
		map.put("num", num);
		List<HashMap<String, Object>> list=service.friprofile(map);
		JSONArray arr=new JSONArray();
		for (HashMap<String, Object> fri:list){
			JSONObject json=new JSONObject();			
			json.put("fnum", fri.get("FNUM"));
			json.put("favo", fri.get("FAVO"));
			json.put("name", fri.get("NAME"));
			json.put("spam", fri.get("SPAM"));
			json.put("approv", fri.get("APPROV"));
			json.put("phone", fri.get("PHONE"));
			json.put("email", fri.get("EMAIL"));
			json.put("birth", fri.get("BIRTH"));
			json.put("profileimg", fri.get("PROFILEIMG"));
			json.put("backimg", fri.get("BACKIMG"));
			json.put("msg", fri.get("MSG"));

			arr.put(json);
		}
		return arr.toString();
	}
	@RequestMapping(value="/friends/favo",produces="application/json;charset=utf-8")
	@ResponseBody
	public String favo(int num,int fnum){
		HashMap<String, Object> map=new HashMap<>();
		map.put("fnum",fnum);
		map.put("num", num);
		service.favo(map);
		List<HashMap<String, Object>> list=service.friprofile(map);
		JSONArray arr=new JSONArray();
		for (HashMap<String, Object> fri:list){
			JSONObject json=new JSONObject();			
			json.put("fnum", fri.get("FNUM"));
			json.put("favo", fri.get("FAVO"));
			json.put("name", fri.get("NAME"));
			json.put("spam", fri.get("SPAM"));
			json.put("approv", fri.get("APPROV"));
			json.put("phone", fri.get("PHONE"));
			json.put("email", fri.get("EMAIL"));
			json.put("birth", fri.get("BIRTH"));
			json.put("profileimg", fri.get("PROFILEIMG"));
			json.put("backimg", fri.get("BACKIMG"));
			json.put("msg", fri.get("MSG"));

			arr.put(json);
		}
		return arr.toString();
	}
	@RequestMapping(value="/friends/unfavo",produces="application/json;charset=utf-8")
	@ResponseBody
	public String unfavo(int num,int fnum){
		HashMap<String, Object> map=new HashMap<>();
		map.put("fnum",fnum);
		map.put("num", num);
		service.unfavo(map);
		List<HashMap<String, Object>> list=service.friprofile(map);
		JSONArray arr=new JSONArray();
		for (HashMap<String, Object> fri:list){
			JSONObject json=new JSONObject();			
			json.put("fnum", fri.get("FNUM"));
			json.put("favo", fri.get("FAVO"));
			json.put("name", fri.get("NAME"));
			json.put("spam", fri.get("SPAM"));
			json.put("approv", fri.get("APPROV"));
			json.put("phone", fri.get("PHONE"));
			json.put("email", fri.get("EMAIL"));
			json.put("birth", fri.get("BIRTH"));
			json.put("profileimg", fri.get("PROFILEIMG"));
			json.put("backimg", fri.get("BACKIMG"));
			json.put("msg", fri.get("MSG"));

			arr.put(json);
		}
		return arr.toString();
	}
	@RequestMapping(value="/friends/searchId",produces="application/json;charset=utf-8")
	@ResponseBody
	public String searchId(String id,int num){
		HashMap<String, Object> map=new HashMap<>();
		map.put("id",id);
		map.put("num", num);
		List<HashMap<String, Object>> list=service.searchId(map);
		if(list.isEmpty()){			
			AccountVo vo=Aservice.ismemid(id);
			if(vo==null){
				JSONArray arr=new JSONArray();
				JSONObject json=new JSONObject();
				json.put("nomem", true);
				arr.put(json);
				return arr.toString();
			}else if(vo.getNum()==num){
				JSONArray arr=new JSONArray();
				List<HashMap<String, Object>> list1=service.mempro(vo.getNum());
				for (HashMap<String, Object> fri:list1){
					JSONObject json=new JSONObject();
					json.put("isme", true);
					json.put("num", fri.get("NUM"));
					json.put("favo", fri.get("FAVO"));
					json.put("name", fri.get("NAME"));
					json.put("spam", fri.get("SPAM"));
					json.put("approv", fri.get("APPROV"));
					json.put("phone", fri.get("PHONE"));
					json.put("email", fri.get("EMAIL"));
					json.put("birth", fri.get("BIRTH"));
					json.put("profileimg", fri.get("PROFILEIMG"));
					json.put("backimg", fri.get("BACKIMG"));
					json.put("msg", fri.get("MSG"));
					arr.put(json);		
			}
				return arr.toString();
			
			}else{
				JSONArray arr=new JSONArray();
				List<HashMap<String, Object>> list1=service.mempro(vo.getNum());
				for (HashMap<String, Object> fri:list1){
					JSONObject json=new JSONObject();
					json.put("ismem", true);
					json.put("num", fri.get("NUM"));
					json.put("favo", fri.get("FAVO"));
					json.put("name", fri.get("NAME"));
					json.put("spam", fri.get("SPAM"));
					json.put("approv", fri.get("APPROV"));
					json.put("phone", fri.get("PHONE"));
					json.put("email", fri.get("EMAIL"));
					json.put("birth", fri.get("BIRTH"));
					json.put("profileimg", fri.get("PROFILEIMG"));
					json.put("backimg", fri.get("BACKIMG"));
					json.put("msg", fri.get("MSG"));
					arr.put(json);		
			}
				return arr.toString();
			}
			
		}else{
			JSONArray arr=new JSONArray();
			for (HashMap<String, Object> fri:list){
				JSONObject json=new JSONObject();
				json.put("isfri", true);
				json.put("fnum", fri.get("FNUM"));
				json.put("favo", fri.get("FAVO"));
				json.put("name", fri.get("NAME"));
				json.put("spam", fri.get("SPAM"));
				json.put("approv", fri.get("APPROV"));
				json.put("phone", fri.get("PHONE"));
				json.put("email", fri.get("EMAIL"));
				json.put("birth", fri.get("BIRTH"));
				json.put("profileimg", fri.get("PROFILEIMG"));
				json.put("backimg", fri.get("BACKIMG"));
				json.put("msg", fri.get("MSG"));
				arr.put(json);
		}
			return arr.toString();
		}
		
	}
	@RequestMapping(value="/friends/searchPhone",produces="application/json;charset=utf-8")
	@ResponseBody
	public String searchPhone(String phone,int num){		
		
		List<HashMap<String, Object>> mem=Aservice.ismemphone(phone);
		
		if(mem.isEmpty()){
			JSONObject json=new JSONObject();
			json.put("nomem", true);
			return json.toString();
		}else{
			HashMap<String, Object> map=new HashMap<>();
			for (HashMap<String, Object> fri:mem){
				memnum=((BigDecimal)fri.get("NUM")).intValue();
				map.put("id",fri.get("ID"));
			}
			map.put("num", num);
			List<HashMap<String, Object>> list=service.searchId(map);	
			if(!(list.isEmpty())){
				JSONArray arr=new JSONArray();
				for (HashMap<String, Object> fri:list){
					JSONObject json=new JSONObject();
					json.put("isfri", true);
					json.put("fnum", fri.get("FNUM"));
					json.put("favo", fri.get("FAVO"));
					json.put("name", fri.get("NAME"));
					json.put("spam", fri.get("SPAM"));
					json.put("approv", fri.get("APPROV"));
					json.put("phone", fri.get("PHONE"));
					json.put("email", fri.get("EMAIL"));
					json.put("birth", fri.get("BIRTH"));
					json.put("profileimg", fri.get("PROFILEIMG"));
					json.put("backimg", fri.get("BACKIMG"));
					json.put("msg", fri.get("MSG"));
					arr.put(json);
			}
				return arr.toString();
			}else{
				if(memnum==num){
					JSONArray arr=new JSONArray();
					List<HashMap<String, Object>> list1=service.mempro(memnum);
					for (HashMap<String, Object> fri:list1){
						JSONObject json=new JSONObject();
						json.put("isme", true);
						json.put("num", fri.get("NUM"));
						json.put("favo", fri.get("FAVO"));
						json.put("name", fri.get("NAME"));
						json.put("spam", fri.get("SPAM"));
						json.put("approv", fri.get("APPROV"));
						json.put("phone", fri.get("PHONE"));
						json.put("email", fri.get("EMAIL"));
						json.put("birth", fri.get("BIRTH"));
						json.put("profileimg", fri.get("PROFILEIMG"));
						json.put("backimg", fri.get("BACKIMG"));
						json.put("msg", fri.get("MSG"));
						arr.put(json);		
				}
					return arr.toString();
				}else{
					JSONArray arr=new JSONArray();
					List<HashMap<String, Object>> list1=service.mempro(memnum);
					for (HashMap<String, Object> fri:list1){
						JSONObject json=new JSONObject();
						json.put("ismem", true);
						json.put("num", fri.get("NUM"));
						//json.put("favo", fri.get("FAVO"));
						json.put("name", fri.get("NAME"));
						//json.put("spam", fri.get("SPAM"));
						//json.put("approv", fri.get("APPROV"));
						json.put("phone", fri.get("PHONE"));
						json.put("email", fri.get("EMAIL"));
						json.put("birth", fri.get("BIRTH"));
						json.put("profileimg", fri.get("PROFILEIMG"));
						json.put("backimg", fri.get("BACKIMG"));
						json.put("msg", fri.get("MSG"));
						arr.put(json);		
				}
					return arr.toString();
				}
				
			}
		}	
	}
	@RequestMapping(value="/friends/favorfri",produces="application/json;charset=utf-8")
	@ResponseBody
	public String favorfri(int num){	
		List<HashMap<String, Object>> list=service.favorfri(num);
		JSONArray arr=new JSONArray();
		for (HashMap<String, Object> fri:list){
			
			JSONObject json=new JSONObject();			
			json.put("fnum", fri.get("FNUM"));
			json.put("favo", fri.get("FAVO"));
			json.put("name", fri.get("NAME"));
			json.put("spam", fri.get("SPAM"));
			json.put("approv", fri.get("APPROV"));
			json.put("phone", fri.get("PHONE"));
			json.put("email", fri.get("EMAIL"));
			json.put("birth", fri.get("BIRTH"));
			json.put("profileimg", fri.get("PROFILEIMG"));
			json.put("backimg", fri.get("BACKIMG"));
			json.put("msg", fri.get("MSG"));	
			arr.put(json);
		}
		return arr.toString();
	}
}
