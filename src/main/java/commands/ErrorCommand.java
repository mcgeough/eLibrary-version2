/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class ErrorCommand implements Command{

    private String error;
    private HttpServletRequest request;

    public ErrorCommand(String error, HttpServletRequest request) {
        this.error = error;
        this.request = request;
    }
    
    @Override
    public String execute() {
        HttpSession session = request.getSession(true);
        String forwardToJsp = "error.jsp";
        error = "No such action defined for this application. Please try again.";
        session.setAttribute("errorMessage", error);
        return forwardToJsp;
    }
    
}
