/**
 * 
 */
package com.ogasys.model;

import java.util.ArrayList;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Embedded;
//import org.mongodb.morphia.annotations.Embedded;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;
import org.mongodb.morphia.annotations.Transient;
//import org.mongodb.morphia.annotations.Transient;
//import org.mongodb.morphia.annotations.Reference;

@Entity(value="Notification")
public class Notification {
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Notification [id=" + id + ", MsgFromId=" + MsgFromId + ", MsgToId=" + MsgToId + ", ServiceId="
				+ ServiceId + ", NotificationType=" + NotificationType + ", NotificationStatus=" + NotificationStatus
				+ ", MsgGenerator=" + MsgGenerator + ", NotificationContent=" + NotificationContent + "]";
	}
	/**
	 * @return the id
	 */
	public ObjectId getId() {
		return id;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	
	/**
	 * @param id the id to set
	 */
	public void setId(ObjectId id) {
		this.id = id;
	}
	/**
	 * @return the msgFromId
	 */
	public String getMsgFromId() {
		return MsgFromId;
	}
	/**
	 * @param msgFromId the msgFromId to set
	 */
	public void setMsgFromId(String msgFromId) {
		MsgFromId = msgFromId;
	}
	/**
	 * @return the msgToId
	 */
	public String getMsgToId() {
		return MsgToId;
	}
	/**
	 * @param msgToId the msgToId to set
	 */
	public void setMsgToId(String msgToId) {
		MsgToId = msgToId;
	}
	/**
	 * @return the serviceId
	 */
	public String getServiceId() {
		return ServiceId;
	}
	/**
	 * @param serviceId the serviceId to set
	 */
	public void setServiceId(String serviceId) {
		ServiceId = serviceId;
	}
	/**
	 * @return the notificationType
	 */
	public String getNotificationType() {
		return NotificationType;
	}
	/**
	 * @param notificationType the notificationType to set
	 */
	public void setNotificationType(String notificationType) {
		NotificationType = notificationType;
	}
	/**
	 * @return the notificationStatus
	 */
	public String getNotificationStatus() {
		return NotificationStatus;
	}
	/**
	 * @param notificationStatus the notificationStatus to set
	 */
	public void setNotificationStatus(String notificationStatus) {
		NotificationStatus = notificationStatus;
	}
	
	
	
	
	/**
	 * @return the msgGenerator
	 */
	public String getMsgGenerator() {
		return MsgGenerator;
	}
	/**
	 * @param msgGenerator the msgGenerator to set
	 */
	public void setMsgGenerator(String msgGenerator) {
		MsgGenerator = msgGenerator;
	}
	/**
	 * @return the notificationContent
	 */
	public String getNotificationContent() {
		return NotificationContent;
	}
	/**
	 * @param notificationContent the notificationContent to set
	 */
	public void setNotificationContent(String notificationContent) {
		NotificationContent = notificationContent;
	}




	@Id
	private ObjectId id;
	@Property ("MsgFromId")
	private String MsgFromId;
	@Property("MsgToId")
	private String MsgToId;
	@Property ("ServiceId")
	private String ServiceId;
	@Property ("NotificationType")
	private String NotificationType;
	@Property ("NotificationStatus")
	private String NotificationStatus;
	@Property ("MsgGenerator")
	private String MsgGenerator;
	
	@Transient
	private String NotificationContent;
	
		
	
	public void notificationContentGenerator()
	{
		NotificationContent=new String(MsgGenerator);
		switch(NotificationType)
		{
		case "5":
			NotificationContent+=new String(" accepted cost updation.");
			break;
		case "6":
			NotificationContent+=new String(" rejected cost updation.");
			break;
		case "9":
			NotificationContent+=new String(" accepted drop request.");
			break;
		case "8":
			NotificationContent+=new String(" requested a drop service for vehicle.");
			break;
		case "3":
			NotificationContent+=new String(" accepted pickup request of vehicle.");
			break;
		case "4":
			NotificationContent+=new String(" rejected a pickup request of vehicle call on garages contact no and communicate.");
			break;
		case "1":
			NotificationContent+=new String(" accepted a service for vehicle.");
			break;
		case "2":
			NotificationContent+=new String(" rejected a service for vehicle find another garage.");
			break;
		case "0":
			NotificationContent+=new String(" requested a service for vehicle.");
			break;
		case "7":
			NotificationContent+=new String(" completed service of vehicle.");
			break;
		}
	}
}
