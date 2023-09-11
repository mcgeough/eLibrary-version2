package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandFactory {

    public Command createCommand(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        Command c = null;
        if (action != null) {
            switch (action) {
                case "login":
                    c = new LoginCommand(request, response);
                    break;
                case "register":
                    c = new RegisterCommand(request, response);
                    break;
                case "logout":
                    c = new LogoutCommand(request, response);
                    break;
                case "addUser":
                    c = new AddUserCommand(request, response);
                    break;
                case "deleteUser":
                    c = new DeleteUserCommand(request, response);
                    break;
                case "updateUser":
                    c = new UpdateUserCommand(request, response);
                    break;
                case "addToCart":
                    c = new UpdateUserCommand(request, response);
                    break;

                default:
                    String error = "No such action defined for this application. Please try again.";
                    c = new ErrorCommand(error, request);
            }
        } else {
            String error = "No action supplied. Please try again.";
            c = new ErrorCommand(error, request);
        }

        return c;
    }
}
