package cn.windy.module.core.spring.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.windy.module.examination.mybatis.model.FrontUser;
import cn.windy.module.util.WindyConstants;



public class WebSessionInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		FrontUser user= (FrontUser)session.getAttribute(WindyConstants.SESSION_FRONTUSER);
		
		if(user != null){
			
			return true;
		}
		
		request.getRequestDispatcher("/web/module/login/login.htm").forward(request, response); 
		return false;
	}

}
