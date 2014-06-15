package onbidding;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;



public class LikeDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Zhen2b");
	EntityManager em = null;
	
	public void createLike(User user, Item item, Like like) {  
		em = factory.createEntityManager();
		em.getTransaction().begin();
			
		em.persist(like);
		
		//User user1=em.find(User.class,user.getId());
		//Item item1=em.find(Item.class,item.getId());
		
		like.setUser(user);
		like.setItem(item);
		em.merge(like);
		
		
		user.getLikes().add(like);
		item.getLikes().add(like);
		em.merge(user);
		em.merge(item);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public void deleteLike(Like like) {                  
		em = factory.createEntityManager();
		em.getTransaction().begin();

		User user = like.getUser();
		Item item = like.getItem();
		user.getLikes().remove(like);
		em.merge(user);
		item.getLikes().remove(like);
		em.merge(item);
		
		Like managed = em.merge(like);
		em.remove(managed);
		
		em.getTransaction().commit();
		em.close();
	}
	
	public Like findLike(User user,Item item){
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("select l from Like l where l.user.id=:userid1 AND l.item.id=:itemid1");
		query.setParameter("userid1",user.getId());
		query.setParameter("itemid1",item.getId());
		
		List<Like> likes = query.getResultList();
		Like like = likes.get(0); 
		
		em.getTransaction().commit();
		em.close();
		return like;
	}
	
	public boolean ifLiked(User preuser, Item preitem) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
	
		Query query = em.createQuery("select l from Like l where l.user.id=:userid1 AND l.item.id=:itemid1");
		query.setParameter("userid1", preuser.getId());
		query.setParameter("itemid1", preitem.getId());
		
		List<Like> likes = query.getResultList();
		em.getTransaction().commit();
		em.close();
		
		if (likes.isEmpty()) {
			return true;
		}else{
			return false;
		}
		
	}
	
	public boolean ifItemStillBeLiked(Item preitem) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
	
		Query query = em.createQuery("select l from Like l where l.item.id=:itemid1");
		query.setParameter("itemid1", preitem.getId());
		
		List<Like> likes = query.getResultList();
		em.getTransaction().commit();
		em.close();
		
		if (likes.isEmpty()) {
			return true;
		}
		return false;
	}
	
	public static void main(String[] args) {		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("Zhen2b");
		EntityManager em = null;
		
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		LikeDao likedao = new LikeDao();
		ItemDao itemdao = new ItemDao();
	
		User user = em.find(User.class, 1);
		Item item = em.find(Item.class, 54);
		
		//Like deletelike = likedao.findLike(user, item);
		//likedao.deletLike(deletelike);
		
		Item itemagain = em.find(Item.class, item.getId());
		
		List<Like> like1 = itemagain.getLikes();
		Like likess = like1.get(0);
		User user1 = likess.getUser();
		
		if(user1 == null){
			itemdao.deleteItem(itemagain);
			System.out.println("no like use this item");
		}

		
	}
	
}
