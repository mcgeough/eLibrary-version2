<%@page import="business.Cart"%>
<%@page import="business.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.BookDao"%>
<%@page import="business.User"%>
<l<link href="style.css"  type="text/css" rel="stylesheet"   />
<!doctype html>
<html lang="en">
    <head>
        <!-- reference for an image used.. mcgeough.. <a href="https://www.freepnglogos.com/pics/openclipart">Openclipart from freepnglogos.com</a> -->
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/landing.css">
        <link rel="stylesheet" href="css/responsive.css">
        <title>eLibrary</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("user");
            BookDao bookDao = new BookDao("elibrary");
            ArrayList<Book> books = (ArrayList<Book>) bookDao.getAllBooks();
            if (u != null) {
                String msg = (String) session.getAttribute("msg");
                System.out.println(books.toString());
                Cart c = new Cart(u, null);
                if (msg != null) {
                    out.println("<div style=text-white>" + msg + "</div>");
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
                            </ul>
                        </div>
                        <!-- tabs -->
                        <div class="elibrary-nav">
                            <section>
                                <a href="index.jsp" style="color: #fff">Home |</a>
                                <a href="viewBooks.jsp" style="color: #fff">Books</a>
                                <a href="userDetails.jsp?id"><i class="bi bi-person-square"></i></a>
                            </section>
                        </div>
                        <div style="color: #fff">Welcome <%=u.getUsername()%> !</div>
                        <a href="controller?action=logout" class="logout">Logout</a>
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


        <!-- contents -->
        <div class="">
            <section class="elibrary-home-video">
                <div class="top"></div>
                <div class="bottom"></div>
                <video src="css/images/showcase.mp4" autoplay muted loop></video>
                <div class="content">
                    <section class="left">
                        <img src="css/images/begin.png" alt="">
                        <div class="mt-2 d-flex">
                            <a href="viewBooks.jsp" class="btn btn-secondary m-2"><i class="bi bi-book" style="padding: 0px;" ></i>   Browse Books</a>
                        </div>
                    </section>
                </div>
            </section>

        </div>
        <!-- contents end-->


        <p class="text-white"><b> Trending </b></p>
        <%for (Book b : books) {%>
        <form action="controller" method="post"
              <div class="slider-1 card" style="width: 13rem; max-height: 50px">
            <div class="slider-1 card" style="width: 13rem;display: inline-block">
            <img class="card-img-top" src="data:image/jpeg;base64,<%=b.getImage()%>"alt="Card image cap">
            <div class="card-body">
                <h5 class="text-white card-title"><%=b.getTitle()%></h5>
                <p class="text-white card-text"><%=b.getPrice()%></p>
                <div class="d-flex justify-content-between align-items-center">
                    <a href="#" class="btn btn-primary">/10</a>
                    <a href="controller?action=addToCart" class="btn btn-primary"><i class="bi bi-cart3"></i></a>
                </div>
                <a href="userDetails.jsp"><h5 class="text-white review-count">12 Reviews</h5></a>
            </div>
            </div>
        </div>
                
        </form>

        <%}%>


        <!-- footer -->
        <div class="container footer">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="row">
                        <div class="col-md-3">
                            <ul>
                                <li>Audiobooks</li>
                                <li>Media</li>
                                <li>Privacy</li>
                                <li>Contact Us</li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <ul>
                                <li>Authors Rights</li>
                                <li>Investors</li>
                                <li>Terms</li>
                                <li>Notice</li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <ul>
                                <li>Help Centre</li>
                                <li>Careers</li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <ul>
                                <li>Organisation</li>
                                <li>Subscriptions</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-10 mx-auto">
                    <div class="col-12">
                        <p class="copyright">@eLibrary powered by <b style="color: #fff">Bootstrap</b></p>
                    </div>
                </div>
            </div>

        </div>
        <!-- footer end-->
        <!-- my js file -->
        <script src="js/javascript.js"></script>
        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
        <%
        } else {
        %>
        <div class="text-white">Sorry, this page is only for logged-in users. Please <a href="login.jsp">login</a> to continue.
            <%
                }
            %>
    </body>
</html>