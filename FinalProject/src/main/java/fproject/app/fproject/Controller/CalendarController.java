package fproject.app.fproject.Controller;




import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fproject.app.fproject.service.CalendarService;
import fproject.app.fproject.service.FriendsService;
import fproject.app.fproject.service.NationalDayService;
import fproject.app.fproject.vo.CalenderVo;
import fproject.app.fproject.vo.NationaldayVo;

@Controller
public class CalendarController {
	@Autowired
	private NationalDayService Nservice;
	@Autowired
	private CalendarService Cservice;
	@Autowired
	private FriendsService Fservice;
	private int frinum=0;
	@RequestMapping("/calendar")
	public String calendar(){
		return "calendar";
	};

	@RequestMapping(value="/calendar/list",produces="application/json;charset=utf-8")
	@ResponseBody
	public String list(HttpSession session){
		JSONArray arr=new JSONArray();
		int num=0;
		if(session.getAttribute("num")!=null){
			num=(Integer)(session.getAttribute("num"));
		}
		HashMap<String, Object> map=new HashMap<>();
		map.put("friname","");
		map.put("num", num);
		List <HashMap<String, Object>> flist=Fservice.list(map);
 		List<CalenderVo> list1=Cservice.list(num);
		List<NationaldayVo> list2=Nservice.list();
		for(NationaldayVo vo:list2){
			JSONObject json=new JSONObject();			
			json.put("_id", vo.getAnivernum());	
			json.put("title", vo.getAnivername());
			json.put("description", vo.getAnivercontent());	
			json.put("type","焊烹");
			json.put("username","惫啊傍绒老");
			json.put("backgroundColor", "#d80000");
			json.put("textColor", "#ffffff");
			json.put("start", vo.getAniverstartdate());	
			json.put("end",vo.getAniverenddate());	
			json.put("allDay", true);
			arr.put(json);
		}
		for(HashMap<String, Object> fri:flist){			
			String[] array =((String)fri.get("BIRTH")).split("-");
			for(int j=2018;j<2025;j++){
				JSONObject json=new JSONObject();	
				json.put("_id",--frinum );	
				json.put("title", fri.get("NAME")+" 积老");
				json.put("description","模备 积老");	
				json.put("type","焊烹");
				json.put("username","模备积老");
				json.put("backgroundColor", "#5ea4df");
				json.put("textColor", "#ffffff");
				json.put("start",j+"-"+array[1]+"-"+array[2]);	
				json.put("end",j+"-"+array[1]+"-"+array[2]);
				json.put("allDay", true);		
				arr.put(json);
			}		
		}
		for (CalenderVo vo:list1){
			JSONObject json=new JSONObject();			
			json.put("_id", vo.getAnivernum());	
			json.put("title", vo.getAnivername());
			json.put("description", vo.getAnivercontent());	
			json.put("type",vo.getAniverimpor());
			json.put("username", vo.getAnivertype());
			json.put("backgroundColor", vo.getAniverback());
			json.put("textColor", vo.getAnivertext());
			json.put("start", vo.getAniverstartdate());	
			json.put("end",vo.getAniverenddate());
			json.put("alarm", vo.getAniveralarm());
			if(vo.getAllday().equals("true")){
				json.put("allDay", true);
			}else{
				json.put("allDay", false);
			}
			arr.put(json);
		}
		return arr.toString();
	}
	@RequestMapping(value = "/calendar/insert",method=RequestMethod.POST)
	public void insert(CalenderVo vo,HttpSession session) throws Exception{
		int num=(Integer)(session.getAttribute("num"));
		vo.setNum(num);
	
		if(vo.getAllday().equals("true")){
			Cservice.insertTrue(vo);
		}else{
			Cservice.insertFalse(vo);	
		}
	}	
	@RequestMapping(value = "/calendar/update",method=RequestMethod.POST)
	public void update(CalenderVo vo) throws Exception{
		//System.out.println(vo);
		if(vo.getAllday().equals("true")){
			Cservice.updateTrue(vo);
		}else{
			Cservice.updateFalse(vo);	
		}
	}	
	@RequestMapping(value = "/calendar/updatedrop",method=RequestMethod.POST)
	public void updateDrop(CalenderVo vo) throws Exception{
		Cservice.updateDrop(vo);
	}	
	@RequestMapping(value="/calendar/delete",method=RequestMethod.GET)
	public void delete(int anivernum) throws Exception{
		Cservice.delete(anivernum);
	}
}













