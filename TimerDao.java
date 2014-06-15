package onbidding;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;



public class TimerDao {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("Zhen2b");
	EntityManager em = null;
	
	public Timer createTimer(User user, Item item, Timer timer) {
		em = factory.createEntityManager();
		em.getTransaction().begin();
			
		em.persist(timer);
		
		timer.setUser(user);
		timer.setItem(item);
		em.merge(timer);
		
		user.getTimers().add(timer);
		item.getTimers().add(timer);
		em.merge(user);
		em.merge(item);
		
		em.getTransaction().commit();
		em.close();
		
		return timer;
	}
	
	public Timer findTimer(User user,Item item){
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		Query query = em.createQuery("select t from Timer t where t.user.id=:userid1 AND t.item.id=:itemid1");
		query.setParameter("userid1",user.getId());
		query.setParameter("itemid1",item.getId());
		
		List<Timer> timers = query.getResultList();
		if(timers.isEmpty()){
			em.getTransaction().commit();
			em.close();
			return null;
		}
		else{
			Timer timer = timers.get(0);
			em.getTransaction().commit();
			em.close();
			return timer;
			
		}
	}

	public void deleteTimer(Timer timer) {  	
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		User user = timer.getUser();
		Item item = timer.getItem();
		
		user.getTimers().remove(timer);
		em.merge(user);
		item.getTimers().remove(timer);
		em.merge(item);
		
		Timer managed = em.merge(timer);
		em.remove(managed);
		
		em.getTransaction().commit();
		em.close();
	}

	public Timer updateTimer(Timer oldtimer, Timer timer)
	{
		em = factory.createEntityManager();
		em.getTransaction().begin();
		
		//User user=oldtimer.getUser();
		//Item item=oldtimer.getItem();
		
		
		//user.getTimers().remove(oldtimer);
		//item.getTimers().remove(oldtimer);
		
		oldtimer.setLefttime(timer.getLefttime());

		em.merge(oldtimer);
		
		//user.getTimers().add(oldtimer);
		//em.merge(user);
		
		//item.getTimers().add(oldtimer);
		//em.merge(item);
	

		//oldtimer.setUserid(timer.getUserid());
	
		em.getTransaction().commit();
		em.close();
		
		return oldtimer;
	}
}
