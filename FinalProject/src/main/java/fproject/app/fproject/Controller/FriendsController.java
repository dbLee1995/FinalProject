package fproject.app.fproject.Controller;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.vo.CalenderVo;
import fproject.app.fproject.vo.FriendlistVo;

@Controller
public class FriendsController {
	@Autowired private FriendsService service;
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
}
