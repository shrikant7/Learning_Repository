package UTIL;

public class Student extends User {
	private String roll;
	public Student(int uid,String name,String email,String type,String department,String roll){
		super(uid, name, email, type, department);
		this.setRoll(roll);
	}
	public String getRoll() {
		return roll;
	}
	public void setRoll(String roll) {
		this.roll = roll;
	}
}
