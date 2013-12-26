package com.feng.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.feng.exception.AuthorizationException;


public class MyInterceptor extends HandlerInterceptorAdapter{

	private List<String> excluedUrls;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//System.out.println("HandlerName:" + handler.getClass().getName());
		for(String url: excluedUrls) {
			if(request.getRequestURI().endsWith(url)) {
				System.out.println(url);
				return true;
			}
		}
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			response.sendError(404);
			throw new AuthorizationException("ÄãÃ»ÓÐµÇÂ¼");
		}
		
		return true;
	}

	public void setExcluedUrls(List<String> excluedUrls) {
		this.excluedUrls = excluedUrls;
	}
	
	
}
