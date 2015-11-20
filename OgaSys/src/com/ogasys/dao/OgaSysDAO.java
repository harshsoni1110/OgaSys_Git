package com.ogasys.dao;

import java.util.List;

import org.bson.types.ObjectId;

import com.ogasys.model.User;

public interface OgaSysDAO {

   //public boolean insertContact(ContactUsModel model) throws SQLException;
  // public boolean update(Book bk) throws SQLException;
  // public Book findByID(String id) throws SQLException;
  // public boolean delete(String isbn) throws SQLException;
  // public ArrayList<Book> getAll() throws SQLException;
     public void getUser();
     public void insertUser(User u);
     public List<User> getUserDetailsById(Object id);
}
