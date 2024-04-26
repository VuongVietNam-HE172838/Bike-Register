package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import static controller.SendVerifyCodeMail.sendMail;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import models.RBUsers;

import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author thant
 */
@WebServlet(name="register", urlPatterns={"/register"})
public class register extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        Map<String, String> errorMessages = new HashMap<>();
        
        String phone = request.getParameter("input-phoneNum");
        String email = request.getParameter("input-mail");
        String dob = request.getParameter("input-dob");
        String address = request.getParameter("input-address");
        String cccd = request.getParameter("input-iden");
        String name = request.getParameter("input-fullname");
        String account = request.getParameter("input-account");
        String password = request.getParameter("input-password");
        String repassword = request.getParameter("input-repassword");
        
        
        HttpSession session=request.getSession();
        
        System.out.println(phone);
        System.out.println(email);
        System.out.println(dob);
        System.out.println(address);
        System.out.println(cccd);
        System.out.println(name);
        System.out.println(account);
        System.out.println(password);
        System.out.println(repassword);
        

        if (!checkFullname(name).isEmpty()) {
            errorMessages.put("input-fullname", checkFullname(name));
        }
        if (!checkAccount(account).isEmpty()) {
            errorMessages.put("input-fullname", checkFullname(name));
        }
        if (!checkPhoneNumber(phone).isEmpty()) {
            errorMessages.put("input-phoneNum", checkPhoneNumber(phone));
        }
        if (!checkEmail(email).isEmpty()) {
            errorMessages.put("input-mail", checkEmail(email));
        }
        if (!checkIdentityCardNumber(cccd).isEmpty()) {
            errorMessages.put("input-iden", checkIdentityCardNumber(cccd));
        }
        if (password == null ? repassword != null : !password.equals(repassword)) {
            errorMessages.put("input-password", (password == null || !password.equals(repassword)) ? "Nhập lại mật khẩu sai" : null);
        }
        

        if (!errorMessages.isEmpty()) {
            //bao loi
            request.setAttribute("errorMessages", errorMessages);
            
            //set input again
            request.setAttribute("phoneNum", phone);
            request.setAttribute("mail", email);
            request.setAttribute("fullname", name);
            request.setAttribute("account", account);
            request.setAttribute("dob", dob);
            request.setAttribute("address", address);
            request.setAttribute("iden", cccd);
            request.setAttribute("pass", password);
            request.setAttribute("repass", repassword);
            
            doGet(request, response);
        } else if ((String) session.getAttribute("sysOtp") == null) {
            
            String otp = generateVerifyCode();

            try {
//                verify code
                sendMail(otp, "namchik03@gmail.com");
//                sendMail(otp, email);
            } catch (MessagingException ex) {
            }
            
//            set otp
            request.setAttribute("sysOtp", otp);
        
            session.setAttribute("sysOtp", otp);
            
            String sysOtp = (String) session.getAttribute("sysOtp");
            System.out.println("sysOtp: " + sysOtp);
            
            //set input again
            request.setAttribute("phoneNum", phone);
            request.setAttribute("mail", email);
            request.setAttribute("account", account);
            request.setAttribute("fullname", name);
            request.setAttribute("dob", dob);
            request.setAttribute("address", address);
            request.setAttribute("iden", cccd);
            request.setAttribute("pass", password);
            request.setAttribute("repass", repassword);
            
            request.setAttribute("otpStatus", "1");
            
            
            doGet(request, response);
            
            
        } else {  
            
            String inputOtp = request.getParameter("input-otp");
            String sysOtp = (String) session.getAttribute("sysOtp");
            
            if (!inputOtp.equals(sysOtp) || inputOtp==null) {
                errorMessages.put("input-otp", "Sai OTP");
                System.out.println("loi regis otp: " + inputOtp);
                request.setAttribute("errorMessages", errorMessages);

                //set input again
                request.setAttribute("phoneNum", phone);
                request.setAttribute("mail", email);
                request.setAttribute("account", account);
                request.setAttribute("fullname", name);
                request.setAttribute("dob", dob);
                request.setAttribute("address", address);
                request.setAttribute("iden", cccd);
                request.setAttribute("pass", password);
                request.setAttribute("repass", repassword);
                
                request.setAttribute("otpStatus", "1");

                doGet(request, response);
            }
            
            
            //input date
            SimpleDateFormat inputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
            

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date dateOfBirth = null;
            try {
                //parse input date
                Date parsedDate = inputDateFormat.parse(dob);
                
                //output date format trong SQL
                 SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                 
                 String formattedDate = outputDateFormat.format(parsedDate);
                
                // Parse chuỗi thành một đối tượng Date
                dateOfBirth = outputDateFormat.parse(formattedDate);
                
                RBUsers u = new RBUsers("", account, password, email, cccd, name, phone, formattedDate, address, "", "", "1", "user");
                
                RBDAO uD = new RBDAO();
            
                uD.addUser(u);
                
                response.sendRedirect("login");


            } catch (ParseException ex) {
            }

//            RBUsers(String id, String account, String password, String email, String cccd, String name, 
//                    String phone, String dob, String address, String imgFront, String imgBack, String verify, String role)

        }
        
        
    }
    
    
    public String generateVerifyCode() {
        // Tạo mã xác minh ngẫu nhiên
        int verifyCode = (int) (Math.random() * 999999 + 1);

        // Đảm bảo rằng mã xác minh có 6 chữ số
        String verifyCodeString = String.format("%06d", verifyCode);

        return verifyCodeString;
    }
    
    public static String checkFullname(String username) {
        // Kiểm tra độ dài của tên người dùng
        if (username.length() < 2 || username.length() > 64) {
            return "Nhập tên dài 2 - 64 ký tự";
        }

        // Kiểm tra định dạng tên người dùng
        String regex = "^[\\p{L}]+(\\s[\\p{L}]+)*$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(username);

        if (!matcher.matches()) {
            return "Tên sai định dạng";
        }

        return "";
    }
    
    public static String checkPhoneNumber(String phoneNumber) {
        String regex = "^0\\d{9}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phoneNumber);
        if (matcher.matches()) {
            return "";
        } else {
            return "Số điện thoại không hợp lệ";
        }
    }

    public static String checkEmail(String email) {
        RBDAO uD = new RBDAO();
        
        String regex = "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        
        if (uD.checkEmailExist(email)) {
            return "Email đã được đăng kí";
        } else if (matcher.matches()) {
            return "";
        } else {
            return "Email không hợp lệ";
        }
    }

    public static String checkIdentityCardNumber(String iden) {
        RBDAO uD = new RBDAO();
        
        String regex = "^[0-9]{12}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(iden);
        
        if (uD.checkIdenExist(iden)){
            return "Căn cước công dân đã được đăng kí";
        } else if (matcher.matches()) {
            return "";
        } else {
            return "Căn cước công dân không hợp lệ";
        }
    }
    
    public static String checkAccount(String account) {
        // Kiểm tra độ dài của tên dang nhap
        if (account.length() < 2 || account.length() > 16) {
            return "Nhập tên đăng nhập dài 2 - 16 ký tự";
        }

        // Kiểm tra định dạng tên dang nhap
        String regex = "^[a-zA-Z0-9_]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(account);

        if (!matcher.matches()) {
            return "Tên đăng nhập sai định dạng";
        }

        return "";
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
