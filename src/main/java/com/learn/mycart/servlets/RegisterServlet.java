package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(name="RegisterServlet" , urlPatterns= {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()) {
//			out.println("<DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>Servlet RegisterServlet</title>");
//			out.println("</head>");
//			out.println("<body>");
//			out.println("<h1> Servlet RegisterServlet at "+request.getContentType()+ " </h1>");
//			out.println("<DOCTYPE html>");
//			out.println("<DOCTYPE html>");
			try {
				String userName=request.getParameter("user_name");
				String userEmail=request.getParameter("user_email");
				String userPassword=request.getParameter("user_password");
				String userPhone=request.getParameter("user_phone");
				String userAddress=request.getParameter("user_address");

				//validation
				if(userName.isEmpty()) {
					out.println("Name is blank");
					return;
				}
				//creating user object to store data

				User user=new User(userName,userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");

				Session hibernateSession=FactoryProvider.getFactory().openSession();
				Transaction tx=hibernateSession.beginTransaction();

				int userId=(int)hibernateSession.save(user);

				out.println("successfully saved");
				out.println("<br> User id is: "+userId);

				tx.commit();
				hibernateSession.close();


				HttpSession httpsession=request.getSession();
				httpsession.setAttribute("message","Registration Successful!! "+ "user id is: "+userId);
				response.sendRedirect("register.jsp");
				return;
			}
			catch(Exception e) {

				e.printStackTrace();
			}

		}

	}

}
