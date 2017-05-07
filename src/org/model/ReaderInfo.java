package org.model;


public class ReaderInfo {
	private int id;
	private String readerName;
	private String readerPassword;
	private String readerEmail;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReaderName() {
		return readerName;
	}
	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}
	public String getReaderPassword() {
		return readerPassword;
	}
	public void setReaderPassword(String readerPassword) {
		this.readerPassword = readerPassword;
	}
	public String getReaderEmail() {
		return readerEmail;
	}
	public void setReaderEmail(String readerEmail) {
		this.readerEmail = readerEmail;
	}
}
