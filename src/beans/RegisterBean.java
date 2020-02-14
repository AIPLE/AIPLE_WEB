package beans;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import memberControl.*;

public class RegisterBean {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * PBKDF2로 암호화된 민감정보 리턴.
	 * 
	 * @return		String형식의 PBKDF2 리턴.
	 */
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		/**
		 * @see 민감정보취급 함수, 정보 PBKDF2로 암호화 
		 * @author devstar1224
		 */
		try {
			this.password = PBKDF2_Encryption.createHash(password);
			password=null;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

}
