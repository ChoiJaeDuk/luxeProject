package luxe.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionChecFilter
 */
@WebFilter("/front")
public class SessionCheckFilter implements Filter {

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		String key = request.getParameter("key");
	
		System.out.println(key);

		if(key==null || key.equals("bid") || key.equals("sell") || key.equals("wishList") || key.equals("goods")) {
			
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			if(session.getAttribute("userId") == null) {
				req.setAttribute("errorMsg", "로그인하고 이용해주세요.");
				req.getRequestDispatcher("error/error.jsp").forward(request, response);
				return; 
			}
		}
		
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
