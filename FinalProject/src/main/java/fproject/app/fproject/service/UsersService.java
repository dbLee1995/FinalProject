package fproject.app.fproject.service;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import fproject.app.fproject.dao.MyUsersDao;
import fproject.app.fproject.vo.AccountVo;
import fproject.app.fproject.vo.ProfilesVo;


@Repository
public class UsersService {
	@Autowired
	private MyUsersDao dao;
	public void setDao(MyUsersDao dao) {
		this.dao = dao;
	}
	public AccountVo isMember(AccountVo vo) {
		return dao.isMember(vo);
	}
	public HashMap<String,Object> login(HashMap<String,Object> map){
		return dao.login(map);
	}
	public String find_id(HttpServletResponse response, String email) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id= dao.find_id(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	// 비밀번호 찾기 폼에서 아이디 유무 확인해줌
	public ProfilesVo check_id(int num, String id, String email){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		map.put("num", num);
		System.out.println(map.get("id"));
		System.out.println(map.get("email"));
		return dao.check_id(map);
	}
	// 위 폼 유무 확인되면 임시비밀번호 생성해서 변경시켜줌
	public int update_pwdOK(String certification, String id) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("certification", certification);
		map.put("id", id);
		return dao.update_pwdOK(map);
	}
}




