package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		// coding area

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		//validations

		//authenticating user
	UserDao userDao=	new UserDao(FactoryProvider.getFactory());
	User user=userDao.getUserByEmailAndPassword(email, password);
	System.out.println(user);
	HttpSession httpsession=request.getSession();


	if(user==null) {
		out.println("<h1>Invalid details</h1>");
		httpsession.setAttribute("message","Invalid Details!! Try with another one ");
		response.sendRedirect("login.jsp");
		return;

	}
	else {
		out.println("<h1>Welcome "+user.getUserName()+" </h1>");

	}

	//login
	httpsession.setAttribute("current-user", user);
	if(user.getUserType().equals("admin")) {
		//admin:admin.jsp
		response.sendRedirect("admin.jsp");
	}
	else if(user.getUserType().equals("normal")) {
		response.sendRedirect("home.jsp");
	}
	else {
		out.println("We have not identified user type");
	}
	}

}
