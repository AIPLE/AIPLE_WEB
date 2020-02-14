package memberControl;

import beans.*;
import secret.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

/**
 * @see 사용자의 비밀번호를 전달 받을때 반드시 memberControl.PBKDF2_Encryption를 임포트하여 createHash(사용자입력) 함수를 실행한 리턴값을 저장 한다. 
 * 이후 비밀번호 검증(비밀번호가 사용자가 쓴거와 db와 맞는지)는 validatePassword(사용자 입력, db값) 함수를 이용하여 검증한다.
 * @author devstar1224
 *
 */

public class MemberMgr {
	
	//사용자저장 테이블 이름정의.
    private final String MEMBER_TABLE = "member"; 
    
    private DBConnectionMgr pool = null;

    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    
    public boolean loginCheck(LoginBean loginData) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = pool.getConnection();
            String strQuery = "select passwd from " + MEMBER_TABLE + " where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, loginData.getId());
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	/**
            	 * PBKDF2_Encryption.validatePassword 함수를통해 비밀번호를 검증 및 결과 리턴.
            	 * @author devstar1224
            	 */
            	String hashData = rs.getString("passwd");
            	if(PBKDF2_Encryption.validatePassword(loginData.getPassword(), hashData)){
            		loginData = null;
            		return true;
            	}
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return false;
    }
    
    public boolean memberInsert(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        SimpleDateFormat timeFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
        java.util.Date time = new java.util.Date();
        try {
            con = pool.getConnection();
            // id, password, name nickname, email, time 순서
            String strQuery = "insert into " + MEMBER_TABLE + " values(?,?,?,?,?,?)"; 
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getId());
            pstmt.setString(2, regBean.getPassword());
            pstmt.setString(3, regBean.getName());
            pstmt.setString(4, regBean.getNickname());
            pstmt.setString(5, regBean.getEmail());
            pstmt.setString(6, timeFormat.format(time));
            int count = pstmt.executeUpdate();
            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
}
