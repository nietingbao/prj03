package userpackage;

public class Schedual {
	private String username;
	private String password;
	private String date;
	private String arrange;
	String month=null;
	public Schedual(String date,String arrange,String username,String password){
		setDate(date);
		setArrange(arrange);
		setUsername(username);
		setPassword(password);
	}
	

	public Schedual(String username,String password){
		setUsername(username);
		setPassword(password);
	}
	
	
	public void setDate(String date){
		this.date = date;
	}
	public String getDate(){
		return date;
	}
	public void setArrange(String arrange){
		this.arrange = arrange;
	}
	public String getArrange(){
		return arrange;
	}
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getMonth(String date){
		int x;
		x = month.indexOf(".");
		month = month.substring(0,x);
		return month;
	}
}
