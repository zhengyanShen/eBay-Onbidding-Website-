package onbidding;



import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;




public class AccountDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Zhen2b");
	EntityManager em = null;
	public void PersistUserIntoDatabase(User user)
	{

		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		
		em.merge(user);
		
		em.getTransaction().commit();
		em.close();
	}
}
