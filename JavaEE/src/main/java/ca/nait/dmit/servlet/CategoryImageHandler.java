package ca.nait.dmit.servlet;

import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ca.nait.dmit.domain.Category;
import ca.nait.dmit.service.CategoryService;

@WebServlet("/categoryImageHandler" )
public class CategoryImageHandler extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	@Inject
	private CategoryService CategoryService;
	
    public CategoryImageHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String categoryIdString = request.getParameter("categoryId");
		
		if (categoryIdString != null) {
			
		try {
			
			Short categoryId = Short.valueOf(categoryIdString);
			
			Category category = CategoryService.findByCategoryId(categoryId);
			
			if (category != null) {
				
				response.setContentType("image");
				response.getOutputStream().write(category.getCategoryImageFile());
				
				}
			
			} catch (Exception e) {
				
				response.getWriter().write(e.getMessage());
				
			}
		}	
	}
}