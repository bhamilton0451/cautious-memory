<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="
    	library.CookieHandler,
		java.io.IOException,
		java.io.PrintWriter,
		
		javax.servlet.annotation.WebServlet,
		javax.servlet.http.Cookie,
		javax.servlet.http.HttpServlet,
		javax.servlet.http.HttpServletRequest,
		javax.servlet.http.HttpServletResponse
    "%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Receiver</title>
	
	<script>
		function getElementByID(a){
			return document.getElementById(a);
		}
		
		function getText(a){
			var text = document.getElementById(a).value;
			return String(text);
		}
		
		function setNonNull(a, b){
			if (getElementByID(a) != null){
				getElementByID(a).innerHTML = getText(b);
			}
		}
		
		function setElementColor(element, hex_code){
			el = getElementByID(element)
			
			el.style.color = hex_code
		}
	</script>
	
</head>

<body>
	<%
		CookieHandler handler = new CookieHandler();
		Cookie[] cookie = request.getCookies();
		
		System.out.println();
		System.out.println("START:");
		for(int L = 0; L < cookie.length; L++){
			System.out.println(cookie[L].getName() + " " + cookie[L].getValue());
		}
			
		PrintWriter writer = response.getWriter();
			
		String[] nome = {
			"inf_pessoal",			
			"inf_academica",				
			"inf_profissional",				
			"cor_fvt"					
		};								
											
		String[] valor = new String[4];
		
		//See Cookies existe,
		// Itera pelo array de Cookies e seta o array de Valores.
		if(cookie.length > 0){
			for(int L = 0; L < nome.length; L++){
				try{
					valor[L] = handler.ReadCookie(cookie, nome[L]).getValue();
				} catch(NullPointerException exp){
					//Não crasha o script pfv.
				}
			}
		}
	%>
	
	
	
	<input id='inf_pessoal' type='hidden' value='<%=valor[0]%>'/>
	<input id='inf_academica' type='hidden' value='<%=valor[1]%>'/>
	<input id='inf_profissional' type='hidden' value='<%=valor[2]%>'/>
	<input id='cor_fvt' type='hidden' value='<%=valor[3]%>'/>

	
	<h2 id="inf_pes">N/A</h2><br>
		
	<h2 id="inf_aca">N/A</h2><br>
		
	<h2 id="inf_prof">N/A</h2><br>
		
	<h2 id="cor">N/A</h2><br>
	
	<script>
	
		setNonNull("inf_pes", "inf_pessoal")
		setNonNull("inf_aca", "inf_academica")
		setNonNull("inf_prof", "inf_profissional")
		setNonNull("cor", "cor_fvt")
		
		setElementColor("inf_pes", getText("cor_fvt"))
		setElementColor("inf_aca", getText("cor_fvt"))
		setElementColor("inf_prof", getText("cor_fvt"))
		setElementColor("cor", getText("cor_fvt"))
	
	</script>
</body>

</html>