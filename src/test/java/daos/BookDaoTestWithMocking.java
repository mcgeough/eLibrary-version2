/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package daos;

import business.Book;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 *
 * @author mcgeo
 */
public class BookDaoTestWithMocking {

    public BookDaoTestWithMocking() {
    }

    /**
     * Test of getAllBooks of class BookDao.
     *
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     */
    @Test
    public void testGetAllBooks() throws SQLException, IOException {
        // Create expected results
        Book b1 = new Book(1, "BookTitle1", "BookGenre1", 12, 9.99, "BookDescription1", "BookImage1");
        Book b2 = new Book(2, "BookTitle2", "BookGenre2", 12, 9.99, "BookDescription2", "BookImage2");
        Book b3 = new Book(3, "BookTitle3", "BookGenre3", 12, 9.99, "BookDescription3", "BookImage3");

        ArrayList<Book> expectedResults = new ArrayList();
        expectedResults.add(b1);
        expectedResults.add(b2);
        expectedResults.add(b3);

        // Create mock objects
        Connection dbConn = mock(Connection.class);
        PreparedStatement ps = mock(PreparedStatement.class);
        ResultSet rs = mock(ResultSet.class);

        // Fill mock objects with appropriate dummy data
        when(dbConn.prepareStatement("Select * from books")).thenReturn(ps);
        when(ps.executeQuery()).thenReturn(rs);
        // Want 3 results in the resultset, so need true to be returned 3 times
        when(rs.next()).thenReturn(true, true, true, false);
        // Fill in the resultset
        when(rs.getInt("id")).thenReturn(b1.getId(), b2.getId(), b3.getId());
        when(rs.getString("title")).thenReturn(b1.getTitle(), b2.getTitle(), b3.getTitle());
        when(rs.getString("genre")).thenReturn(b1.getGenre(), b2.getGenre(), b3.getGenre());
        when(rs.getInt("ageRating")).thenReturn(b1.getAgeRating(), b2.getAgeRating(), b3.getAgeRating());
        when(rs.getDouble("price")).thenReturn(b1.getPrice(), b2.getPrice(), b3.getPrice());
        when(rs.getString("description")).thenReturn(b1.getDescription(), b2.getDescription(), b3.getDescription());

        //int numProductsInTable = 3;
        // Supply the DAO with the mock connection, which has been filled with all
        // required mock information for the query to run
        BookDao bookDao = new BookDao(dbConn);
        List<Book> result = bookDao.getAllBooks();
        // Check that the number of entries retrieved matches the (known) number 
        // of entries in the supplied dummy data
        //assertEquals(numProductsInTable, result.size());

        // An alternative approach is to use the arraylist of Products we created 
        // as expected results at the start
        // If this equals the arraylist we got back from our method being tested, 
        // then the method worked as expected
        assertEquals(expectedResults, result);

        System.out.println("Results:");
        for (Book b : result) {
            System.out.println(b);
        }
    }

    /**
     * Test of updateBookPrice of class BookDao.
     *
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     */

}
