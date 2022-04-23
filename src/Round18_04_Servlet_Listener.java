import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Round18_04_Servlet_Listener implements ServletContextAttributeListener, ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContextListener.super.contextDestroyed(sce);
		System.out.println("ServletContext가 초기화 되었습니다.");
		System.out.println("init context = " + sce.getServletContext());
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContextListener.super.contextInitialized(sce);
		System.out.println("ServletContext가 소멸 되었습니다.");
	}

	@Override
	public void attributeAdded(ServletContextAttributeEvent event) {
		ServletContextAttributeListener.super.attributeAdded(event);
		System.out.println("ServletContext가 추가 되었습니다.");
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent event) {
		ServletContextAttributeListener.super.attributeRemoved(event);
		System.out.println("event.getName() : " + event.getName());
		System.out.println("event.getClass() : " + event.getClass());
		System.out.println("event.getServletContext() : " + event.getServletContext());
		System.out.println(" event.getValue() : " + event.getValue());
		System.out.println("ServletContext가 삭제 되었습니다.");
	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent event) {
		ServletContextAttributeListener.super.attributeReplaced(event);
		System.out.println("ServletContext가 변경 되었습니다.");
	}

}
