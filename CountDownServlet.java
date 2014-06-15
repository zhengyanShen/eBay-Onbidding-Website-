package onbidding;

import java.io.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/CountDownServlet")
public class CountDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CountDownServlet() {
		super();
	}

	RequestDispatcher dispatcher = null;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("CountDownSerlet Start");
		
		JSONArray timelist = new JSONArray();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("currentUser");
		List<Timer> timers = user.getTimers();
		for (int i = 0; i < timers.size(); i++) 
			{
			JSONObject timeObject = new JSONObject();
			
			Timestamp endTimeTimeStamp = user.getTimers().get(i).getItem().getEndtime();
			Timestamp nowTimeTimestamp = new Timestamp(
			System.currentTimeMillis());
            Long long_time = endTimeTimeStamp.getTime()- nowTimeTimestamp.getTime();
            int int_time = new Long(long_time).intValue();
            int timer_offset= user.getTimers().get(i).getLefttime()*60*1000;
            int offset=3600*1000*4;
            int int_count = int_time - offset - timer_offset;  
            int int_count_final=int_count/1000;
            
            String itemtitle = user.getTimers().get(i).getItem().getTitle() + " is timeout";
            timeObject.put("itemTitle", itemtitle);
            timeObject.put("timer",int_count_final);
			timelist.add(timeObject);
            }
		
        out.print(timelist);
        out.flush();
		
	}
}
