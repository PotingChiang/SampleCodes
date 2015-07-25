package ca.nait.dmit.servlet;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.nait.dmit.domain.UserRegister;
import ca.nait.dmit.service.UserRegisterService;


/**
 * Servlet implementation class ValidationServlet
 */
@WebServlet(name = "validationServlet", urlPatterns = { "/validationServlet" })
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Inject
	private UserRegisterService userRegisterService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
//		response.getWriter().println("Thank you for validating " + email +"!");
//		response.getWriter().println("Your acount is now enabled, please close this window and start using the application.");
		response.sendRedirect("http://localhost:8080/dmit2015-finalproject/pages/mLogin.jsf?faces-redirect=true&fbm=" + email + " is Activated."
								+ "&fem_1=Please log in to use the app. "
								+ "&fem_2=Thanks.");
		
		UserRegister activatedUser = userRegisterService.findUserByEmail(email);
		activatedUser.setEnabled(true);
		userRegisterService.updateUser(activatedUser);
		
	}

}
