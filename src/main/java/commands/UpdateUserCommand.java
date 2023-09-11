/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commands;

import business.User;
import daos.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateUserCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public UpdateUserCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String uID = request.getParameter("updateID");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String first_name = request.getParameter("firstName");
        String last_name = request.getParameter("lastName");
        System.out.println(email);
        int updateID = Integer.parseInt(uID);
        System.out.println(updateID);
        UserDao userDao = new UserDao("elibrary");
        User u = userDao.findUserById(updateID);
        u.setUsername(username);
        u.setEmail(email);
        u.setFirstName(first_name);
        u.setLastName(last_name);

        if (uID == null) {
            forwardToJsp = "error.jsp";
            String error = "your details could not be updated. Please <a href=\"updateUser.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);

        } else {
            forwardToJsp = "index.jsp";
            boolean updated = userDao.updateUser(username, email, first_name, last_name, updateID);
            User updatedUser = userDao.findUserById(updateID);
            System.out.println(updateID);
            session.setAttribute("user", updatedUser);
            String msg = "your details were successfully updated, " + u.getUsername();
            session.setAttribute("msg", msg);

        }

        return forwardToJsp;
    }
}
