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
        <title>Register Today</title>
    </head>
    <body>
        <div class="login-top">
            <img src="css/images/logo.png" alt="alt"/>
        </div>

        <div class="d-flex justify-content-center align-items-center" style="width: 100vw;">
            <section class="register-box">
                <h5 class="text-white">Register Today</h5>
                <form class="mt-10" action="controller" method="post">
                    <div class="col-md-14 text-white">
                        <label for="exampleInputEmail1" class="form-label small-text">Username</label>
                        <input type="username" class="form-control border-0 p-0" name="username" required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Password</label>
                        <input type="password" class="form-control border-0 p-0" name="password"  required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Repeat Password</label>
                        <input type="password" class="form-control border-0 p-0" name="password2"  required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Email</label>
                        <input type="email" class="form-control border-0 p-0"name="email" required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">First Name</label>
                        <input type="firstname" class="form-control border-0 p-0" name="firstName"  required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Last Name</label>
                        <input type="lastname" class="form-control border-0 p-0" name="lastName"  required>
                    </div>
                    <div class="col-md-14 text-white">
                        <label for="exampleInputPassword1" class="form-label small-text">Date of Birth</label>
                        <div>
                            <input type="date" class="form-control border-0 p-0" name="dob" required>

                        </div>
                    </div>
                    <button type="submit" class="btn btn-danger mt-3" style="width: 100%;">Register</button>
                    <input type="hidden" name= "action" value="register" />

                    <div class="d-flex align-items-center justify-content-center pb-4"style="padding-top: 20px;">
                        <p class="mb-0 me-2 text-white">Already have an account?
                            <button type="button"  onclick="window.location.href = 'login.jsp';"class="btn btn-danger btn-sm border-dark">Login here</button>
                        </p>
                    </div>
                </form>
            </section>
        </div>

        <%
            User u = (User) session.getAttribute("user");

            if (u != null) {
                String msg = (String) session.getAttribute("msg");
                if (msg != null) {

                    out.println("<div class='text-white'>" + msg + "</div>");
                    session.removeAttribute("msg");
                }
        %>
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