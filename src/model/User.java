package model;

public class User {

	private Integer id;
	private String name;
	private String selfdescn;
	private String speak;
	private String password;
	private String Phonenumber;
<<<<<<< HEAD
	private String backPassTip;

	public String getBackPassTip() {
		return backPassTip;
	}

	public void setBackPassTip(String backPassTip) {
		this.backPassTip = backPassTip;
	}
=======
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522

	public String getPhonenumber() {
		return Phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.Phonenumber = phonenumber;
	}

	public User() {
	}

	public User(Integer id, String name,String selfdescn,String speak,String password) {
		this.id=id;
		this.name=name;
		this.selfdescn=selfdescn;
		this.speak=speak;
		this.password=password;
	}
	
	public User(Integer id, String name) {
		this.id=id;
		this.name=name;	
	}
	
	
	public User(Integer id, String name,String speak) {
		this.id=id;
		this.name=name;	
		this.speak=speak;
	}
	
	
	
	
	
	public User(Integer id) {
		this.id=id;
	
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSelfdescn() {
		return selfdescn;
	}
	public void setSelfdescn(String selfdescn) {
		this.selfdescn = selfdescn;
	}
	public String getSpeak() {
		return speak;
	}
	public void setSpeak(String speak) {
		this.speak = speak;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
<<<<<<< HEAD


=======
	
	
	
	
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
}
