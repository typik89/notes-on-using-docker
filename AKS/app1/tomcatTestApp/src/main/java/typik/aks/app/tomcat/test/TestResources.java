package typik.aks.app.tomcat.test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public class TestResources {
	
	private static List memory;	
	private static List<AtomicBoolean> flags = new CopyOnWriteArrayList<>();

	public static synchronized void addMemoryUsage(){
		if ( memory == null ){
			memory = new ArrayList();
		}
		memory.add( new Object[1000000] );
	}
	
	public static synchronized void addCpuUsage(){
		flags.add( new AtomicBoolean( true ) );
		final int index = flags.size() - 1;
		new Thread( () -> {
			while(flags.get( index ).get() ){				
			}
		} ).start();
	}
	
	public static synchronized void freeMemory(){
		memory = null;
		System.gc();
	}
	
	public static synchronized void freeCpu(){
		for ( AtomicBoolean flag : flags ){
			flag.set( false );
		}
		try {
			Thread.sleep( 5000 );
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
}
