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
//import business.User;
//import daos.UserDao;
//import java.io.BufferedWriter;
//import java.io.File;
//import java.io.FileWriter;
//import java.util.ArrayList;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class CreateUserReportCommand implements Command {
//
//    private HttpServletRequest request;
//    private HttpServletResponse response;
//
//    public CreateUserReportCommand(HttpServletRequest request, HttpServletResponse response) {
//
//    }
//    public String execute(){
//        
//        UserDao userDao = new UserDao("elibrary");
//        ArrayList<User> users = userDao.findAllUsers();
//        ArrayList <String> course = new ArrayList<>();
//ArrayList <String> name = new ArrayList<>();
//ArrayList <Integer> age = new ArrayList<>();
//
//File file = new File("users.csv");
//FileWriter fw = new FileWriter(file);
//BufferedWriter bw = new BufferedWriter(fw);
//
//bw.write("Course,Name,Age");
//bw.newLine();
//for (int i = 0; i < course.size(); i++) {
//    bw.write(course.get(i));
//    bw.newLine();
//}
//
//
//for (int i = 0; i < name.size(); i++) {
//    bw.write("," + name.get(i));
//    bw.newLine();
//}
//
//for (int i = 0; i < age.size(); i++) {
//    bw.write("," + .get(i));
//    bw.newLine();
//}
//
//bw.close();
//fw.close();
//    }
//}
