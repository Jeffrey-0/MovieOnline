package servlet.User;

import dao.Impl.UserDaoImpl;
import dao.UserDao;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType ("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
<<<<<<< HEAD
		response.setCharacterEncoding("UTF-8");
		String number = request.getParameter("number");
=======
		String id = request.getParameter("id");
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
		String password = request.getParameter("password");
		UserDao userDao = new UserDaoImpl();
		User user = null;
		try{
<<<<<<< HEAD
			user = userDao.queryByIdAndPwd(number, password);
=======
			user = userDao.queryByIdAndPwd(Integer.parseInt(id), password);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
		}catch( Exception e){

		}
		if(user!=null) {
			request.getSession().setAttribute("username", user.getName());
			request.getSession().setAttribute("userId", user.getId());
			request.getSession().setAttribute("loginUser", user);
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		else {
<<<<<<< HEAD
			try {
				   PrintWriter out = response.getWriter();
				   String a = URLEncoder.encode("账号或密码不正确!", "UTF-8"); 
			   out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'));window.location.href='login.jsp?method=sindex';</script>");
				   out.flush();
				   out.close();
				  } catch (IOException e) {
				   e.printStackTrace();
				  }
			response.sendRedirect(request.getContextPath()+"/login.jsp");
=======
//			try {
//				   PrintWriter out = response.getWriter();
//				   String a = URLEncoder.encode("账号或密码不正确!", "UTF-8");
//			   out.print("<script type=\"text/javascript\">\n" +
//					   "     Swal.fire({\n" +
//					   "      type:\"error\",\n" +
//					   "      title:\"账号或密码错误\",\n" +
//					   "      confirmButtonColor:\"#007bff\",\n" +
//					   "      confirmButtonText:\"确认\"\n" +
//					   "    })\n" +
//					   "  ;top.location='login.jsp'; </script>");
//				   out.flush();
//				   out.close();
//				  } catch (IOException e) {
//				   e.printStackTrace();
//				  }

			request.setAttribute("error", "1");
			request.setAttribute("username", id);
//			response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getRequestDispatcher("login.jsp").forward(request, response);
>>>>>>> d852b529a1cbad2c21c853476357c70a875e5522
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
