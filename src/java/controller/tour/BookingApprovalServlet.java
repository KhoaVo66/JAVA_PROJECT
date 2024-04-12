/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.tour;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.BillDAO;
import model.dao.BookingDAO;
import model.dao.PaySuccess;
import model.database.DatabaseConnector;
import model.entity.Bill;
import model.entity.Booking;

/**
 *
 * @author ADMIN
 */
public class BookingApprovalServlet extends HttpServlet {

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
            out.println("<title>Servlet BookingApprovalServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingApprovalServlet at " + request.getContextPath() + "</h1>");
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
        // Lấy bookingId từ request
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        
        // Gọi phương thức changeBookingStatus để cập nhật trạng thái của booking sang "Approved"
        try {
            BookingDAO bookingDAO = new BookingDAO(DatabaseConnector.getConnection());
            bookingDAO.changeBookingStatus(bookingId, "0");
            Date paymentDate = new Date();
            Booking bk = bookingDAO.getBookingById(bookingId);
            String email = bk.getUser().getEmail();
            Bill bill = new Bill();
            bill.setBooking(bk); // Đặt booking cho hóa đơn
            bill.setPaymentDate(paymentDate);
            bill.setPaymentMethod("Book Full");

            BillDAO billDAO = new BillDAO(DatabaseConnector.getConnection());

            // Insert the new bill into the database
            billDAO.createBill(bill);
            PaySuccess paySuccess = new PaySuccess();
                    paySuccess.approve(email);
            // Redirect đến trang ManageBooking.jsp hoặc trang khác sau khi cập nhật thành công
            response.sendRedirect("ManageBookingServlet?");
        } catch (SQLException ex) {
            // Xử lý ngoại lệ nếu có lỗi khi cập nhật trạng thái
            ex.printStackTrace();
            // Hoặc bạn có thể redirect đến một trang lỗi nào đó để thông báo cho người dùng
            // response.sendRedirect("error.jsp");
        }
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
