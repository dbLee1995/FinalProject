package fproject.app.fproject.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;

@Controller
public class ProfilesController {
	@Autowired private ProfilesService pservice;
	public void setPservice(ProfilesService pservice){
		this.pservice=pservice;
	}
	@Autowired private AccountService aservice;
	public void setAservice(AccountService aservice){
		this.aservice=aservice;
	}
	@RequestMapping(value="profiles/info",method=RequestMethod.GET)
	public ModelAndView info(int num){
		ProfilesVo pvo=pservice.info(num);
		AccountVo avo=aservice.info(num);
		ModelAndView mv=new ModelAndView("profiles/profiles");
		mv.addObject("pvo",pvo);
		mv.addObject("id",avo.getId());
		return mv;
	}
}
