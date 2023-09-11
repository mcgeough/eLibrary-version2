/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mcgeo
 */
public class LogoutCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public LogoutCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String forwardToJsp = "login.jsp";
        String message = "You have been logged out.";
        HttpSession session = request.getSession(true);

        // This will remove ALL information in the session
        // session.invalidate();
        // This will remove ONLY the user object from the session
        session.removeAttribute("user");
        // This will remove ONLY the username
        session.removeAttribute("username");

        session.setAttribute("msg", message);
        return forwardToJsp;
    }

}
