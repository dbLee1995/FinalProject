package fproject.app.fproject.Controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fproject.app.fproject.Util.RandomString;
import fproject.app.fproject.Util.SendEmail;
import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.EmoShopService;
import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.service.UsersService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.ProfilesVo;

@Controller
public class LoginController_kh {
	@Autowired
	private AccountService Aservice;
	@Autowired
	private UsersService service;
	@Autowired
	private EmoShopService emoShopService;
	@Autowired
	private MemberService service2;
	@Autowired
	private FriendsService Fservice;



	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session,Model model) {
		AccountVo vo = new AccountVo(0, id, pwd);
		AccountVo vo1 = Aservice.ismem(vo);
		if (vo1 != null) {
			session.setAttribute("id", id);
			session.setAttribute("num", vo1.getNum());
			
			// 장바구니 생성합니다.
			List<EmoshopVo> basketList = new ArrayList<EmoshopVo>();
			session.setAttribute("basketList", basketList);
		
			HashMap<String, Object> map=new HashMap<>();
			map.put("friname","");
			map.put("num", vo1.getNum());
			List<HashMap<String, Object>> list=Fservice.list(map);
			model.addAttribute("list", list);
			return "friends/friendslist";
		} else {
			model.addAttribute("login", true);
			return "member/login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}


	@RequestMapping(value = "member/find_id", method = RequestMethod.GET)
	public String find_id() throws Exception {
		return "/member/find_id";
	}


	@RequestMapping(value="/member/find_id",produces="application/json;charset=utf-8")
	@ResponseBody
	public String find_id(String email){
		JSONArray arr=new JSONArray();			
		List<HashMap<String, Object>> list=Aservice.getid(email);
		if(list.isEmpty()){
			JSONObject json=new JSONObject();
			json.put("mem", false);
			arr.put(json);
		}else{
			for (HashMap<String, Object> id:list){
				JSONObject json=new JSONObject();
				json.put("mem", true);
				json.put("id", id.get("ID"));
				arr.put(json);
			}
		}
		return arr.toString();
	}


	@RequestMapping(value = "member/find_pw", method = RequestMethod.GET)
	public String find_pw() throws Exception {
		return "/member/find_pw";
	}

	@RequestMapping(value="/member/find_pw",produces="application/json;charset=utf-8")
	@ResponseBody
	public String find_pwd(String id,String email){
		HashMap<String , Object> map=new HashMap<>();
		map.put("id", id);
		map.put("email", email);
	
		List<HashMap<String, Object>> list=Aservice.getinfo(map);		
		JSONArray arr=new JSONArray();			
		if (!(list.isEmpty())) {
			String certification = new RandomString().create(15);
			System.out.println(certification);
			new SendEmail().send(email, certification, 1);
			service.update_pwdOK(certification, id);
			JSONObject json=new JSONObject();
			json.put("mem", true);
			json.put("email", email);
			arr.put(json);
		}else{
			JSONObject json=new JSONObject();
			json.put("mem", false);
			arr.put(json);
		}
		return arr.toString();
	}	
}	
	


