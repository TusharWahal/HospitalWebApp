package controller.loginSignUp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import model.bean.MedicalReport;
import model.bean.Medicine;
import model.bean.Person;
import model.bl.DoctorBusinessLogic;
import model.bl.PersonBusinessLogic;

/**
 * Servlet implementation class SignUpController
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Logger logger=Logger.getLogger(SignUpController.class);
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String personId=request.getParameter("personId");
		String personIdType=request.getParameter("personIdType");
		String personName=request.getParameter("patientName");
		String DateOfBirthString=(request.getParameter("personDateOfBirth"));
		SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
		Date personDateOfBirth=java.sql.Date.valueOf(DateOfBirthString);			//check
		int personAge=Integer.parseInt(request.getParameter("personAge"));
		String personGender=request.getParameter("radio");
		String personAddress=request.getParameter("personAddress");
		Long personPhoneNo=Long.parseLong(request.getParameter("personPhoneNo"));
		String personPassword=request.getParameter("personPassword");
		
		Person newPerson = new Person();
		newPerson.setPersonAddress(personAddress);
		newPerson.setPersonAge(personAge);
		newPerson.setPersonDateOfBirth(personDateOfBirth);
		newPerson.setPersonGender(personGender);
		newPerson.setPersonId(personId);
		newPerson.setPersonIdType(personIdType);
		newPerson.setPersonName(personName);
		newPerson.setPersonPassword(personPassword);
		newPerson.setPersonPhoneNo(personPhoneNo);
		
		PersonBusinessLogic pbl = new PersonBusinessLogic();
		boolean result=false;
		try {
			try {
				result=pbl.personSignUp(newPerson);
				BasicConfigurator.configure();
		 	    logger.info("Signing up!!");
		 	   request.setAttribute("newPerson", newPerson);
				
			    RequestDispatcher rd = getServletContext().getRequestDispatcher("/personlogin.jsp");
			    rd.forward(request, response);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			
			PrintWriter out=response.getWriter();
			 out.println("<script type=\"text/javascript\">");  
			 out.println("alert('SignUp Failed !!!');");
			 out.println("location='./signup.jsp';");
			 out.println("</script>");		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
