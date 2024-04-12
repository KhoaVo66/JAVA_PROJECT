/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.tour;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class DeleteCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy customerId từ request
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int people = Integer.parseInt(request.getParameter("people"));
        BigDecimal totalPrice = new BigDecimal(request.getParameter("totalPrice"));

        // Gọi phương thức deleteCustomer từ CustomerDAO để xóa khách hàng
        CustomerDAO customerDAO = new CustomerDAO(DatabaseConnector.getConnection());
        try {
            customerDAO.deleteCustomer(customerId);
            // Nếu xóa thành công, chuyển hướng lại trang hiển thị danh sách khách hàng
            List<Customer> customerList = customerDAO.getCustomerByBookingId(bookingId);
            request.setAttribute("people", people);
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("bookingId", bookingId);
            request.setAttribute("customerList", customerList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/customer.jsp");
        dispatcher.forward(request, response);
        } catch (SQLException e) {
            // Xử lý ngoại lệ nếu có lỗi xảy ra
            e.printStackTrace();
            // Có thể điều hướng đến một trang lỗi hoặc hiển thị thông báo lỗi cho người dùng
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error deleting customer");
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
