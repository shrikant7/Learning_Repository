package UTIL;

import java.util.ArrayList;

public class Navigation {
	private String course;
	private int courseID;
	private ArrayList<Pair> topics=null;
	public Navigation(int id,String c,ArrayList<Pair> t){
		setCourseID(id);
		setCourse(c);
		setTopics(t);
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public ArrayList<Pair> getTopics() {
		return topics;
	}
	public void setTopics(ArrayList<Pair> topics) {
		this.topics = topics;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	
}
