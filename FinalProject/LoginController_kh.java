package fproject.app.fproject.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import fproject.app.fproject.Util.RandomString;
import fproject.app.fproject.Util.SendEmail;
import fproject.app.fproject.service.EmoShopService;
import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.service.UsersService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.EmoshopVo;
import fproject.app.fproject.vo.ProfilesVo;

@Controller
public class LoginController_kh {
	@Autowired
	private UsersService service;
	@Autowired
	private EmoShopService emoShopService;
	@Autowired
	private MemberService service2;


	@RequestMapping(value = "member/login", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="false") String auth, Model model) {
		model.addAttribute("auth", auth);
		return "member/login";
	}

	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session) {
		AccountVo vo = new AccountVo(0, id, pwd);

		AccountVo vo1 = service.isMember(vo);
		if (vo1 != null) {
			session.setAttribute("id", id);
			session.setAttribute("num", vo1.getNum());
			
			// 장바구니 생성합니다.
			List<EmoshopVo> basketList = new ArrayList<EmoshopVo>();
			session.setAttribute("basketList", basketList);
			for(int i=63; i<=77; i++) {
				basketList.add(emoShopService.getEmogInfo(i));
			}
			session.setAttribute("basketList", basketList);
			
			return "redirect:/";

		} else {
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

	@RequestMapping(value = "member/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md)
			throws Exception {
		md.addAttribute("id", service.find_id(response, email));
		return "/member/find_idOK";
	}


	@RequestMapping(value = "member/find_pw", method = RequestMethod.GET)
	public String find_pw() throws Exception {
		return "/member/find_pw";
	}


	//응답결과를 XML로 응답하기
		@RequestMapping(value = "/member/find_pwd", method = RequestMethod.GET)	
		@ResponseBody		//메소드에서 리턴된 값이 응답결과가 됨
		public String find_pwd(String id, String email) {
			System.out.println("id:" + id +"email:" + email);
			//회원id로 db에서 검색
			AccountVo vo = service2.getUserAccountInfo(id);		
			StringBuffer sb=new StringBuffer();
			sb.append("<?xml version='1.0' encoding='utf-8'?>");	
			
			// 입력한 id가 존재하면 회원번호, 아이디, 이메일을 받아와  임시비밀번호 발송
			if (vo != null) {
				int num = vo.getNum();
				ProfilesVo vo2 = service.check_id(num, id, email);
				if (vo2 != null) {
					String certification = new RandomString().create(15);
					new SendEmail().send(email, certification, 1);
					service.update_pwdOK(certification, id);
					System.out.println("jkjkjk");
					sb.append("<find>true</find>");
				} else {
					sb.append("<find>false</find>");
				}
			 }else{
					sb.append("<find>false</find>");
			 }
			System.out.println(sb.toString());
			return sb.toString();
		}
	}


