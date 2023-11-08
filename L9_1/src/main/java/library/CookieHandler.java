//import java.io.IOException;
//import java.io.PrintWriter;
package library;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CookieHandler")
public class CookieHandler extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try{
			String redirectURL = "receiver.jsp";
			
			//System.out.println();
			//System.out.println("START:");
			
			String a = request.getParameter("inf_pessoal");
			//System.out.println(a);
			
			String b = request.getParameter("inf_academica");
			//System.out.println(b);
			
			String c = request.getParameter("inf_profissional");
			//System.out.println(c);
			
			String d = request.getParameter("cor_fvt");
			//System.out.println(d);
			
			//System.out.println("- - - - - -");
			
			Cookie cookie1 = new Cookie("inf_pessoal", a);
			//System.out.println(cookie1.getName() + " " + cookie1.getValue());
			
			Cookie cookie2 = new Cookie("inf_academica", b);
			//System.out.println(cookie2.getName() + " " + cookie2.getValue());
			
			Cookie cookie3 = new Cookie("inf_profissional", c);
			//System.out.println(cookie3.getName() + " " + cookie3.getValue());
			
			Cookie cookie4 = new Cookie("cor_fvt", d);
			//System.out.println(cookie4.getName() + " " + cookie4.getValue());
			
			
			
			//Seta vida máxima em segundos
			cookie1.setMaxAge(60*5);
			cookie2.setMaxAge(60*5);
			cookie3.setMaxAge(60*5);
			cookie4.setMaxAge(60*5);
			
			response.addCookie(cookie1);
			response.addCookie(cookie2);
			response.addCookie(cookie3);
			response.addCookie(cookie4);
			
			response.sendRedirect(redirectURL);
			
		} catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	public Cookie ReadCookie(Cookie[] cookie, String name) {
		//System.out.println();
		//System.out.println("COMPARING:");
		for(int L = 0; L < cookie.length; L++) {
			//System.out.println(cookie[L].getName() + " TO " + name);
			
			if(cookie[L].getName().equals(name)) {
				//System.out.println("PASS!");
				//System.out.println();
				return cookie[L];
			}
			
		} 
		//System.out.println( name + " NOT IN ARRAY!");
		//System.out.println();
		return null;
	}
}
