package onbidding;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the USER database table.
 * 
 */
@Entity
@Table(name="USER")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(length=255)
	private String Address;

	@Temporal(TemporalType.DATE)
	private Date dateofbirth;

	@Column(length=255)
	private String email;

	@Column(length=255)
	private String firstname;

	@Column(length=255)
	private String gender;

	@Column(length=255)
	private String lastname;

	@Column(length=255)
	private String password;

	@Column(length=255)
	private String username;

	@Column(length=255)
	private String zipcode;

	//bi-directional many-to-one association to Like
	@OneToMany(mappedBy="user")
	private List<Like> likes;

	//bi-directional many-to-one association to Timer
	@OneToMany(mappedBy="user")
	private List<Timer> timers;
	
	//bi-directional many-to-one association to Timer
	@OneToMany(mappedBy="user")
	private List<ViewHistory> viewhistory;

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return this.Address;
	}

	public void setAddress(String address) {
		this.Address = address;
	}

	public Date getDateOfBirth() {
		return this.dateofbirth;
	}

	public void setDateOfBirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getgender() {
		return this.gender;
	}

	public void setgender(String gender) {
		this.gender = gender;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getZipcode() {
		return this.zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setUser(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setUser(null);

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
		timer.setUser(this);

		return timer;
	}

	public Timer removeTimer(Timer timer) {
		getTimers().remove(timer);
		timer.setUser(null);

		return timer;
	}
	
	public List<ViewHistory> getViewhistory() {
		return this.viewhistory;
	}

	public void setViewhistory(List<ViewHistory> viewhistory) {
		this.viewhistory = viewhistory;
	}
	
	public ViewHistory addViewHistory(ViewHistory viewhistory) {
		getViewhistory().add(viewhistory);
		viewhistory.setUser(this);

		return viewhistory;
	}

	public ViewHistory removeViewHistory(ViewHistory viewhistory) {
		getViewhistory().remove(viewhistory);
		viewhistory.setUser(null);

		return viewhistory;
	}
	
	
	public User(String username, String password, String firstname,
			String lastname, Date dateOfBirth, String email,
			String address, String zipcode, String gender) {
		super();
		Address = address;
		dateofbirth = dateOfBirth;
		this.email = email;
		this.firstname = firstname;
		this.gender = gender;
		this.lastname = lastname;
		this.password = password;
		this.username = username;
		this.zipcode = zipcode;
	}



}
