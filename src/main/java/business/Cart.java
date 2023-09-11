/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author mcgeo
 */
public class Cart {

    private int cartID;
    private User user;
    private ArrayList<Cart> items;
    private static int idCount = 0;

    public Cart(User user, ArrayList<Cart> items) {
        this.cartID = ++idCount;
        this.user = user;
        this.items = items;
    }

    public Cart() {
        
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ArrayList<Cart> getItems() {
        return items;
    }

    public void setItems(ArrayList<Cart> items) {
        this.items = items;
    }

    public static int getIdCount() {
        return idCount;
    }

    public static void setIdCount(int idCount) {
        Cart.idCount = idCount;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + this.cartID;
        hash = 67 * hash + Objects.hashCode(this.user);
        hash = 67 * hash + Objects.hashCode(this.items);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Cart other = (Cart) obj;
        if (this.cartID != other.cartID) {
            return false;
        }
        if (!Objects.equals(this.user, other.user)) {
            return false;
        }
        return Objects.equals(this.items, other.items);
    }

    @Override
    public String toString() {
        return "Cart{" + "cartID=" + cartID + ", user=" + user + ", items=" + items + '}';
    }

}
