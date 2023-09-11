<%@page import="business.Book"%>
<%@page import="daos.BookDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.UserDao"%>
<%@page import="business.User"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/adminStyle.css">
        <link rel="stylesheet" href="css/responsive.css">
        <title>Admin Dashboard | eLibrary</title>
    </head>
    <%
        User u = (User) session.getAttribute("user");

        if (u != null) {
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {

                out.println("<div>" + msg + "</div>");
                session.removeAttribute("msg");
            }
            BookDao bookDao = new BookDao("eLibrary");
            ArrayList<Book> books = (ArrayList<Book>) bookDao.getAllBooks();
            if (!books.isEmpty())
    %>


    <body>

        <!-- Sidebar -->
        <div class="sidebar">
            <ul class="side-menu">
                <li><a href="index.jsp"><i class='bx bx-store-alt'></i>Shop</a></li>
                <li><a href="viewBooks.jsp"><i class='bx bx-message-square-dots'></i>Books</a></li>
                <li><a href="adminUsers.jsp"><i class='bx bx-group'></i>Users</a></li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="controller?action=logout" class="logout">
                        <i class='bx bx-log-out-circle'></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
        <!-- End of Sidebar -->

        <!-- Main Content -->
        <div class="content">
            <!-- Navbar -->
            <nav>
                <i class='bx bx-menu'></i>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search orders...">
                        <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                    </div>
                </form>
                <input type="checkbox" id="theme-toggle" hidden>
                <label for="theme-toggle" class="theme-toggle"></label>
                <a href="#" class="notif">
                    <i class='bx bx-bell'></i>
                    <span class="count">1</span>
                </a>
            </nav>

            <!-- End of Navbar -->

            <main>
                <div class="header">
                    <div class="left">
                        <h1>Dashboard</h1>
                    </div>
                    <a href="#" class="report">
                        <i class='bx bx-cloud-download'></i>
                        <span>Download CSV</span>
                    </a>
                </div>

                <div class="bottom-data">
                    <div class="orders">
                        <div class="header">
                            <i class="bi bi-book"></i>
                            <h3>Current Books</h3>
                        </div>
                        <table>
                            <caption>List of books</caption>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>TITLE</th>
                                    <th>GENRE</th>
                                    <th>AGE</th>
                                    <th>DESCRIPTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <%
                                        for (Book book : books) {
                                    %>

                            <div>
                                <td style='padding-top:25px; padding-right: 20px;'><%=book.getId()%></td>
                            </div>
                            <td><%=book.getTitle()%></td>
                            <td><%=book.getGenre()%></td>
                            <td><%=book.getAgeRating()%></td>
                            <td><%=book.getDescription()%></td>
                            <div>
                                <td><a class="btn btn-primary btn-sm" href="adminViewUser.jsp?detailsID=<%=book.getId()%>"/>Details</a></td>
                                <form action="controller" method="post">
                                    <input type='hidden' name='action' value='deleteUser'/>    
                                    <input type='hidden' name='deleteID' value='<%=book.getId()%>'/>    
                                    <td><input class="btn btn-mini btn-danger" type="submit" name='deleteBook' value="Delete"/></td>
                                </form>

                                </tr>

                                <%
                                    }
                                %>
                                </tbody>
                        </table>
                    </div> 

                </div>

            </main>

        </div>

        <script src="js/adminIndex.js"></script>

        <%
        } else {
        %>
        <div style="color: yellow;">No users added.</div>
        <%
            }
        %>
    </body>

</html>
