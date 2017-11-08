package UTIL;

public class DiscussionStore {
	private String name,comment;
	public DiscussionStore(String s,String c){
		setName(s);setComment(c);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
