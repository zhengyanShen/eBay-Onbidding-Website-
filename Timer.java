package onbidding;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the timer database table.
 * 
 */
@Entity
@Table(name="timer")
@NamedQuery(name="Timer.findAll", query="SELECT t FROM Timer t")
public class Timer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	private int lefttime;
	
	//bi-directional many-to-one association to Item
	@ManyToOne
	@JoinColumn(name="ITEMID")
	private Item item;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="USERID")
	private User user;

	public Timer() {
	}
	
	public Timer(int lefttime) {
		super();
		this.lefttime = lefttime;
	}


	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLefttime() {
		return this.lefttime;
	}

	public void setLefttime(int lefttime) {
		this.lefttime = lefttime;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}


}
