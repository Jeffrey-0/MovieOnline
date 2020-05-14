package servlet.User;

import dao.Impl.UserDaoImpl;
import dao.UserDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

@WebServlet("/ForgetServlet")
public class ForgetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType ("text/html;charset=UTF-8");
        String number = request.getParameter("number");
        String backPassTip = request.getParameter("backPassTip");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        if(password.equals(password2)) {
            UserDao userdao =new UserDaoImpl();
            User user=userdao.queryByNumAndTip(number,backPassTip);
            PrintWriter out = response.getWriter();
            if (user == null) {
                String a = URLEncoder.encode("号码或密码提示错误！", "UTF-8");
                out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
            }else {
                int i = userdao.modifyPassword(number,password);
                if(i>0){
                    String a = URLEncoder.encode("修改成功！", "UTF-8");
                    out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
                }else{
                    String a = URLEncoder.encode("修改失败！", "UTF-8");
                    out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
                }
            }
            out.flush();
            out.close();

        }else {
            PrintWriter out = response.getWriter();
            String a = URLEncoder.encode("两次密码输入不一致", "UTF-8");
            out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
            out.flush();
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
