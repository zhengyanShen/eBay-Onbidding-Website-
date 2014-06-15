package onbidding;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@WebServlet("/WishListServlet")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public WishListServlet() {
        super();
    }

    RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("currentUser");
		List<Like> likes = user.getLikes();
		JSONArray itemlist = new JSONArray();
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//response.flushBuffer();
		
		if(likes.isEmpty()){
			System.out.println("Empty");
		}else{
			for(Like like: likes){			
				JSONObject itemObject = new JSONObject();

				Item item = like.getItem();	
				String itemId = item.getItemid();
				String itemTitle = item.getTitle();
				String itemPic = item.getPic();
				String itemUrl = item.getViewitem();
				
				itemObject.put("itemId",itemId);
				itemObject.put("itemTitle",itemTitle);
				itemObject.put("itemPic",itemPic);
				itemObject.put("itemUrl",itemUrl);
				itemlist.add(itemObject);
			}
			
			System.out.println("==========jsonArray:  "+itemlist+"  ==========");
	        out.print(itemlist);
	        out.flush();
	        //response.reset(); 
		}
		
	}
}
