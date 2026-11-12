package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    private UserService service = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute(Constant.SESSION_ACCOUNT) != null) {
            resp.sendRedirect(req.getContextPath() + "/waiting");
            return;
        }
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");

        String alert = null;
        if (isBlank(username) || isBlank(fullname) || isBlank(email) || isBlank(phone)
                || isBlank(password) || isBlank(repassword)) {
            alert = "Vui lòng nhập đầy đủ thông tin";
        } else if (!password.equals(repassword)) {
            alert = "Mật khẩu nhập lại không khớp";
        } else if (service.checkExistEmail(email)) {
            alert = "Email đã tồn tại!";
        } else if (service.checkExistUsername(username)) {
            alert = "Tài khoản đã tồn tại!";
        } else if (service.checkExistPhone(phone)) {
            alert = "Số điện thoại đã tồn tại!";
        } else if (!service.register(username, password, email, fullname, phone)) {
            alert = "Có lỗi hệ thống, vui lòng thử lại";
        }

        if (alert != null) {
            req.setAttribute("alert", alert);
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/login?registered=true");
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}