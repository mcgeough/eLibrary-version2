<%@page import="business.User"%>
<%@page import="daos.UserDao"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/adminStyle.css">
        <link rel="stylesheet" href="css/landing.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>eLibrary | User Details</title>
    </head>
    <body>
        <%
            // Check if the user is currently logged in
            User admin = (User) session.getAttribute("user");
            UserDao userDao = new UserDao("elibrary");
            String cID = request.getParameter("detailsID");
            System.out.println(cID);
            User current_user = null;
            try {
                int dID = Integer.parseInt(cID);
                current_user = userDao.findUserById(dID);
            } catch (NumberFormatException ex) {
                System.out.println(ex);
            }

            if (current_user != null) {
                // If they are logged in, then continue

                // If an id was supplied
                if (current_user.getId() != -1) {
                    try {

                        // If a user matching that name is found
                        if (current_user != null) {

        %>
        <!-- navbar -->
        <nav class="navbar navbar-expand-lg elibrary-navbar elibrary-padding-left elibrary-padding-right">
            <div class="container-fluid">
                <style type="text/css">
                    .message{
                        color: yellow;
                    }
                    .logout{
                        color: yellow;
                        padding-left: 10px;
                    }
                </style> 

                <div class="elibrary-row">
                    <!-- left -->
                    <section class="left d-flex align-items-center">
                        <a class="navbar-brand" href="#"><img src="css/images/logo.png" alt=""/></a>
                        <!-- dropdown -->
                        <div class="elibrary-dropdown-box dropdown">
                            <button class="elibrary-dropdown dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                Browse
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="index.jsp">Home</a></li>
                                <li><a class="dropdown-item" href="viewBooks.jsp">Books</a></li>
                                <li><a class="dropdown-item" href="#">News and Popular</a></li>
                                <li><a class="dropdown-item" href="#">My List</a></li>
                            </ul>
                        </div>
                        <!-- tabs -->
                        <div class="elibrary-nav">
                            <section>
                                <a href="index.jsp" style="color: #fff">Home |</a>
                                <a href="viewBooks.jsp" style="color: #fff">Books |</a>
                                <a href="viewBooks.jsp" style="color: #fff">New and Popular |</a>
                                <a href="viewBooks.jsp" style="color: #fff">My List</a>
                                <a href="userDetails.jsp"><i class="bi bi-person-square"></i></a>
                            </section>
                        </div>
                        <div style="color: #fff">Welcome <%=admin.getUsername()%> !</div>
                        <a href="controller?action=logout" class="logout">Logout</a>
                    </section>
                </div>
            </div>
        </nav>
        <!-- navbar end -->

        <h3 style="padding-top: 25px;padding-left: 25px;padding-bottom: 10px;">user ELIB009<%=current_user.getId()%> details:</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">USERNAME</th>
                    <th scope="col">FIRST NAME</th>
                    <th scope="col">LAST NAME</th>
                    <th scope="col">DOB</th>
                    <th scope="col">EMAIL</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row"><%=current_user.getId()%></th>
                    <td><%=current_user.getUsername()%></td>
                    <td><%=current_user.getFirstName()%></td>
                    <td><%=current_user.getLastName()%></td>
                    <td><%=current_user.getDob()%></td>
                    <td><%=current_user.getEmail()%></td>
                    <td><a class="btn btn-primary btn-sm" href="controller?action=toggleAdmin?detailsID=<%=current_user.getId()%>"/>Toggle Admin Role</a></td>
                </tr>
            </tbody>
        </table>
        <%
        } else {
        %>
        <div>No matching user..</div>
        <%
                    }
                } catch (NumberFormatException e) {
                    // Handle where the value supplied was not a number

                    // Redirect the user to the error page, as there was no id supplied
                    String error = "No int supplied..";
                    session.setAttribute("errorMessage", error);
                    response.sendRedirect("error.jsp");
                }
            } else {
                // Redirect the user to the error page, as there was no id supplied
                String error = "No ID supplied";
                session.setAttribute("errorMessage", error);
                response.sendRedirect("error.jsp");
            }
        } else {
        %>
        <div>Not logged in..</div>
        <%
            }
        %>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script><!-- comment -->



        </script>
        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
    </body>
</html>