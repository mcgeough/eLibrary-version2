/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import business.Review;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mcgeo
 */
public class ReviewDao extends Dao implements ReviewDaoInterface {

    public ReviewDao(Connection conn) {
        super(conn);
    }

    @Override
    public Review findReviewByBookId(int id) throws IOException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Review r = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM books WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                int review_id = rs.getInt("id");
                int rating = rs.getInt("rating");
                String review = rs.getString("review");

                r = new Review(review_id, rating, review);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the findReviewByBookId() method: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("An error occurred when shutting down the findReviewByBookId() method: " + e.getMessage());
            }
        }
        return r;     // u may be null 
    }
}
