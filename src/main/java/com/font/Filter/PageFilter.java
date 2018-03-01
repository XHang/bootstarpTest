package com.font.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class PageFilter
 */
@WebFilter("*.html")
public class PageFilter implements Filter {

    public PageFilter() {
    }

	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse httpresponse = (HttpServletResponse)response;
		//允许过滤器过滤的页面作为ifram引入到其他页面中，只要将值改为deny，parent.html页面就取不到child页面的信息了
		httpresponse.setHeader("X-Frame-Options", "SAMEORIGIN");
		chain.doFilter(request, httpresponse);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
