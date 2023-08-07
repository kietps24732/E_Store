package com.fpoly.Utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	

	/**
	* Đọc giá trị của cookie từ request
	* @param name tên cookie cần đọc
	* @return chuỗi giá trị đọc được hoặc rỗng nếu không tồn tại
	*/
	public String getValue(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie cke : cookies) {
				if(cke.getName().equalsIgnoreCase(name)) return cke.getValue();
			}
		}
		return "";
	}
	
	
	
	/**
	* Tạo và gửi cookie về client
	* @param name tên cookie
	* @param value giá trị cookie
	* @param hours thời hạn (giờ)
	* @return đối tượng cookie đã tạo
	*/
	public Cookie add(String name, String value, int hours) {
		
		Cookie cookie  = new Cookie(name,value);
		cookie.setMaxAge(hours * 60 *60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}
	
	
	/**
	* Xóa cookie khỏi client
	* @param name tên cookie cần xóa
	*/
	public Cookie remove(String name) {
		Cookie[] cookies = request.getCookies();
			
		if(cookies!=null) {
			for(Cookie cke : cookies) {
				if(cke.getName().equalsIgnoreCase(name)) {
					cke.setMaxAge(0);
					 response.addCookie(cke);
					 return cke;
				}
				
			}
		}
		return null;
		
	}
}
