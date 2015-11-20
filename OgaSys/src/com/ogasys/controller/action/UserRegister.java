package com.ogasys.controller.action;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoException;
import com.ogasys.controller.Action;
import com.ogasys.dao.UserRegisterDAO;
import com.ogasys.model.Address;
import com.ogasys.model.User;
import com.ogasys.util.Encryptor;;

public class UserRegister implements Action {
	User user;
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		
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
        String userDpLink=null;
		String view=null;
        
        //set the value of user class
			user= new User();
			Address addr = new Address ();
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
			user.setUserEmailId(email);
            
			if(gender.equals("1")) {
			   userDpLink="assets/img/profile.jpg";	
			}
			else if(gender.equals("2")) {
				userDpLink="assets/img/user_female.png";
			}
			
		    user.setUserProfilePictureLink(userDpLink);
		    
			
            String encryptedPassword="";
            try{
               encryptedPassword=Encryptor.encrypt(password);               	
            }
            catch(Exception e){
            	System.out.println("Password Encryption failed");
            }
            
			user.setUserPassword(encryptedPassword);
			
			
			//End the user class setter
			boolean status=false;
			UserRegisterDAO rdb;
            try {
                rdb=new UserRegisterDAO();
                status=rdb.doRegister(user);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MongoException ex) {
                Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
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
		}

}
