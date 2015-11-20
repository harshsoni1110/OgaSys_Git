package com.ogasys.controller.action;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mongodb.MongoException;
import com.ogasys.controller.Action;
import com.ogasys.dao.GarageRegisterDAO;
import com.ogasys.model.Address;
import com.ogasys.model.Garage;
import com.ogasys.util.Encryptor;;

public class GarageRegister implements Action {
	Garage garage;
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		
        String garageName=req.getParameter("garageName");
        String shopNumber=req.getParameter("shopNumber");
        String street=req.getParameter("street");
        String landmark=req.getParameter("landmark");
        String city=req.getParameter("city");
        String state=req.getParameter("state");
        String postalCode=req.getParameter("postalCode");
        String phoneNumber=req.getParameter("phoneNumber");
        String email=req.getParameter("email");
		String password=req.getParameter("password");
        String view=null;
	
        //set the value of garage class
		    garage=new Garage();
			Address addr = new Address ();
			addr.setFlatNumber(shopNumber);
			addr.setStreet(street);
			addr.setLandmark(landmark);
			addr.setCity(city);
			addr.setState(state);
			addr.setCountry("India");
			addr.setPinCode(Integer.parseInt(postalCode));
			addr.setLatitude(23.057811);
			addr.setLongitude(72.542134);

			garage.setAddress(addr);
			garage.setContactNumber(Long.parseLong(phoneNumber));
			
			garage.setGarageName(garageName);
            garage.setGarageEmailId(email);
            
            String encryptedPassword="";
            try{
               encryptedPassword=Encryptor.encrypt(password);               	
            }
            catch(Exception e){
            	System.out.println("Password Encryption failed");
            }
            
		   garage.setGaragePassword(encryptedPassword);
						
			//End the garage class setter
			
		    boolean status=false;
			GarageRegisterDAO rdb;
            try {
                rdb=new GarageRegisterDAO();
                status=rdb.doRegister(garage);
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
                 view="RegisterGarage.jsp";    
            }
        
		return view;
		
    }

}
