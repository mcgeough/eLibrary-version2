/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package commands;

import Bcrypt.BCrypt;
import business.User;
import daos.UserDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public RegisterCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String uname = request.getParameter("username");
        System.out.println(uname);
        String pword = request.getParameter("password");
        System.out.println(pword);
        String pword2 = request.getParameter("password2");
        System.out.println(pword2);
        String mail = request.getParameter("email");
        System.out.println(mail);
        String first = request.getParameter("firstName");
        System.out.println(first);
        String last = request.getParameter("lastName");
        System.out.println(last);
        String dob = request.getParameter("dob");
        System.out.println(dob);
        String hashed_password = BCrypt.hashpw(pword, BCrypt.gensalt(12)); // 12 log rounds of complexity
        boolean verify_password = BCrypt.checkpw(pword, hashed_password);
        System.out.println(verify_password);
        UserDao userDao = new UserDao("elibrary");
        User valid_user = userDao.findUserByUsername(uname,hashed_password);

        if (uname != null && pword != null && !uname.isEmpty() && !pword.isEmpty() && first != null && !first.isEmpty() && last != null && !last.isEmpty() && verify_password == true && pword.contentEquals(pword2) && valid_user == null) {

            int id = userDao.addUser(uname, hashed_password, mail, first, last, dob, 0);
            if (id == -1) {
                forwardToJsp = "error.jsp";
                String error = "This user could not be added. Please <a href=\"register.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else {
                forwardToJsp = "index.jsp";
                session.setAttribute("username", uname);
                User u = new User(id, uname, hashed_password, mail, first, last, dob, 0);
                session.setAttribute("user", u);
                String msg = "Registration successful, " + uname + ", you are now logged in!";
                session.setAttribute("msg", msg);
            }
        } else {
            forwardToJsp = "error.jsp";
            String error = "Some information was not supplied. Please <a href=\"register.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }
}
