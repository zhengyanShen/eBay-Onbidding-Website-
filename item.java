package onbidding;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the ITEM database table.
 * 
 */
@Entity
@Table(name="ITEM")
@NamedQuery(name="Item.findAll", query="SELECT i FROM Item i")
public class Item implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	private Timestamp endtime;

	@Column(length=255)
	private String itemid;

	@Column(length=255)
	private String pic;

	@Column(length=255)
	private String title;

	@Column(length=255)
	private String viewitem;

	//bi-directional many-to-one association to Like
	@OneToMany(mappedBy="item")
	private List<Like> likes;

	//bi-directional many-to-one association to Timer
	@OneToMany(mappedBy="item")
	private List<Timer> timers;

	public Item() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}

	public String getItemid() {
		return this.itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getViewitem() {
		return this.viewitem;
	}

	public void setViewitem(String viewitem) {
		this.viewitem = viewitem;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setItem(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setItem(null);

		return like;
	}

	public List<Timer> getTimers() {
		return this.timers;
	}

	public void setTimers(List<Timer> timers) {
		this.timers = timers;
	}

	public Timer addTimer(Timer timer) {
		getTimers().add(timer);
		timer.setItem(this);

		return timer;
	}

	public Timer removeTimer(Timer timer) {
		getTimers().remove(timer);
		timer.setItem(null);

		return timer;
	}
	
	public Item(String itemid, String title, String pic, String viewitem,Timestamp endtime){
		this.itemid = itemid;
		this.pic = pic;
		this.title = title;
		this.viewitem = viewitem;
		this.endtime = endtime;
	}

}
