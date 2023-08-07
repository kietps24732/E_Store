package com.fpoly.Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.fpoly.Entity.User;

@Component
public class AuthInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws IOException {
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		
		if(user.getAdmin() != 0 && uri.startsWith("/index/")) {
			response.sendRedirect(request.getContextPath() + "/logout");
			session.setAttribute("message", "You Have No Authority");
			return false;
		}
		
		if(session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/logout");
			session.setAttribute("message", "Please Login");
			return false;
		} 
		return true;
	}
}
