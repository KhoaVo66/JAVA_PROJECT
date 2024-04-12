/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.tour;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.BillDAO;
import model.dao.PaySuccess;
import model.database.DatabaseConnector;
import model.entity.Bill;
import model.entity.Booking;

/**
 *
 * @author ADMIN
 */
public class CreateBillServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateBillServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateBillServlet at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            BigDecimal totalPrice = new BigDecimal(request.getParameter("totalPrice"));
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String paymentDateStr = request.getParameter("paymentDate");
            String paymentMethod = request.getParameter("paymentMethod");

            Date paymentDate = null;
            if(paymentDateStr == null || paymentDateStr.isEmpty()) {
                // Nếu paymentDateStr là null hoặc rỗng, lấy ngày tháng hiện tại
                paymentDate = new Date();
            } else {
                // Ngược lại, chuyển đổi paymentDateStr thành java.sql.Date
                paymentDate = parseDate(paymentDateStr);
            }

            // Tạo đối tượng Bill từ thông tin đã lấy được
            Booking bk = new Booking();
            bk.setBookingId(bookingId);
            Bill bill = new Bill();
            bill.setBooking(bk); // Đặt booking cho hóa đơn
            bill.setPaymentDate(paymentDate);
            bill.setPaymentMethod(paymentMethod);

            BillDAO billDAO = new BillDAO(DatabaseConnector.getConnection());

            // Insert the new bill into the database
            billDAO.createBill(bill);
            request.setAttribute("email", email);
            request.setAttribute("name", name);
            request.setAttribute("totalPrice", totalPrice);

            // Check payment method to determine redirect destination
            if ("Cash".equalsIgnoreCase(paymentMethod)) {
                PaySuccess paySuccess = new PaySuccess();
                    paySuccess.send(email);
                // Redirect to home page if payment method is cash
                response.sendRedirect("Home");
            } else {
                // Redirect to pay.jsp if payment method is not cash
                request.getRequestDispatcher("pay.jsp").forward(request, response);
            }
        } catch (ParseException ex) {
            Logger.getLogger(CreateBillServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CreateBillServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    // Helper method to parse a string into a Date
    private java.sql.Date parseDate(String dateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false); // Disallow lenient parsing
        Date parsedDate = sdf.parse(dateStr);
        return new java.sql.Date(parsedDate.getTime());
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
