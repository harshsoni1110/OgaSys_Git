package com.ogasys.controller.action;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoException;
import com.ogasys.controller.Action;
import com.ogasys.dao.RegisterDAO;
import com.ogasys.model.Address;
import com.ogasys.model.User;
import com.ogasys.util.Encryptor;;

public class Register implements Action {
	User user;
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		
		//String username=req.getParameter("uname");
        String firstName=req.getParameter("firstName");
        String lastName=req.getParameter("lastName");
        String flatName=req.getParameter("houseNumber");
        String street=req.getParameter("street");
        String landmark=req.getParameter("landmark");
        String city=req.getParameter("city");
        String state=req.getParameter("state");
        String postalCode=req.getParameter("postalCode");
        String gender=req.getParameter("gender");
        String phoneNumber=req.getParameter("phoneNumber");
        String email=req.getParameter("email");
		String password=req.getParameter("password");
        String view=null;
		
		//private static final MongoConnectionManager INSTANCE = new MongoConnectionManager();
		
			//set the value of user class
			user= new User();
			Address addr = new Address ();
			/*addr.setFlatNumber("2/20 Rameshwar Apt.");
			addr.setStreet("Solaroad, Naranpura");
			addr.setLandmark("Solapetrol Pump");
			addr.setCity("Ahmedabad");
			addr.setState("Gujarat");
			addr.setCountry("India");
			addr.setPinCode(380013);
			addr.setLatitude(23.057811);
			addr.setLongitude(72.542134);

			user.setAddress(addr);
			user.setContactNumber(12345678);
			user.setFirstName("xyz");
			user.setGender(1);
			user.setLastName("ABC");
			user.setMiddleName("PQR");
			user.setUserEmailId("abc@example.com");
			*/
			addr.setFlatNumber(flatName);
			addr.setStreet(street);
			addr.setLandmark(landmark);
			addr.setCity(city);
			addr.setState(state);
			addr.setCountry("India");
			addr.setPinCode(Integer.parseInt(postalCode));
			addr.setLatitude(23.057811);
			addr.setLongitude(72.542134);

			user.setAddress(addr);
			user.setContactNumber(Long.parseLong(phoneNumber));
			user.setFirstName(firstName);
			user.setGender(Integer.parseInt(gender));
			user.setLastName(lastName);
			user.setMiddleName("PQR");
			user.setUserEmailId(email);
			user.setUserPassword(password);
			
			
			//End the user class setter
			boolean status=false;
			RegisterDAO rdb;
            try {
                rdb=new RegisterDAO();
                status=rdb.doRegister(user);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MongoException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
			if(status)
            {
                 req.setAttribute("regmsg","You have been registered successfully.");
                 view="LoginUser.jsp";
            }
            else //Correction new page will be developed which is error page
            {
                 req.setAttribute("regmsg","You have not been registered yet.");
                 view="RegisterUser.jsp";    
            }
        
		return view;
		
		/*String username=req.getParameter("uname");
        String password=req.getParameter("pass");
        String confirmpass=req.getParameter("cpass");
        String view=null;
        if(password.equals(confirmpass))
        {
            RegisterBean register=new RegisterBean();
            register.setUsername(username);
            Encryptor etr=new Encryptor();
            String encryptedPassword="";
            try{
               encryptedPassword=etr.encrypt(password);               	
            }
            catch(Exception e){
            	System.out.println("Password Encryption failed");
            }
            register.setPassword(encryptedPassword);
            boolean status = false;
            RegisterDAO rdb;
            try {
                rdb=new RegisterDAO();
                status=rdb.doRegister(register);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MongoException ex) {
                Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if(status)
            {
                 req.setAttribute("regmsg","You have been registered successfully.");
                 view="LoginUser.jsp";
            }
            else //Correction new page will be developed which is error page
            {
                 req.setAttribute("regmsg","You have not been registered yet.");
                 view="RegisterUser.jsp";    
            }
            
        }
        else
        {
            req.setAttribute("msg", "password and confirm password must match with each other");
            view="RegisterUser.jsp";
        }
        return  view;*/
	}

}
