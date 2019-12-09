package fproject.app.fproject.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fproject.app.fproject.Util.RandomString;
import fproject.app.fproject.Util.SendEmail;
import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.service.UsersService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;

@Controller
public class LoginController_kh {
	@Autowired
	private UsersService service;

	public void setService(UsersService service) {
		this.service = service;
	}

	@Autowired
	private MemberService service2;

	public void setService(MemberService service2) {
		this.service2 = service2;
	}

	@RequestMapping(value = "member/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session) {
		AccountVo vo = new AccountVo(0, id, pwd);

		AccountVo vo1 = service.isMember(vo);
		if (vo1 != null) {
			session.setAttribute("id", id);
			return "redirect:/"; // "/"�� �������� ������ @RequestMapping ��θ� �������� Redirect �ȴ�.

		} else {
			return "member/login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 아이디 찾기 폼
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

	// 비밀번호 찾기 폼
	@RequestMapping(value = "member/find_pw", method = RequestMethod.GET)
	public String find_pw() throws Exception {
		return "/member/find_pw";
	}

	// 임시비밀번호 메일발송 및 비밀번호 변경
	@RequestMapping(value = "member/find_pwd", method = RequestMethod.POST)
	public String find_pwd(String id, String email) {
		AccountVo vo = service2.getUserAccountInfo(id);
		if (vo != null) {
			int num = vo.getNum();
			ProfilesVo vo2 = service.check_id(num, id, email);
			if (vo2.getEmail() != null) {
				String certification = new RandomString().create(15);
				new SendEmail().send(email, certification, 1);
				service.update_pwdOK(certification, id);
				return "test/success";
			} else {
				return "test/error";
			}
		}else {
			return "test/error";
		}
	}

}
