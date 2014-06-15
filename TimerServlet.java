package onbidding;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TimerServlet")
public class TimerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TimerServlet() {
		super();
	}

	RequestDispatcher dispatcher = null;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		LikeDao likedao = new LikeDao();
		ItemDao itemdao = new ItemDao();
		TimerDao timerdao = new TimerDao();

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("currentUser");

		String itemId = request.getParameter("itemId");
		String timeSet = request.getParameter("timeSet");
		
		System.out.println(timeSet);
		
		Integer IntTimerSet = Integer.parseInt(timeSet);
		Timer timer= new Timer(IntTimerSet);

		//find that item you want to set timer for
		Item itemReadyToSet = itemdao.findItem(itemId);
		
		if(itemReadyToSet.getTimers().isEmpty())
		{
			Timer newtimer=timerdao.createTimer(user, itemReadyToSet, timer);
		}
		else
		{
			Timer oldtimer=itemReadyToSet.getTimers().get(0);
		    Timer newtimer=timerdao.updateTimer(oldtimer,timer);
		}
		
		dispatcher = request.getRequestDispatcher("wishlist.jsp");
		dispatcher.forward(request, response);
		

	}
}
