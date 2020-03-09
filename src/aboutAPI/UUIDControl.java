package aboutAPI;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.UUID;

import secret.DBConnectionMgr;

public class UUIDControl {
	//사용자저장 테이블 이름정의.
    private DBConnectionMgr pool = null;
    public UUIDControl() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    
    /**
     * Create UUID and insert Database
     * 
     * @param	owner 	The UUID owner name
     * @return			When create successful return UID in case fail to create return false
     * @author devstar1224
     */
	public Object createUUID(String owner) {
		UUID UID = UUID.randomUUID();
		if(insertUUID(UID, owner)) {
			return UID;
		}
		return false;
	}
	
	private boolean insertUUID(UUID UID, String owner) {
		if(owner.equals("")) { //sql 에서 notnull 처리가 되도록 빈칸이면 오류발생하도록 처리
			owner = null;
		}
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        SimpleDateFormat timeFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
        java.util.Date time = new java.util.Date();
        try {
            con = pool.getConnection();
            // id, password, name nickname, email, time 순서
            String strQuery = "insert into API_FolderUUID values(?,json_object(?,?,?,?),?)"; 
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, UID.toString());
            
            //JSON 입력은 여기부터
            pstmt.setString(2, "date");
            pstmt.setString(3, time.toString());
            pstmt.setString(4, "data");
            pstmt.setString(5, "");
            // 여기까지 
         
            pstmt.setString(6, owner);
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
