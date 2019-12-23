package fproject.app.fproject.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
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

import fproject.app.fproject.service.AccountService;
import fproject.app.fproject.service.ProfilesService;
import fproject.app.fproject.service.StoryService;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;
import fproject.app.fproject.vo.StoryVo;

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
	@Autowired private StoryService sservice;
	public void setSservice(StoryService sservice){
		this.sservice=sservice;
	}

	@RequestMapping(value="profiles/info",method=RequestMethod.GET)
	public ModelAndView info(int num){
		ProfilesVo pvo=pservice.info(num);
		ModelAndView mv=new ModelAndView("profiles/profiles");
		mv.addObject("pvo",pvo);
		return mv;
	}
	@RequestMapping(value="profiles/update",method=RequestMethod.POST)
	@ResponseBody
	public String update(ProfilesVo vo,int num){
		int n=pservice.update(vo);
		if(n>0){
			return "redirect:/profiles/profiles?num=" + num;
		}else{
			return "test/error";
		}		
	}	
	
	@RequestMapping(value="profiles/updateName",method=RequestMethod.POST)
	@ResponseBody
	public String updateName(ProfilesVo vo,int num){
		int n=pservice.updateName(vo);
		if(n>0){
			return "redirect:/profiles/profiles?num=" + num;
		}else{
			return "test/error";
		}		
	}	
	
	@RequestMapping(value="profile/updateBackImg",method=RequestMethod.POST,produces="text/plain")
	@ResponseBody
	public String setBackImg(int num,MultipartFile file1,HttpSession session,Model model){
		try{			
			if(!file1.isEmpty()){ // 첨부된파일이 있는 경우
          // 1. 기존파일 삭제
            String path=session.getServletContext()
                               .getRealPath("/resources/upload");
            System.out.println("경로::::"+path+",,,,,,,file1:"+file1);
            ProfilesVo pvo1=pservice.info(num);
            String backimg2=pvo1.getBackimg();
            File f=new File(path + "\\" + backimg2);
            if(!f.delete()){
               new Exception("파일삭제실패!");
            }
            // 2. 첨부된 파일 저장
            backimg2=file1.getOriginalFilename();
            String backimg = UUID.randomUUID() +"_" + backimg2;
            InputStream is=file1.getInputStream();
            FileOutputStream fos=
                    new FileOutputStream(path +"\\" + backimg);
            FileCopyUtils.copy(is,fos);
            is.close();
            fos.close();
            //3. db수정            
            ProfilesVo pvo=new ProfilesVo(num,null,null,null,null,null,backimg,null);
            pservice.updateBackimg(pvo);
                      
          }else {//첨부된 파일이 없는 경우
            //db수정하기       	  
        	  ProfilesVo pvo=new ProfilesVo(num,null,null,null,null,null,null,null);  
        	  pservice.updateBackimg(pvo);        	  
          }        
			String backimg=pservice.info(num).getBackimg();
            return "redirect:/profiles/info?num="+num;
          }catch(Exception e){
            e.printStackTrace();
            return "test/error";           
          }
	}
	@RequestMapping(value="profile/updateProfImg",method=RequestMethod.POST,produces="text/plain")
	@ResponseBody
	public String setProfImg(int num,MultipartFile uploadProfImg,HttpSession session,Model model){
		try{			
			if(!uploadProfImg.isEmpty()){ // 첨부된파일이 있는 경우
          // 1. 기존파일 삭제
            String path=session.getServletContext()
                               .getRealPath("/resources/upload");
            System.out.println("경로::::"+path+",,,,,,,uploadProfImg:"+uploadProfImg);
            ProfilesVo pvo1=pservice.info(num);
            String profileimg2=pvo1.getProfileimg();
            File f=new File(path + "\\" + profileimg2);
            if(!f.delete()){
               new Exception("파일삭제실패!");
            }
            // 2. 첨부된 파일 저장
            profileimg2=uploadProfImg.getOriginalFilename();
            String profileimg = UUID.randomUUID() +"_" + profileimg2;
            InputStream is=uploadProfImg.getInputStream();
            FileOutputStream fos=
                    new FileOutputStream(path +"\\" + profileimg);
            FileCopyUtils.copy(is,fos);
            is.close();
            fos.close();
            //3. db수정            
            ProfilesVo pvo=new ProfilesVo(num,null,null,null,null,profileimg,null,null);
            pservice.updateProfImg(pvo);
                      
          }else {//첨부된 파일이 없는 경우
            //db수정하기       	  
        	  ProfilesVo pvo=new ProfilesVo(num,null,null,null,null,null,null,null);  
        	  pservice.updateProfImg(pvo);        	  
          }        
			String profileimg=pservice.info(num).getProfileimg();
            return "redirect:/profiles/info?num="+num;
          }catch(Exception e){
            e.printStackTrace();
            return "test/error";           
          }
	}
}