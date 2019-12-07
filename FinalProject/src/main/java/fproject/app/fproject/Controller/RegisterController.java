package fproject.app.fproject.Controller;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fproject.app.fproject.service.MemberService;
import fproject.app.fproject.vo.AccountVo;
import util.RandomString;
import util.SendEmail;

@Controller
public class RegisterController {
	@Autowired
	private MemberService service;
	public void setService(MemberService service) {
		this.service = service;
	}
	private String certification;
	
	@RequestMapping(value="/member/register", method=RequestMethod.GET)
	public String pageLoad(Model model) {
		model.addAttribute("infoCheck", false);
		return "member/register";
	}

	// 모든 검사 통과 후 DB 저장
	// 트랜잭션 미처리
	@RequestMapping(value="/member/registering", method=RequestMethod.POST)
	public String insert(String email, String id, String pwd, String checkString, Model model) {
		if(this.certification.equals(checkString)) {
			AccountVo vo = new AccountVo(0, id, pwd);
			model.addAttribute("feature", "회원가입 기능");
			try {
				service.insert(vo);
				return "test/success";
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("회원가입 DB 저장 중 오류발생");
				return "test/error";
			}
		} else {
			model.addAttribute("infoCheck", true);
			model.addAttribute("email", email);
			model.addAttribute("id", id);
			model.addAttribute("pwd", pwd);
			model.addAttribute("certificationWrongMsg", "인증문자가 불일치합니다. 다시 입력해주세요.");
			return "member/register";
		}
	}
	
	
	// 전단에서 ajax로 아이디 유효성 검사를 위한 컨트롤러
	@RequestMapping(value="/member/registering/dbCheck")
	@ResponseBody
	public String dbCheck(Model model, HttpServletRequest req, String id) {
		boolean result = false;
		System.out.println(id);
		AccountVo vo = service.selectOneId(id);
		JSONObject json = new JSONObject();
		if(vo == null) {
			result = true;
		}
		json.put("result", result);
		return json.toString();
	}
	
	// 유효성 검사 후 이메일 발송을 하는 컨트롤러
	@RequestMapping(value="/member/registering/certification", method=RequestMethod.POST)
	public String certification(Model model, HttpServletRequest req, String email, String id, String pwd) {
		this.certification = new RandomString().create(15);
		new SendEmail().send(email, this.certification); // util 패키지
		
		model.addAttribute("infoCheck", true);
		model.addAttribute("certificationPage", "/member/certification.jsp");
		model.addAttribute("email", email);
		model.addAttribute("id", id);
		model.addAttribute("pwd", pwd);
		return "member/register";
	}
	
	@RequestMapping(value="/member/registering/certification/add", method=RequestMethod.GET)
	public String addCertification(Model model, HttpServletRequest req, String email, String id, String pwd) {
		model.addAttribute("infoCheck", true);
		model.addAttribute("certificationPage", "/member/certification.jsp");
		model.addAttribute("email", email);
		model.addAttribute("id", id);
		model.addAttribute("pwd", pwd);
		return "member/certification";
	}
}
