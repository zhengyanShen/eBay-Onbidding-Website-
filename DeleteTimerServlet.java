package onbidding;


import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteTimerServlet")
public class DeleteTimerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteTimerServlet() {
        super();
    }
    
    RequestDispatcher dispatcher = null;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TimerDao timerdao = new TimerDao();
		ItemDao itemdao = new ItemDao();
		UserDao userdao = new UserDao();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("currentUser");	
		int userid = user.getId();
		
		
		String itemId = request.getParameter("deleteditemid");
		Item item = itemdao.findItem(itemId);
		
		Timer deletetimer = timerdao.findTimer(user, item);		
		timerdao.deleteTimer(deletetimer);
		
		User userAfterDelete = userdao.findUser(userid);
		
		
		//Item itemagain = itemdao.findItem(itemId);
		
		
		//itemdao.deleteItem(itemagain);
		System.out.println("yeah!");
		
		
		
		//session.setAttribute("currentUser", null);
		session.setAttribute("currentUser", userAfterDelete);
		
//		dispatcher = request.getRequestDispatcher("wishlist.jsp");		
//		dispatcher.forward(request, response);
		//response.sendRedirect("wishlist.jsp");
		
	}
}
