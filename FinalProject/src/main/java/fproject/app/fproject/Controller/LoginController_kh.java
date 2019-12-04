package fproject.app.fproject.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fproject.app.fproject.service.UsersService;
import fproject.app.fproject.vo.AccountVo;

@Controller
public class LoginController_kh {
	@Autowired private UsersService service;
	public void setService(UsersService service) {
		this.service = service;
	}
	@RequestMapping(value="member/login",method=RequestMethod.GET)
	public String loginForm(){
		return "member/login";
	}
	@RequestMapping(value="member/login",method=RequestMethod.POST)
	public String login(String id,String pwd,HttpSession session){
		AccountVo vo=new AccountVo(0, id, pwd);
		
		AccountVo vo1=service.isMember(vo);
		if(vo1!=null){
			session.setAttribute("id",id);
			return "redirect:/";	// "/"�� �������� ������ @RequestMapping ��θ� �������� Redirect �ȴ�.

		}else{
			return "member/login";
		}
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}	
}


