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

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AccountServlet() {
        super();
    }
    

    RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date newDateOfBirth =null;
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("currentUser");		
		
		
		String newusername = request.getParameter("username");
		String newpassword = request.getParameter("password");
		String newfirstname = request.getParameter("firstname");
		String newlastname = request.getParameter("lastname");
		String newgender = request.getParameter("gender");
		String newDateOfBirthMedia = request.getParameter("dateofbirth");
		String newemail = request.getParameter("email");
		String newAddress = request.getParameter("address");
		String newzipcode = request.getParameter("zipcode");
		if(newDateOfBirthMedia!="")
		{
			newDateOfBirth = java.sql.Date.valueOf(newDateOfBirthMedia);
		}
		else
		{
			newDateOfBirth=null;
		}
		
		if(newusername.length() != 0 && newpassword.length() != 0)
		{
			user.setUsername(newusername);
			user.setPassword(newpassword);
			user.setFirstname(newfirstname);
			user.setLastname(newlastname);
			user.setgender(newgender);
			user.setDateOfBirth(newDateOfBirth);
			user.setEmail(newemail);
			user.setAddress(newAddress);
			user.setZipcode(newzipcode);
			
			AccountDao dao = new AccountDao();
			dao.PersistUserIntoDatabase(user);
			
			session.setAttribute("currentUser",user);
			session.setAttribute("username", user.getUsername());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("firstname", user.getFirstname());
			session.setAttribute("lastname", user.getLastname());
			session.setAttribute("gender", user.getgender());
			session.setAttribute("dateofbirth", user.getDateOfBirth());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("zipcode", user.getZipcode());
			
			session.setAttribute("accountStatus", null);
			dispatcher = request.getRequestDispatcher("indexAfterLogin.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			session.setAttribute("accountStatus","Change Failed, please try again");
			dispatcher = request.getRequestDispatcher("account.jsp");
			dispatcher.forward(request, response);
		}

	}
}
