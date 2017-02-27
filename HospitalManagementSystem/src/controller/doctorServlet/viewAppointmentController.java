package controller.doctorServlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Appointment;
import model.bl.DoctorBusinessLogic;

public class viewAppointmentController extends HttpServlet {
	private static final long serialVersionUID = 2L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		ArrayList<Appointment> appList=new ArrayList<Appointment>();
		String doctorId=request.getParameter("doctorId");
		DoctorBusinessLogic dbl=new DoctorBusinessLogic();
		try {
			try {
				appList=dbl.myAppointments(doctorId);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 request.setAttribute("appList", appList);
		
		    RequestDispatcher rd = getServletContext().getRequestDispatcher("/viewAppointment.jsp");
		    rd.forward(request, response);
		if(request.getParameter("doctorId")==null){
			String message="Doctor not found";
			session.setAttribute("message", message);
			response.sendRedirect("output.jsp");
		}
}

		


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
