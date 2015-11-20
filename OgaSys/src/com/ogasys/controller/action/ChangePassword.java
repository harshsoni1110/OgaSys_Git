package com.ogasys.controller.action;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.MongoException;
import com.ogasys.controller.Action;
import com.ogasys.dao.ChangePasswordDAO;

public class ChangePassword implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		String view;
		String curr_password=req.getParameter("curr");
		String new_password=req.getParameter("new");
		boolean check=false;
		HttpSession session=req.getSession();
		String userId=(String)session.getAttribute("LoginId");
		String passwd=(String)session.getAttribute("password");
		try{
			ChangePasswordDAO change_pass=new ChangePasswordDAO();
			check=change_pass.change_password(curr_password,new_password,userId,passwd);
		}
		catch(MongoException ex)
		{
			Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
		}
		catch(Exception ex)
		{
			Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		if(check==true)
		{
			req.setAttribute("success","Password changed successfully");
			view="home.jsp";
		}
		else
		{
			req.setAttribute("failure","Password you have entered does not match to original password");
			view="ChangePassword.jsp";
		}
		return view;
	}
	
	
	
}
