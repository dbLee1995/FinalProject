package fproject.app.fproject.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
    	List<ProfilesVo> plist=pservice.selectQnaName();
    	ModelAndView mv=new ModelAndView("qna/qna");
    	mv.addObject("plist",plist);
    	mv.addObject("list",list);
    	return mv;
    }
    @RequestMapping(value="qna/insert",method=RequestMethod.GET)
    public ModelAndView setInsertForm(int num, HttpSession session){
    	ProfilesVo pvo=pservice.info(num);
    	ModelAndView mv=new ModelAndView("qna/qnaForm"); 	
    	mv.addObject("name",pvo.getName());
    	return mv;
    }
    @RequestMapping(value="qna/insert",method=RequestMethod.POST)
    public String setInsert(QnaVo vo,int num){
    	int n=qservice.insert(vo);
    	if(n>0){
    		return "redirect:/qna/list";
    	}else{
    		return "test/error";
    	}   	
    }
    @RequestMapping(value="qna/info",method=RequestMethod.GET)
    public ModelAndView info(int qnanum){
    	QnaVo qvo=qservice.selectInfo(qnanum);
    	ProfilesVo pvo=pservice.selectProfName(qnanum);
    	ModelAndView mv=new ModelAndView("qna/qnaInfoForm");
    	mv.addObject("qvo",qvo);
    	mv.addObject("name",pvo.getName());
    	return mv;
    }
    @RequestMapping(value="qna/update",method=RequestMethod.POST)
    public String update(QnaVo vo){
    	int n=qservice.update(vo);
    	if(n>0){
    		return "redirect:/qna/list";
    	}else{
    		return "test/error";
    	}
    	
    }
}