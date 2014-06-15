package onbidding;


import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }

    RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		UserManager uMgr = new UserManager();
		User user = uMgr.validateUser(username,password);
		HttpSession session = request.getSession(true);
		if(user == null) {
			session.setAttribute("message", "LoginFailed");
			session.setAttribute("currentUser",null);
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			
		} else {
			session.setAttribute("message",null);
			session.setAttribute("currentUser", user);
			session.setAttribute("validate", "success");
			
			session.setAttribute("username", user.getUsername());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("firstname", user.getFirstname());
			session.setAttribute("lastname", user.getLastname());
			session.setAttribute("gender", user.getgender());
			session.setAttribute("dateofbirth", user.getDateOfBirth());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("zipcode", user.getZipcode());
			
			dispatcher = request.getRequestDispatcher("indexAfterLogin.jsp");
			dispatcher.forward(request, response);
		}
	}
}
