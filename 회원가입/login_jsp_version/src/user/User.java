package user;

public class User {
	private String UserId;
	private String password;
	private String email;

	
	public User(String userId, String password, String email) {
		super();
		this.UserId = userId;
		this.password = password;
		this.email = email;
	}
	
	public String getUserId() {
		return UserId;
	}

	@Override
	public String toString() {
		return "User [UserId=" + UserId + ", password=" + password + ", email=" + email + "]";
	}
	
	
}
