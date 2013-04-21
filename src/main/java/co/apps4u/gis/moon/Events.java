package co.apps4u.gis.moon;

import java.io.IOException;
import java.util.Date;

import org.eclipse.jetty.servlets.EventSource;
 

public class Events implements EventSource {
 private static final long serialVersionUID = 1L;
 private static Events instance;
 
 static {
	 instance=new Events();
 }
 
 public static Events getInstance()
 {
	 return instance;
 }
 
 @Override
 public void onOpen(final Emitter emitter) throws IOException {
 emitter.data("new server event " + new Date().toString());
 while (true) {
 System.out.println("propagating event..");
 try {
 Thread.sleep(5000);
 emitter.data("new server event "
 + new Date().toString());
 } catch (InterruptedException e) {
 e.printStackTrace();
 }
 }
 }
 
 @Override
 public void onClose() {
 System.out.println("closed");
 }
 
}