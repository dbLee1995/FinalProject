package fproject.app.fproject.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
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
		AccountVo vo=aservice.info(num);
		ProfilesVo pvo=pservice.info(num);
		ModelAndView mv=new ModelAndView("story/list");		
		mv.addObject("list",list);
		mv.addObject("id",vo.getId());
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
		
		// ���۵� ���ϸ�
		System.out.println("���" + uploadPath);
		String orgimg=file1.getOriginalFilename();
		System.out.println("���۵������̸�" + orgimg);
		// ����� ���ϸ�(�ߺ����� �ʴ� �̸����� �����)
		String saveimg=UUID.randomUUID()+"_"+orgimg;
		// UUID(java�޼ҵ�) : �ߺ������ʴ� ���� ���;� �Ҷ� ���.
		try{
			// ���۵� ������ �о���� ���� ��Ʈ��
			InputStream fis=file1.getInputStream();
			// ���۵� ������ ������ ����ϱ� ���� ��Ʈ��
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+saveimg);
			// ���Ϻ����ϱ�(���ε��ϱ�)
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			
			AccountVo avo=aservice.info(num);
			ProfilesVo pvo=pservice.info(num);
			long imgsize=file1.getSize();
			StoryVo vo=new StoryVo(0,num,stitle,scontent,sregdate,orgimg,saveimg,imgsize);
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
			if(!file1.isEmpty()){ // ÷�ε������� �ִ� ���
          // 1. �������� ����
            String path=session.getServletContext()
                               .getRealPath("/resources/upload");
            StoryVo vo=service.info(storynum);
            String saveimg=vo.getSaveimg();
            File f=new File(path + "\\" + saveimg);
            if(!f.delete()){
               new Exception("���ϻ�������!");
            }
            // 2. ÷�ε� ���� ����
            String orgimg=file1.getOriginalFilename();
            saveimg = UUID.randomUUID() +"_" + orgimg;
            InputStream is=file1.getInputStream();
            FileOutputStream fos=
                    new FileOutputStream(path +"\\" + saveimg);
            FileCopyUtils.copy(is,fos);
            is.close();
            fos.close();
            //3. db����            
            long imgsize=file1.getSize();
            StoryVo vo1=new StoryVo(storynum,num,stitle,scontent,null,orgimg,saveimg,imgsize); 
            service.update(vo1);
                      
          }else {//÷�ε� ������ ���� ���
            //db�����ϱ�       	  
        	  StoryVo vo1=new StoryVo(storynum,num,stitle,scontent,null,null,null,0);      
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
	
	// ����������̵�
	@RequestMapping(value="story/comments",method=RequestMethod.GET)
	public ModelAndView commentsForm(int storynum,int num){
		StoryVo vo=service.info(storynum);
		List<CommentsVo> cvo=cservice.list();
		Map<Integer, String> usernameMap=new HashMap<Integer, String>();
		for(int i=0;i<cvo.size();++i){
			AccountVo aavo=aservice.info(cvo.get(i).getNum());
			usernameMap.put(aavo.getNum(), aavo.getId());
		}
		AccountVo avo=aservice.info(num);
		ProfilesVo pvo=pservice.info(num);
		List<CommentsVo> cvoa=cservice.getReplyA();
		ModelAndView mv=new ModelAndView("story/comments");
		mv.addObject("vo",vo);
		mv.addObject("id",avo.getId());
		mv.addObject("profileimg",pvo.getProfileimg());
		mv.addObject("storynum",storynum);
		mv.addObject("cvo",cvo);
		mv.addObject("cvoa",cvoa);
		mv.addObject("usernameMap",usernameMap);
		return mv;
		
		
	}
	// ����Է�
	@RequestMapping(value="story/commentsReply",method=RequestMethod.GET)
	public String commentsForm(CommentsVo vo,int num,int storynum){				
		return "redirect:/story/commentsReply?num=" + num + "&storynum=" + storynum;
	}
			
	// �θ���Է�
	@RequestMapping(value="story/comments",method=RequestMethod.POST)
	public String comments(CommentsVo vo,int storynum,int num,Model model,HttpServletRequest req){		
		int n=cservice.insert(vo); // db�� �߰�
		if(n>0){		
			StoryVo svo=service.info(storynum);
			ProfilesVo pvo=pservice.info(num);
			AccountVo avo=aservice.info(num);	
			model.addAttribute("profileimg",pvo.getProfileimg());
			return "redirect:/story/comments?num=" + num + "&storynum=" + storynum;
		}else{
			return "test/error";
		}
	}
		
	// ����Է�
	@RequestMapping(value="story/commentsReply",method=RequestMethod.POST)
	public String commentsReply(CommentsVo vo,int commnum,int num,int storynum,Model model){		
		CommentsVo cvo=cservice.infoCommNum(commnum);	
		CommentsVo rvo=new CommentsVo(0, storynum, num, vo.getCommcontent(), 
										cvo.getCommref(), cvo.getCommlev()+1, cvo.getCommstep(),null);		
		int n=cservice.insertReply(rvo);		// ����	
		return "redirect:/story/commentsReply?num=" + num + "&storynum=" + storynum;
	}
}