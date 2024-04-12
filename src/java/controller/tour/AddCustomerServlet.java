/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.tour;

import java.io.IOException;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.CustomerDAO;
import model.database.DatabaseConnector;
import model.entity.Customer;

/**
 *
 * @author ADMIN
 */
public class AddCustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet AddCustomerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận dữ liệu từ biểu mẫu JSP
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        BigDecimal totalPrice = new BigDecimal(request.getParameter("totalPrice"));
        int people = Integer.parseInt(request.getParameter("people"));
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String idCard = request.getParameter("idCard");
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        // Tạo đối tượng Customer từ dữ liệu nhận được
        Customer customer = new Customer(fullname, phone, idCard, bookingId);

        // Thêm mới khách hàng vào cơ sở dữ liệu
        CustomerDAO customerDAO = new CustomerDAO(DatabaseConnector.getConnection());
        try {
            customerDAO.createCustomer(customer);
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý lỗi và chuyển hướng người dùng đến trang lỗi nếu cần
        }

        // Cập nhật danh sách khách hàng trong request để hiển thị lại trên trang JSP
        try {
            List<Customer> customerList = customerDAO.getCustomerByBookingId(bookingId);
            request.setAttribute("people", people);
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("bookingId", bookingId);
            request.setAttribute("customerList", customerList);
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý lỗi và chuyển hướng người dùng đến trang lỗi nếu cần
        }

        // Chuyển hướng người dùng trở lại trang JSP hiển thị danh sách khách hàng
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
