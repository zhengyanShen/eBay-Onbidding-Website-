package onbidding;


import java.io.*;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterServlet() {
        super();
    }

    RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String newusername=null;
		String newpassword=null;
		String newfirstname=null;
		String newlastname=null;
		String newgender=null;
	    Date newDateOfBirth=null;
		String newemail=null;
		String newAddress=null;
		String newzipcode=null;
		String newDateOfBirthMedia;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		newusername = request.getParameter("newusername");
		newpassword = request.getParameter("newpassword");
		newfirstname= request.getParameter("newfirstname");
		newlastname =request.getParameter("newlastname");
		newgender=request.getParameter("newgender");
		newDateOfBirthMedia=request.getParameter("newDateOfBirth");
		if(newDateOfBirthMedia!="")
		{
			newDateOfBirth = java.sql.Date.valueOf(newDateOfBirthMedia);
		}
		else
		{
			newDateOfBirth=null;
		}
		newemail=request.getParameter("newemail");
		newAddress=request.getParameter("newAddress");
		newzipcode=request.getParameter("newzipcode");
		
		UserManager uMgr = new UserManager();
		if(uMgr.validateUser(newusername, newpassword)==null && newusername.length()!=0)
		{
		User user = uMgr.createUser(newusername, newpassword, newfirstname, newlastname, newDateOfBirth, newemail, newAddress, newzipcode, newgender);
			
		HttpSession session = request.getSession(true);	
		session.setAttribute("RegisterStatus","Registeration Success");
		dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		}
		else
		{
			HttpSession session = request.getSession(true);	
			session.setAttribute("RegisterStatus","Registeration Failed. User Exists");
			dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.forward(request, response);
		}
		}
	}
