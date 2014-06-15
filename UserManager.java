package onbidding;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class UserManager {

	public User validateUser(String username, String password) {
		UserDao userdao = new UserDao();
		System.out.println(userdao.GetUserByUsernameAndPassword(username,password));
		try {

			if (userdao.GetUserByUsernameAndPassword(username, password) != null) {
				User user = userdao.GetUserByUsernameAndPassword(username,
						password);
				return user;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("User not found");
		}
		return null;
	}

	public User createUser(String newusername, String newpassword,
			String newfirstname, String newlastname, Date newdateOfBirth,
			String newemail, String newaddress, String newzipcode,
			String newgender) {
		UserDao userdao = new UserDao();
		User user = userdao.RegisterUser(newusername, newpassword,
				newfirstname, newlastname, newdateOfBirth, newemail,
				newaddress, newzipcode, newgender);
		return user;
	}

}
