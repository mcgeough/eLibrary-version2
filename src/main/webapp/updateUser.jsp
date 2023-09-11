<%@page import="business.User"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/landing.css">
        <title>Register Today</title>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("user");

            if (u != null) {
                String msg = (String) session.getAttribute("msg");
                if (msg != null) {

                    out.println("<div class='text-white'>" + msg + "</div>");
                    session.removeAttribute("msg");
                }
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
                                <li><a class="dropdown-item" href="#">My List</a></li>
                            </ul>
                        </div>
                        <!-- tabs -->
                        <div class="elibrary-nav">
                            <section>
                                <a href="index.jsp" style="color: #fff">Home |</a>
                                <a href="viewBooks.jsp" style="color: #fff">Books |</a>
                                <a href="viewBooks.jsp" style="color: #fff">My List</a>
                                <a href="userDetails.jsp"><i class="bi bi-person-square"></i></a>
                            </section>
                        </div>
                        <div style="color: #fff">Welcome <%=u.getUsername()%> !</div>
                    </section>
                    <!-- right -->
                    <section class="right d-flex align-items-center">
                        <div class="elibrary-profile">
                            <i class="bi bi-search"></i>
                            <i class="bi bi-cart"></i>
                        </div>
                    </section>
                </div>
            </div>
        </nav>
        <!-- navbar end -->

        <div class="d-flex justify-content-center align-items-center" style="width: 100vw;padding-top: 200px">
            <section class="register-box">
                <h5 class="text-white"> Update Details</h5>
                <form class="mt-10" action="controller" method="post">
                    <div class="col-md-14 text-white">
                        <label for="exampleInputEmail1" class="form-label small-text">Username</label>
                        <input type="username" class="form-control border-0 p-0" name="username" placeholder="<%=u.getUsername()%>" required>
                    </div>  
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Email</label>
                        <input type="email" class="form-control border-0 p-0"name="email" placeholder="<%=u.getEmail()%>" required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">First Name</label>
                        <input type="firstname" class="form-control border-0 p-0" name="firstName" placeholder="<%=u.getFirstName()%>"  required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Last Name</label>
                        <input type="lastname" class="form-control border-0 p-0" name="lastName" placeholder="<%=u.getLastName()%>" required>
                    </div>
                    <input type='hidden' name='action' value='updateUser'/>    
                    <input type='hidden' name='updateID' value='<%=u.getId()%>'/> 
                    <input type="submit" class="btn btn-primary" value="Save"/>
                </form>


            </section>
        </div>
        <%
        } else {
        %>
        <div class="text-white">Please register to continue.
            <%
                }
            %>

            <!-- Optional JavaScript; choose one of the two! -->

            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

            <!-- Option 2: Separate Popper and Bootstrap JS -->
            <!--
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
            -->
    </body>
</html>