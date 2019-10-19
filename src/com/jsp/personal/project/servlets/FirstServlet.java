package com.jsp.personal.project.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.personal.project.models.Student;

public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 3246978073711673749L;
	
	Student student = new Student(23l, "Jalaludding");
	String[] countries = {"Afghanistan", "India", "Iran", "Japan", "China"};
	
	/*
	 * The life cycle of a servlet: When a request is made, the web container takes
	 * the Http request and response objects, convert them to Java object, and then,
	 * based the on the url mapping creates the appropriate servlet using the no-arg
	 * constructor and and passes the objects to it. at this the time the init
	 * method of the servlet is called and make ready for serving. After that the
	 * service method is called. The init method is called only one throughout the
	 * life cycle of the a servlet. The service method is called after each request.
	 * The destroy method is called when the server refreshes or restarts.
	 * In order to enable handling multiple requests, the create create a separate thread for each request and response.
	 */

	public FirstServlet() {
		super();
		System.out.println("Inside the no-arg constructor");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
//		PrintWriter writer = resp.getWriter();
//		writer.println("Welcome " + firstname + " " + lastname);

//		resp.sendRedirect("test.html");
		req.setAttribute("firstname", firstname);
		req.setAttribute("lastname", lastname);
		req.setAttribute("student", student);
		req.setAttribute("countries", countries);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/output.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("Inside the init method of the servlet");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.service(req, resp);
		System.out.println("Inside the service method of the servlet");
	}

	@Override
	public void destroy() {
		super.destroy();
		System.out.println("Inside the destroy method of the servlet. to test this, bring some changes to the code and"
				+ " while the server is running");
	}
}
