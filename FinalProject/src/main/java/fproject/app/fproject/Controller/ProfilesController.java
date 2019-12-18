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
		AccountVo avo=aservice.info(num);
		ModelAndView mv=new ModelAndView("profiles/profiles");
		mv.addObject("pvo",pvo);
		mv.addObject("id",avo.getId());
		return mv;
	}
	@RequestMapping(value="profile/updateBackImg",method=RequestMethod.POST,produces="text/plain")
	public String setBackImg(int num,MultipartFile file1,HttpSession session,Model model){
		try{			
			if(!file1.isEmpty()){ // ÷�ε������� �ִ� ���
          // 1. �������� ����
            String path=session.getServletContext()
                               .getRealPath("/resources/upload");
            ProfilesVo pvo1=pservice.info(num);
            String backimg=pvo1.getBackimg();
            File f=new File(path + "\\" + backimg);
            if(!f.delete()){
               new Exception("���ϻ�������!");
            }
            // 2. ÷�ε� ���� ����
            backimg=file1.getOriginalFilename();
            String backimg2 = UUID.randomUUID() +"_" + backimg;
            InputStream is=file1.getInputStream();
            FileOutputStream fos=
                    new FileOutputStream(path +"\\" + backimg2);
            FileCopyUtils.copy(is,fos);
            is.close();
            fos.close();
            //3. db����            
            ProfilesVo pvo=new ProfilesVo(num,null,null,null,null,null,backimg2,null);
            pservice.update(pvo);
                      
          }else {//÷�ε� ������ ���� ���
            //db�����ϱ�       	  
        	  ProfilesVo pvo=new ProfilesVo(num,null,null,null,null,null,null,null);  
        	  pservice.update(pvo);        	  
          }        
			String backImg=pservice.info(num).getBackimg();
            return "redirect:/profiles/info?num="+num;
          }catch(Exception e){
            e.printStackTrace();
            return "test/error";
          }
	}
}