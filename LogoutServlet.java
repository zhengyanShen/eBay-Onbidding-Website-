package onbidding;


import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LogoutServlet() {
        super();
    }

    RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession(true);
			session.setAttribute("message", null);
			session.setAttribute("currentUser",null);
			session.setAttribute("username", null);
			session.setAttribute("password", null);
			session.setAttribute("firstname", null);
			session.setAttribute("lastname", null);
			session.setAttribute("gender", null);
			session.setAttribute("dateofbirth", null);
			session.setAttribute("email",null);
			session.setAttribute("address",null);
			session.setAttribute("zipcode", null);
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
	}
}
