package org.model;

import java.util.Date;

public class NovelInfo {
	private int id;
	private String title;
	private String context;
	private Date createdTime;
	private int genreId;
	private String genreName;
	private int voteNumber;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public int getVoteNumber() {
		return voteNumber;
	}
	public void setVoteNumber(int voteNumber) {
		this.voteNumber = voteNumber;
	}
	
	
}
