package fproject.app.fproject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.service.QnaService;
import fproject.app.fproject.vo.ProfilesVo;
import fproject.app.fproject.vo.QnaVo;


@Controller
public class QnaController {
	@Autowired private QnaService qservice;
    public void setService(QnaService qservice){
        this.qservice=qservice;
    }
    @Autowired private ProfilesService pservice;
    public void setService(ProfilesService pservice){
        this.pservice=pservice;
    }
    @RequestMapping(value="qna/list",method=RequestMethod.GET)
    public ModelAndView list(){
    	List<QnaVo> list=qservice.select();
    	List<ProfilesVo> pvo=pservice.select();
    	ModelAndView mv=new ModelAndView("qna/qna");
    	mv.addObject("list",list);
    	mv.addObject("pvo",pvo);
    	return mv;
    }
    @RequestMapping(value="qna/insert",method=RequestMethod.GET)
    public ModelAndView setInsertForm(int num){
    	QnaVo qvo=qservice.selectInfo(num);
    	ProfilesVo pvo=pservice.info(num);
    	ModelAndView mv=new ModelAndView("qna/qnaForm"); 	
    	mv.addObject("qvo",qvo);
    	mv.addObject("name",pvo.getName());
    	return mv;
    }
    @RequestMapping(value="qna/insert",method=RequestMethod.POST)
    public String setInsert(QnaVo vo,int num){
    	int n=qservice.insert(vo);
    	if(n>0){
    		return "redirect:/";
    	}else{
    		return "test/error";
    	}   	
    }
  
}