package aboutAPI;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class SocketCommunicate {
	public static void sendSocketData(String uuid) {
	  try {
          System.out.println(uuid);
          //서버 접속
          Socket socket = new Socket("192.168.200.204", 6729);
          //Server에 보낼 데이터 
          BufferedWriter bufWriter = 
          new BufferedWriter( new OutputStreamWriter( socket.getOutputStream()));
          bufWriter.write(uuid);
          bufWriter.newLine();
          bufWriter.flush();

          socket.close();
          bufWriter.close();
        }
        catch( Exception e ){
          e.printStackTrace();
        }
	}
}
