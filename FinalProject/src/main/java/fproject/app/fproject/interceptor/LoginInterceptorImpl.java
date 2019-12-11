package fproject.app.fproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginInterceptorImpl implements HandlerInterceptor {
	@Autowired
	static Logger logger = Logger.getLogger(LoginInterceptorImpl.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String id = (String)request.getSession().getAttribute("id");
		if(id==null) {
			response.sendRedirect("/fproject/member/login?auth=lack");
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// Controller 호출 이후 동작
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// Controller 및 View 호출 이후 동작
		
	}
	
}
