package onbidding;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;




public class UserDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Zhen2b");
	public User GetUserByUsernameAndPassword(String username,String password)
	{
		List<User> user= new ArrayList<User>();
		User user1=null;
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("select u from User u where u.username=:holyshit");
		query.setParameter("holyshit",username);
		
		user= query.getResultList();
		em.getTransaction().commit();
		em.close();
		
		if(!user.isEmpty())
		{
			System.out.println(!user.isEmpty());
		
		
			user1=user.get(0);
		
		
			System.out.println(user.isEmpty());

		
			if(password.equals(user1.getPassword()))
		
			{	
			
			
				return user1;
		}
		}
		return null;
	}
	
	
	public User RegisterUser(String newusername, String newpassword, String newfirstname,
			String newlastname, Date newdateOfBirth, String newemail,
			String newaddress, String newzipcode, String newgender) 
	{
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		User user=new User(newusername,newpassword,newfirstname,newlastname,newdateOfBirth,newemail,newaddress,newzipcode,newgender);
	    
		em.persist(user);
		
		em.getTransaction().commit();
		em.close();
		
		
		return user;
		
	}
	
	public User findUser(int userid){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		User user = em.find(User.class, userid);
		
		em.getTransaction().commit();
		em.close();
		return user;
		
	}
	
	
}
	
	
/* public static void main(String[] args) {
	{
		UserDao ud=new UserDao();
		System.out.println(ud.GetUserByUsernameAndPassword("litao", "tgm").getUsername());
	}
} */

