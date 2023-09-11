package daos;

import Bcrypt.BCrypt;
import business.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends Dao implements UserDaoInterface {

    public UserDao(String dbName) {
        super(dbName);
    }

    @Override
    public ArrayList<User> findAllUsers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<>();

        try {
            //Get connection object using the methods in the super class (Dao.java)...
            con = this.getConnection();

            String query = "SELECT * FROM users";
            ps = con.prepareStatement(query);

            //Using a PreparedStatement to execute SQL...
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String firstname = rs.getString("firstName");
                String lastname = rs.getString("lastName");
                String dob = rs.getString("dob");
                int isAdmin = rs.getInt("isAdmin");
                User u = new User(id, username, password, email, firstname, lastname, dob, isAdmin);
                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the findAllUsers() method: " + e.getMessage());
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
                System.out.println("An error occurred when shutting down the findAllUsers() method: " + e.getMessage());
            }
        }

        return users;     // may be empty
    }

    public User findUserByUsername(String uname, String upassword) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM users WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);

            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("user_id");
                String username = rs.getString("username");
                if (!BCrypt.checkpw(upassword, rs.getString("password"))) {
                    return null;
                } else {
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    String firstname = rs.getString("firstName");
                    String lastname = rs.getString("lastName");
                    String dob = rs.getString("dob");
                    int isAdmin = rs.getInt("isAdmin");
                    u = new User(id, username, password, email, firstname, lastname, dob, isAdmin);
                }
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the findUserByUsername() method: " + e.getMessage());
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
                System.out.println("An error occurred when shutting down the findUserByUsername method: " + e.getMessage());
            }
        }
        return u;     // u may be null 
    }

    @Override
    public User findUserById(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;
        try {
            con = this.getConnection();

            String query = "SELECT * FROM users WHERE user_id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String firstname = rs.getString("firstName");
                String lastname = rs.getString("lastName");
                String dob = rs.getString("dob");
                int isAdmin = rs.getInt("isAdmin");
                u = new User(userId, username, password, email, firstname, lastname, dob, isAdmin);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the findUserById() method: " + e.getMessage());
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
                System.out.println("An error occurred when shutting down the findUserById() method: " + e.getMessage());
            }
        }
        return u;     // u may be null 
    }

    @Override
    public int addUser(String uname, String pword, String email, String fName, String lName, String dob, int isAd) {
        Connection con = null;
        PreparedStatement ps = null;
        // This will be used to hold the generated ID (i.e. the value auto-generated
        // by MySQL when inserting this entry into the database
        ResultSet generatedKeys = null;
        // Set the newId value to a default of -1
        // If the value returned by the method is -1, we know that the update failed
        // as the id value was never updated
        int newId = -1;
        try {
            con = this.getConnection();

            String query = "INSERT INTO users(username, password, email, firstname, lastname, dob, isAdmin) VALUES (?,?,?,?,?,?,?)";

            // Need to get the id back, so have to tell the database to return the id it generates
            // That is why we include the Statement.RETURN_GENERATED_KEYS parameter
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, uname);
            ps.setString(2, pword);
            ps.setString(3, email);
            ps.setString(4, fName);
            ps.setString(5, lName);
            ps.setString(6, dob);
            ps.setInt(7, isAd);

            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();

            // Find out what the id generated for this entry was
            generatedKeys = ps.getGeneratedKeys();
            // If there was a result, i.e. if the entry was inserted successfully
            if (generatedKeys.next()) {
                // Get the id value that was generated by MySQL when the entry was inserted
                newId = generatedKeys.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addUser method:");
            System.err.println("\t" + e.getMessage());
            newId = -1;
        } finally {
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the addUser method:\n" + e.getMessage());
            }
        }
        return newId;
    }

    /**
     * Deletes a {@code User} object based on information in the database.An
     * entry in the deleted table is selected from the database and deleted.
     *
     * @param id
     * @return The {@code rowDeleted} boolean variable if user is deleted or
     * not.
     * @see java.util.List
     */
    @Override
    public boolean deleteUser(int id) {
        boolean rowDeleted = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = getConnection();
            String query = "DELETE FROM users WHERE user_id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int row = ps.executeUpdate();

            if (row > 0) {
                rowDeleted = true;
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(String uname, String email, String fName, String lName, int id) {
        boolean updated = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet generatedKeys = null;
        try {
            con = this.getConnection();

            String query = "UPDATE users SET (username,email, firstName,lastName) = (?,?,?,?) WHERE user_id = ?";
            System.out.println(query);
            // Need to get the id back, so have to tell the database to return the id it generates
            // That is why we include the Statement.RETURN_GENERATED_KEYS parameter
            ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, uname);
            ps.setString(2, email);
            ps.setString(3, fName);
            ps.setString(4, lName);
            ps.setInt(5, id);

            // Because this is CHANGING the database, use the executeUpdate method
            ps.executeUpdate();

            // Find out what the id generated for this entry was
            // If there was a result, i.e. if the entry was inserted successfully
            if (generatedKeys.next()) {
                updated = true;
                System.out.println(updated + "updated");
            }
        } catch (SQLException e) {
            System.err.println("\tA problem occurred during the addUser method:");
            System.err.println("\t" + e.getMessage());
        } finally {
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.err.println("A problem occurred when closing down the updateUser method:\n" + e.getMessage());
            }
        }
        return updated;
    }

}
