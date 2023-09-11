/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import business.User;
import java.util.List;

public interface UserDaoInterface {

    public List<User> findAllUsers();

    public User findUserById(int id);

    public int addUser(String uname, String pword, String email, String fName, String lName, String dob, int isAd);
    
    public User findUserByUsername(String uname, String Upassword);

    public boolean deleteUser(int id);

    public boolean updateUser(String uname, String email, String fName, String lName, int id);
}
