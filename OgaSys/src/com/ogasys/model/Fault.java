package com.ogasys.model;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Property;
@Entity(value="fault")
public class Fault {
	@Override
	public String toString() {
		return "Fault [faultId=" + faultId + ", faultname=" + faultname + ", type=" + type + ", desc=" + desc
				+ ", packagetype=" + packagetype + "]";
	}
	@Id
	String faultId;
	@Property("FaultName")
	String faultname;
	@Property("FaultType")
	String type;
	@Property("Desc")
	String desc;
	@Property("package")
	String packagetype;
	
	public String getFaultname() {
		return faultname;
	}
	public void setFaultname(String faultname) {
		this.faultname = faultname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPackagetype() {
		return packagetype;
	}
	public void setPackagetype(String packagetype) {
		this.packagetype = packagetype;
	}
	
	
}
