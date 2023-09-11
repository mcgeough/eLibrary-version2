/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commands;

/**
 *
 * @author mcgeo
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddBookCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public AddBookCommand(HttpServletRequest request, HttpServletResponse response) {

    }
    public String execute(){
        
        return null;
        
    }
}