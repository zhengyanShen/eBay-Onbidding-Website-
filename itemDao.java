package onbidding;



import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


import java.util.List;




public class ItemDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Zhen2b");
	EntityManager em = null;
	public void createItem(Item item)
	{

		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		
		em.persist(item);
		
		em.getTransaction().commit();
		em.close();

	}
	
	public void deleteItem(Item item)
	{
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Item sis = em.merge(item);
		em.remove(sis);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void ItemLikedUser(Item item, Like like){
		
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		item.addLike(like);
	    
		em.merge(item);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public Item findItem(String itemId){
		EntityManager em = factory.createEntityManager();
		em.getTransaction().begin();
		
		
		Query query = em.createQuery("select i from Item i where i.itemid=:holyshit");
		query.setParameter("holyshit",itemId);
		
		List<Item> items = query.getResultList();
		
		if(items.size() != 0){
			Item item =items.get(0);
			
			em.getTransaction().commit();
			em.close();
			
			return item;
		}else{
			em.getTransaction().commit();
			em.close();
			return null;
		}
		
		
		
		
	}
}
