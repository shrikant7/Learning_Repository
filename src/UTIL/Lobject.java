package UTIL;

public class Lobject {
	private int LID,rating;private String link,description,lname;
	public Lobject(int l,String name,String lk,String des,int rate) {
		setLID(l);setRating(rate);setLname(name);setLink(lk);setDescription(des);
	}
	public int getLID() {
		return LID;
	}
	public void setLID(int lID) {
		LID = lID;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
}
