/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.pub;

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
import javax.servlet.http.HttpSession;
import model.dao.BookingDAO;
import model.dao.PaySuccess;
import model.dao.TourDAO;
import model.dao.TourDatesDAO;
import model.database.DatabaseConnector;
import model.entity.Booking;
import model.entity.HomeTour;
import model.entity.Tour;
import model.entity.User;

/**
 *
 * @author ADMIN
 */
public class BookingFullServlet extends HttpServlet {

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
            out.println("<title>Servlet BookingFullServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingFullServlet at " + request.getContextPath() + "</h1>");
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
        int tourDateId = Integer.parseInt(request.getParameter("id"));
        int people = Integer.parseInt(request.getParameter("people"));
        BigDecimal totalPrice = new BigDecimal(request.getParameter("totalPrice"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            response.sendRedirect("login.jsp");
        } else {
            String email = user.getEmail();
            Date bookingDate = new Date();
            HomeTour homeTour = TourDAO.getHomeTourByTourDateId(tourDateId);
            int tourId = homeTour.getTourId();
            Tour tour = new Tour();
            tour.setTourId(tourId);
            Booking booking = new Booking();
            booking.setTour(tour);
            booking.setUser(user);
            booking.setNumberOfPeople(people);
            booking.setTotalPrice(totalPrice);
            booking.setBookingDate(bookingDate);
            booking.setStatus("1");
            try {
                // Khởi tạo BookingDAO
                BookingDAO bookingDAO = new BookingDAO(DatabaseConnector.getConnection());

                // Tạo đơn đặt tour và lấy ID của nó
                int bookingId = bookingDAO.createBookingAndGetId(booking);
                PaySuccess paySuccess = new PaySuccess();
                paySuccess.bookFull(email);
                // Chuyển hướng người dùng đến trang thanh toán
                request.getRequestDispatcher("notification.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
