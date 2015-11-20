package com.ogasys.controller.action;


import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mongodb.MongoException;
import com.ogasys.controller.Action;
import com.ogasys.dao.OgaSysDAO;
import com.ogasys.dao.OgaSysDAOImpl;
import com.ogasys.dao.UserLoginDAO;
import com.ogasys.model.Login;
import com.ogasys.model.User;

public class LoginValidate implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		
		String userName=req.getParameter("uname");
		String password=req.getParameter("pwd");
		String view=null;
		Login login=new Login();
		login.setUserName(userName);
		login.setPassword(password);
		
		User userData=new User();
		
		try{
			UserLoginDAO logindao=new UserLoginDAO();
			userData=logindao.authenticate(login);
		}
		catch (ClassNotFoundException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        } 
		catch (MongoException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
		if(userData!=null) {
			HttpSession session=req.getSession();
            session.setAttribute("UserName",userData.getFirstName()+" "+userData.getLastName());
            session.setAttribute("UserObjectId",userData.getId());
            session.setAttribute("UserLoginId",userName);
            Object userId=session.getAttribute("UserObjectId");
            System.out.println("ObjectId is "+userId);
            OgaSysDAO dao=new OgaSysDAOImpl();
            List<User> userList=dao.getUserDetailsById(userId);
            User user=userList.get(0);
            if(user!=null) {
              session.setAttribute("UserObject",user);
              view="UserProfile.jsp";
            }		
		}
		else {
            req.setAttribute("loginfail","Username or password is not correct.");
            view="LoginUser.jsp";
        }
		/*if(userData.size()!=0)
        {
            System.out.println("Welcome "+userData.get(0)+" "+userData.get(1));
            HttpSession session=req.getSession();
            session.setAttribute("UserName",userData.get(0)+" "+userData.get(1));
            session.setAttribute("UserObjectId",userData.get(2));
            session.setAttribute("UserLoginId",userName);
            String userId=(String)session.getAttribute("UserObjectId");
            System.out.println("ObjectId is "+userId);
            OgaSysDAO dao=new OgaSysDAOImpl();
            User user=dao.getUserDetailsById(userId);
            if(user!=null) {
              session.setAttribute("UserObject",user);
              view="UserProfile.jsp";
            }
            
        }
        else
        {
            req.setAttribute("loginfail","Username or password is not correct.");
            view="LoginUser.jsp";
        }*/	
		return view;
	}
}
