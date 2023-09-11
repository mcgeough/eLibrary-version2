/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commands;

import daos.BookDao;
import daos.UserDao;    
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteBookCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public DeleteBookCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        BookDao bookDao = new BookDao("elibrary");
        String bID = request.getParameter("deleteBook");
        int bookID = Integer.parseInt(bID);
        Boolean isDeleted = false;
        System.out.println(bID);
        isDeleted = bookDao.deleteBook(bookID);
        System.out.println(isDeleted);

        if (isDeleted == false) {
            forwardToJsp = "error.jsp";
            String error = "This book could not be deleted. Please <a href=\"adminBook.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        } else {
            forwardToJsp = "adminIndex.jsp";
            String msg = "Book deleted successfully.";
            session.setAttribute("msg", msg);
        }
        return forwardToJsp;
    }
}
