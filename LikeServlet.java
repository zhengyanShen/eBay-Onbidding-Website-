package onbidding;


import java.io.*;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LikeServlet() {
        super();
    }
    
    RequestDispatcher dispatcher = null;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("likeServlet start");
		
		LikeDao likedao = new LikeDao();
		ItemDao itemdao = new ItemDao();
		
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("currentUser");	
		
		String itemId = request.getParameter("likeditemid");
		String title = request.getParameter("likeditemtitle");
		String pic = request.getParameter("likeditempic");
		String viewItem = request.getParameter("likeditemurl");
		
		String endTime = request.getParameter("likeditemendtime");
		
		//System.out.println(endTime);
		
		String endTimeArray[]=endTime.split("\\.");
		
		//System.out.println(endTimeArray[0]);
		
		
		Timestamp dateEndTime = null;
		
		if(endTime!="")
		{
			dateEndTime = java.sql.Timestamp.valueOf(endTimeArray[0]);
		}
		else
		{
			dateEndTime=null;
		}
		
		if(itemdao.findItem(itemId) == null){
			Item itemliked = new Item(itemId, title, pic, viewItem, dateEndTime);
			itemdao.createItem(itemliked);
			Item item = itemdao.findItem(itemId);			
			
			Like like = new Like();
			likedao.createLike(user, item, like);
			
		
		}
		else{
			Item item = itemdao.findItem(itemId);
			
			System.out.println(likedao.ifLiked(user, item));
			if(likedao.ifLiked(user, item)){
				Like like = new Like();
				likedao.createLike(user, item, like);
				
			}
	
			
		}
		
	}
}
