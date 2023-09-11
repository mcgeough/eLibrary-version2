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
        <title>eLibrary</title>
    </head>
    <body>       
        <div class="login-top">
            <img src="css/images/logo.png" alt="alt"/>
        </div>

        <div class="d-flex justify-content-center align-items-center" style="width: 100vw;">
            <section class="login-box">
                <h2 class="text-white">Sign In</h2>
                <form class="mt-4" action="controller" method="post">
                    <div class="mb-3 bg-white rounded px-2">
                        <label class="form-label small-text">Username</label>
                        <input type="username" class="form-control border-0 p-0" name="username" required>
                    </div>
                    <div class="mb-3 bg-white rounded px-2">
                        <label class="form-label small-text">Password</label>
                        <input type="password" class="form-control border-0 p-0" name="password" required">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-danger mt-3" style="width: 100%">Sign In</button>
                        <input type="hidden" name= "action" value="login"/>
                    </div>
                    <div class="mb-3 mt-3 form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label text-white small-text" for="exampleCheck1">Remember me</label>
                    </div>
                    <a class="forgot_password 
                       " href="#!">Forgot password?</a>

                    <div class="mt-3 d-flex">
                        <img width="20px" src="css/images/fb.png" alt="alt"/>
                        <p class="m-0 small-text text-white"> Login with Facebook</p>
                    </div>
                    <div class="d-flex align-items-center justify-content-center"style="padding-top: 30px;">
                        <p class="mb-0 me-2 text-white">New here?
                            <button type="button"  onclick="window.location.href = 'register.jsp';"class="btn btn-danger btn-sm">Register</button>
                        </p>
                    </div>
                </form>
            </section>
        </div>

        <%
            User u = (User) session.getAttribute("user");

            if (u == null) {
                String msg = (String) session.getAttribute("msg");
                if (msg != null) {

                    out.println("<div class='text-white'>" + msg + "</div>");
                    session.removeAttribute("msg");
                }
        %>
        <%
        } else {
        %>
        <div class="text-white">Please login to continue.
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