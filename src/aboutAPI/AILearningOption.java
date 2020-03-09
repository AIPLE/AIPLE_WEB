package aboutAPI;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.UUID;

import beans.AILearningOptionBean;
import secret.DBConnectionMgr;

public class AILearningOption {
	//사용자저장 테이블 이름정의.
    private DBConnectionMgr pool = null;
    public AILearningOption() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
	public boolean optionSetting(UUID UID, AILearningOptionBean options) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into API_Data values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, UID.toString());
            pstmt.setString(2, "");       
            pstmt.setString(3, options.getInputSize().toString());       
            pstmt.setString(4, options.getHiddenSize());       
            pstmt.setString(5, options.getOutputSize().toString());       
            pstmt.setString(6, options.getActivation());       
            pstmt.setString(7, options.getWeightDecayLambda().toString());       
            pstmt.setString(8, options.getDropout().toString());       
            pstmt.setString(9, options.getDropoutRation().toString());       
            pstmt.setString(10, options.getBatchNorm().toString());      
            pstmt.setString(11, options.getEpoch().toString());      
            pstmt.setString(12, options.getMiniDatchSize().toString());      
            pstmt.setString(13, options.getOptimizer());      
            pstmt.setString(14, options.getOptimizerParam().toString());      
            pstmt.setString(15, options.getInitStdType());      
            pstmt.setString(16, options.getInitStdValue().toString());      
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
