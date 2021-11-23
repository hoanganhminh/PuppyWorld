package control;

import dao.DAO;
import model.Category;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CategoryControl", urlPatterns = {"/category"})
public class CategoryControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cateID = request.getParameter("cid"); //đoạn này lấy category về
        DAO dao = new DAO();
        List<Product> list = dao.getProductByCID(cateID);
        List<Category> listC = dao.getAllCategory();
        Product last = dao.getLastDog();
        request.setAttribute("listCC", listC);
        request.setAttribute("p", last);
        request.setAttribute("listP", list);
        request.setAttribute("tag", cateID);
        request.setAttribute("contextPath", request.getContextPath());
        request.getRequestDispatcher("Home.jsp").forward(request, response); //cho dữ liệu lên home jsp
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
