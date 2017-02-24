package com.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Reception;
import model.bl.PersonBusinessLogic;



public class ListAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PersonBusinessLogic pb = new PersonBusinessLogic();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String personId=request.getParameter("personId");
		ArrayList<Reception> receptionList = pb.myAppointments(personId);
		
		if(receptionList.size()==0)
		{
			RequestDispatcher dispatch=request.getRequestDispatcher("ErrorPage.jsp");
			dispatch.forward(request, response);
		}
		else 
		{
		
			RequestDispatcher dispatch=request.getRequestDispatcher("listAppointments.jsp");
			request.setAttribute("list", receptionList);
			dispatch.forward(request, response);
		}
		
		HttpSession session=request.getSession();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}