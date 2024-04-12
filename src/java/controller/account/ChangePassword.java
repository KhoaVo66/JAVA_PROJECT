package controller.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.UserDAO;
import model.database.DatabaseConnector;
import model.entity.User;

@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection connection = DatabaseConnector.getConnection();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("auth");
            if (user == null) {
                response.sendRedirect("login.jsp");
            } else {
                int id = user.getUserId();
                UserDAO udao = new UserDAO(DatabaseConnector.getConnection());
                User profile = udao.getUserById(id);
                
                String email = request.getParameter("email");
                String oldPassword = request.getParameter("opass"); // Đây là mật khẩu cũ
                String newPassword = request.getParameter("password"); // Đây là mật khẩu mới
                String confirmPassword = request.getParameter("rpass"); // Lặp lại mật khẩu mới

                // Kiểm tra xem mật khẩu mới và mật khẩu xác nhận có trùng khớp không
                if (!newPassword.equals(confirmPassword)) {
                    request.setAttribute("mess", "New password and Confirm password must match!"); // Thiết lập thông báo lỗi
                    request.setAttribute("profile", profile);
                    request.getRequestDispatcher("Change-Password.jsp").forward(request, response); // Chuyển hướng người dùng lại trang đổi mật khẩu
                    return; // Kết thúc xử lý phương thức doPost
                }

                profile = udao.checkLogIn(email, oldPassword); // Kiểm tra đăng nhập với mật khẩu cũ

                boolean passwordChanged = false;
                if (profile != null) {
                    passwordChanged = udao.changePassword(email, newPassword);
                }

                if (profile == null) {
                    request.setAttribute("profile", profile);
                    request.setAttribute("mess", "Old password is incorrect!"); // Nếu mật khẩu cũ không chính xác, thiết lập thông báo lỗi
                } else {
                    if (passwordChanged) {
                        request.setAttribute("profile", profile);
                        request.setAttribute("mess", "Password changed successfully!"); // Thông báo thành công
                    } else {
                        request.setAttribute("profile", profile);
                        request.setAttribute("mess", "Failed to change password!"); // Thông báo thất bại
                    }
                }
                request.setAttribute("profile", profile);
                request.getRequestDispatcher("Change-Password.jsp").forward(request, response);
            }
        }catch (Exception e) {
            e.printStackTrace();
                    }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
