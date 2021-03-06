package fproject.app.fproject.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.CommentsService;
import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.service.StoryService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.CommentsVo;
import fproject.app.fproject.vo.ProfilesVo;
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
    @Autowired private ProfilesService pservice;
    public void setPservice(ProfilesService pservice){
    	this.pservice=pservice;
    }
    
	@RequestMapping(value="/story/list",method=RequestMethod.GET)
	public ModelAndView list(int num){
		List<StoryVo> list=service.list(num);
		ProfilesVo pvo=pservice.info(num);
		
		for(StoryVo svo:list){
			int storyn=svo.getStorynum();
		
			int storycnt=cservice.count(storyn);
		
			svo.setFavor(storycnt);
		
		}
		ModelAndView mv=new ModelAndView("story/list");	
		
		mv.addObject("list",list);
		mv.addObject("name",pvo.getName());
		mv.addObject("profileimg",pvo.getProfileimg());
		mv.addObject("num",pvo.getNum());		
		return mv;		
	}
	
	@RequestMapping(value="/story/insert",method=RequestMethod.GET)
	public String insertForm(int num,Model model){
		AccountVo avo=aservice.info(num);
		model.addAttribute("id",avo.getId());
		System.out.println("num:"+num);
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
			
			AccountVo avo=aservice.info(num);
			ProfilesVo pvo=pservice.info(num);
			long imgsize=file1.getSize();
			StoryVo vo=new StoryVo(0,num,stitle,scontent,sregdate,orgimg,saveimg,imgsize,0,0);
			service.insert(vo);	
			
			return "redirect:/story/list?num=" + num + "&id=" + avo.getId() + "&profileimg=" + pvo.getProfileimg();
		}catch(IOException ie){
			ie.printStackTrace();
			return "test/error";
		}	
	}
	
	@RequestMapping(value="story/update",method=RequestMethod.GET)
	public String updateForm(int storynum,int num,Model model){		
		StoryVo vo=service.info(storynum);
		AccountVo avo=aservice.info(num);
		model.addAttribute("vo",vo);
		model.addAttribute("id",avo.getId());
		return "story/update";
	}
	@RequestMapping(value="story/update",method=RequestMethod.POST)
	public String update(String id,int num,int storynum,String stitle,String scontent,
			MultipartFile file1,HttpSession session,Model model){
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
            StoryVo vo1=new StoryVo(storynum,num,stitle,scontent,null,orgimg,saveimg,imgsize,0,0); 
            service.update(vo1);
                      
          }else {//첨부된 파일이 없는 경우
            //db수정하기       	  
        	  StoryVo vo1=new StoryVo(storynum,num,stitle,scontent,null,null,null,0,0,0);      
        	  service.update(vo1);        	  
          }        
			String profileimg=pservice.info(num).getProfileimg();
            return "redirect:/story/list?num="+num + "&profileimg" + profileimg;
          }catch(Exception e){
            e.printStackTrace();
            return "test/error";
          }
	}
	
	@RequestMapping(value="story/delete",method=RequestMethod.GET)
	public String delete(int storynum,int num){
		StoryVo vo=service.info(num);
		int n=service.delete(storynum);	
		if(n>0){
			ProfilesVo pvo=pservice.info(num);
			return "redirect:/story/list?num=" + num +  "&profileimg=" + pvo.getProfileimg();
		}else{
			return "test/error";
		}
	}
	
	// 댓글페이지이동
	@RequestMapping(value="story/comments",method=RequestMethod.GET)
	public ModelAndView commentsForm(int storynum,int num){
		StoryVo vo=service.info(storynum); // 스토리번호
		service.upcount(storynum);
		List<CommentsVo> cvo=cservice.list(); // 댓글리스트
		List<ProfilesVo> pvoName=pservice.selectName(); // 프로필리스트
		Map<Integer, String> usernameMap=new HashMap<Integer, String>();
		Map<Integer, String> usernameMapReal=new HashMap<Integer, String>();
		for(int i=0;i<cvo.size();i++){
			ProfilesVo ppvo=pservice.info(cvo.get(i).getNum());
			usernameMap.put(ppvo.getNum(), ppvo.getProfileimg());
			usernameMapReal.put(ppvo.getNum(), ppvo.getName());
		}
		ProfilesVo pvo=pservice.info(vo.getNum()); // 프로필select번호
		List<CommentsVo> cvoa=cservice.getReplyA(); // 댓글 자식댓글 리스트
		ModelAndView mv=new ModelAndView("story/comments");
		mv.addObject("vo",vo);
		mv.addObject("storynum",storynum);
		mv.addObject("cvo",cvo);
		mv.addObject("cvoa",cvoa);
		mv.addObject("pname",pvoName);
		mv.addObject("name",pvo.getName());
		mv.addObject("profileimg",pvo.getProfileimg());
		mv.addObject("usernameMap",usernameMap);
		mv.addObject("usernameMapReal",usernameMapReal);
		return mv;	
	}
		
	// 답글입력
	@RequestMapping(value="story/commentsReply",method=RequestMethod.GET)
	public String commentsForm(CommentsVo vo,int num,int storynum){		
		return "redirect:/story/commentsReply?num=" + num + "&storynum=" + storynum;
	}
			
	// 부모글입력
	@RequestMapping(value="story/comments",method=RequestMethod.POST)
	public String comments(CommentsVo vo,int storynum,int num,Model model,HttpServletRequest req){		
		int n=cservice.insert(vo); // db에 추가
		if(n>0){		
			StoryVo svo=service.info(storynum);
			ProfilesVo pvo=pservice.info(num);
			return "redirect:/story/comments?num=" + num + "&storynum=" + storynum;
		}else{
			return "test/error";
		}
	}
		
	// 답글입력
	@RequestMapping(value="story/commentsReply",method=RequestMethod.POST)
	public String commentsReply(int commnum, String commcontent, int num,int storynum,Model model){		
		CommentsVo cvo=cservice.infoCommNum(commnum);	
		CommentsVo rvo=new CommentsVo(0, storynum, num, commcontent, 
										cvo.getCommref(), cvo.getCommlev()+1, cvo.getCommstep(),null);		
		int n=cservice.insertReply(rvo);		// 새글	
		return "redirect:/story/comments?num=" + num + "&storynum=" + storynum;
	}
}