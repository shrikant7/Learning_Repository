package UTIL;

public class User {
	private int UID;
	private String name,email,type,department;
	public User(int uid,String name,String email,String type,String department){
		this.UID=uid;
		this.name=name;
		this.email=email;
		this.type=type;
		this.department=department;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
}
