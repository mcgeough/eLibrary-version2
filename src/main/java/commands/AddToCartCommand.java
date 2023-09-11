///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package commands;
//
///**
// *
// * @author mcgeo
// */
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class AddToCartCommand implements Command {
//
//    private HttpServletRequest request;
//    private HttpServletResponse response;
//
//    public AddToCartCommand(HttpServletRequest request, HttpServletResponse response) {
//        this.request = request;
//        this.response = response;
//    }
//
//    @Override
//    public String execute() {
//        String forwardToJsp = "index.jsp";
//        HttpSession session = request.getSession(true);
//        String username = request.getParameter(username);
//        
//        
//    }
//}
