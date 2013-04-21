package co.apps4u.gis.moon;

import java.nio.ByteBuffer;
import java.util.concurrent.ConcurrentLinkedQueue;

import org.eclipse.jetty.util.log.Log;
import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketClose;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketConnect;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketMessage;
import org.eclipse.jetty.websocket.api.annotations.WebSocket;

@WebSocket()//maxMessageSize = 64 * 1024)
public class EchoBean
{
	 private static final ConcurrentLinkedQueue<EchoBean> BROADCAST = new ConcurrentLinkedQueue<EchoBean>();

	    protected Session session;

	    @OnWebSocketMessage
	    public void onBinary(byte buf[], int offset, int len)
	    {
	    	Log.getLog().info("Binary message ");
	        ByteBuffer data = ByteBuffer.wrap(buf,offset,len);
	        for (EchoBean sock : BROADCAST)
	        {
	            sock.session.getRemote().sendBytesByFuture(data.slice());
	        }
	    }

	    @OnWebSocketClose
	    public void onClose(int statusCode, String reason)
	    {
	        BROADCAST.remove(this);
	    }

	    @OnWebSocketConnect
	    public void onOpen(Session session)
	    {
	    	Log.getLog().info("Connect "+session);
	        this.session = session;
	        BROADCAST.add(this);
	    }

	    @OnWebSocketMessage
	    public void onText(String text)
	    {	    	
	    	Log.getLog().info("Message received "+text);
	        for (EchoBean sock : BROADCAST)
	        {
	            sock.session.getRemote().sendStringByFuture(text);
	        }
	    }
//	 @OnWebSocketConnect
//	    public void onConnect(Session sess)
//	    {
//		 
//		 Log.info("Connect "+sess);
//	    }
//
//	    @OnWebSocketError
//	    public void onError(Throwable cause)
//	    {
//	    	Log.warn("Websocket Error ",cause);
//	    }
//	    
//    @OnWebSocketMessage
//    public void onText(WebSocketServerConnection conn, String message)
//    {
//    	Log.info("Message received "+message);
//    	
//    	EndPoint endpoint = conn.getEndPoint();
//    	FutureCallback future = new FutureCallback();
//    	 endpoint.write(future,"ContextObj");
//    	 String context = (String)future.get(); // This blocks
////        if (conn.isOpen())
////        {
////            return;
////        }
////        try
////        {
////        	//conn.write(null,new FutureCallback(),message);
////        }
////        catch (IOException e)
////        {
////            e.printStackTrace();
////        }
//    }
}