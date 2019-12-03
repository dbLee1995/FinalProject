package fproject.app.fproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.vo.AccountVo;

@Controller
public class RegisterController {
	@Autowired
	private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/member/register", method=RequestMethod.GET)
	public String pageLoad() {
		return "member/register";
	}

	@RequestMapping(value="/member/registering", method=RequestMethod.POST)
	public String insert(String email, String id, String pwd, Model model) {
		AccountVo vo = new AccountVo(0, id, pwd);
		model.addAttribute("feature", "회원가입");
		try {
			service.insert(vo);
			return "test/success";
		} catch(Exception e) {
			e.printStackTrace();
			return "test/error";
		}
	}
}
