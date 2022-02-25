package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {

			// add category

			// fetching category data
			String title = request.getParameter("catTitle");
			String description = request.getParameter("catDescription");

			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			// category database save
			CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
			int catId = categorydao.saveCategory(category);
			out.println("Category saved.");
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Category added successfully: " + catId);
			response.sendRedirect("admin.jsp");
			return;
		} else if (op.trim().equals("addproduct")) {

			// add product
			String pName = request.getParameter("pName");
			String pDesc = request.getParameter("pDesc");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("pPic");

			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDesc);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());

			// get category by id

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			Category category = cdao.getCategoryById(catId);

			p.setCategory(category);
			// product save
			ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			pdao.saveProduct(p);

			// Pic upload find out the path to upload photo

			String path = request.getRealPath("img") + File.separator + "products" + File.pathSeparator
					+ part.getSubmittedFileName();
			System.out.println(path);

			// uploading code..
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = part.getInputStream();

			// reading data

			byte[] data = new byte[is.available()];
			is.read(data);
//
//
//	//writing the data
			fos.write(data);
			fos.close();
			out.println("Product save success..");
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Product added successfully: " + catId);
			response.sendRedirect("admin.jsp");
			return;

		}
	}

}
