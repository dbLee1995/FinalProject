package fproject.app.fproject.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.NquireService;
import fproject.app.fproject.vo.QnaVo;


@Controller
public class NquireController {
	@Autowired private NquireService nservice;
    public void setService(NquireService nservice){
        this.nservice=nservice;
    }
    @RequestMapping(value="nquire/list",method=RequestMethod.GET)
    public ModelAndView list(){
    	List<QnaVo> list=nservice.select();
    	ModelAndView mv=new ModelAndView("nquire/nquire");
    	mv.addObject("list",list);
    	return mv;
    }
    @RequestMapping(value="nquire/insert",method=RequestMethod.GET)
    public ModelAndView setInsertForm(int num){
    	QnaVo qvo=nservice.selectInfo(num);
    	ModelAndView mv=new ModelAndView("nquire/nquireForm"); 	
    	mv.addObject("qvo",qvo);
    	return mv;
    }
    @RequestMapping(value="nquire/insert",method=RequestMethod.POST)
    public String setInsert(QnaVo vo,int num){
    	int n=nservice.insert(vo);
    	if(n>0){
    		return "redirect:/";
    	}else{
    		return "test/error";
    	}   	
    }
    
    
}