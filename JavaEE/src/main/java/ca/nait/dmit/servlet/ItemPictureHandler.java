package ca.nait.dmit.servlet;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.nait.dmit.domain.Item;
import ca.nait.dmit.service.ItemService;


@WebServlet("/ItemPictureHandler")
public class ItemPictureHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private ItemService itemService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idString = request.getParameter("itemId");
		if(idString != null) {
			Long id = Long.valueOf(idString);
			Item item = itemService.findByItemId(id);
			if(item != null) {
				response.setContentType("image");
				response.getOutputStream().write(item.getItemImageFile());
			}
		}
	}
	
}
