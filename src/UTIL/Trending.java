package UTIL;

public class Trending {
	private int TID,LID;private String lname;
	public Trending(int t,int l,String n) {
		setTID(t);setLID(l);setLname(n);
	}
	public int getTID() {
		return TID;
	}
	public void setTID(int tID) {
		TID = tID;
	}
	public int getLID() {
		return LID;
	}
	public void setLID(int lID) {
		LID = lID;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
}
