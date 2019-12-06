package fproject.app.fproject.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.dao.AccountDao;
import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.CommentsService;
import fproject.app.fproject.service.StoryService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.CommentsVo;
import fproject.app.fproject.vo.StoryVo;

@Controller
public class StoryController {
	@Autowired private StoryService service;
        public void setService(StoryService service){
                this.service=service;
        }
    @Autowired private CommentsService cservice;
       	public void setCservice(CommentsService cservice){
                this.cservice=cservice;
        }
    @Autowired private AccountService aservice;
       	public void setAservice(AccountService aservice){
                this.aservice=aservice;
        }
	@RequestMapping(value="/story/list",method=RequestMethod.GET)
	public ModelAndView list(String id,int num){
		List<StoryVo> list=service.list(num);
		AccountVo vo=aservice.info(num);
		ModelAndView mv=new ModelAndView("story/list");		
		mv.addObject("list",list);
		mv.addObject("id",vo.getId());
		return mv;
		
	}
	
	@RequestMapping(value="/story/insert",method=RequestMethod.GET)
	public String insertForm(){		
		return "story/insert";
	}
	@RequestMapping(value="/story/insert",method=RequestMethod.POST)
	public String insert(int num,String stitle,String scontent,Date sregdate,
			MultipartFile file1,HttpSession session){
		String uploadPath=session.getServletContext().getRealPath("/resources/upload");
		// 전송된 파일명
		System.out.println("경로" + uploadPath);
		String orgimg=file1.getOriginalFilename();
		System.out.println("전송된파일이름" + orgimg);
		// 저장될 파일명(중복되지 않는 이름으로 만들기)
		String saveimg=UUID.randomUUID()+"_"+orgimg;
		// UUID(java메소드) : 중복되지않는 값을 얻어와야 할때 사용.
		try{
			// 전송될 파일을 읽어오기 위한 스트림
			InputStream fis=file1.getInputStream();
			// 전송된 파일을 서버에 출력하기 위한 스트림
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+saveimg);
			// 파일복사하기(업로드하기)
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();

			long imgsize=file1.getSize();
			StoryVo vo=new StoryVo(0,num,stitle,scontent,sregdate,orgimg,saveimg,imgsize);
			service.insert(vo);
			return "redirect:/story/list";
		}catch(IOException ie){
			ie.printStackTrace();
			return "test/error";
		}	
	}
	
	@RequestMapping(value="story/update",method=RequestMethod.GET)
	public String updateForm(int storynum,Model model){
		StoryVo vo=service.info(storynum);
		model.addAttribute("vo",vo);
		return "story/update";
	}
	@RequestMapping(value="story/update",method=RequestMethod.POST)
	public String update(int storynum,int num,String stitle,String scontent,Date sregdate,
			MultipartFile file1,HttpSession session){

		try{
          if(!file1.isEmpty()){ // 첨부된파일이 있는 경우
          // 1. 기존파일 삭제
            String path=session.getServletContext()
                               .getRealPath("/resources/upload");
            StoryVo vo=service.info(storynum);
            String saveimg=vo.getSaveimg();
            File f=new File(path + "\\" + saveimg);
            if(!f.delete()){
               new Exception("파일삭제실패!");
            }
            // 2. 첨부된 파일 저장
            String orgimg=file1.getOriginalFilename();
            saveimg = UUID.randomUUID() +"_" + orgimg;
            InputStream is=file1.getInputStream();
            FileOutputStream fos=
                    new FileOutputStream(path +"\\" + saveimg);
            FileCopyUtils.copy(is,fos);
            is.close();
            fos.close();
            //3. db수정
            long imgsize=file1.getSize();
            StoryVo vo1=new StoryVo(storynum,num,stitle,scontent,sregdate,orgimg,saveimg,imgsize);
            service.update(vo1);                
          }else {//첨부된 파일이 없는 경우
            //db수정하기
        	  StoryVo vo1=new StoryVo(storynum,num, stitle,scontent,null,null,null,0);
        	  service.update(vo1);
          }
            return "redirect:/story/list";
          }catch(Exception e){
            e.printStackTrace();
            return "test/error";
          }
	}
	
	@RequestMapping(value="story/delete",method=RequestMethod.GET)
	public String delete(int storynum){
		service.delete(storynum);
		return "redirect:/story/list";
	}
	
	@RequestMapping(value="story/comments",method=RequestMethod.GET)
	public ModelAndView commentsForm(int storynum,int num){
		StoryVo vo=service.info(storynum);
		AccountVo avo=aservice.info(num);
		ModelAndView mv=new ModelAndView("story/comments");		
		mv.addObject("vo",vo);
		mv.addObject("id",avo.getId());
		return mv;
	}
	@RequestMapping(value="story/comments",method=RequestMethod.POST)
	@ResponseBody
	public String comments(CommentsVo vo){
		int n=cservice.insert(vo);
		
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<result>");
		if(n>0){
			sb.append("redirect:/story/comments");
		}else{			
			sb.append("redirect:/story/comments");
		}
		return sb.toString();
		
	}
}