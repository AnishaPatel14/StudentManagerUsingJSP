
package com.dbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dto.Student;
import com.dto.UserInfo;

public class DBServices 
{
	Connection con=null;
	public DBServices() 
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/jitnajava?"
			+ "user=root&password=root");
		}
		catch (Exception e) 
		{
			System.out.println("Error in loading drivers and making connection");
		}
	}
	
	//register student
	public int registerUser(UserInfo u) {
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"insert into userinfo"
			+ " values(?,?)");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
		
			x = ps.executeUpdate();
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return x;
	}

	public boolean checkUser(UserInfo u)
	{
		boolean isValid=false;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"select * from userinfo"
			+ " where username = ? and password = ?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next()==true)
			{
				isValid = true;
			}
			else
			{
				isValid = false;
			}
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return isValid;
	}
	
	public int addStudent(Student s)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"insert into studentdata"
			+ " values(?,?,?)");
			ps.setInt(1, s.getRoll());
			ps.setString(2, s.getName());
			ps.setDouble(3, s.getMarks());
			x = ps.executeUpdate();
			
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return x;
	}
	
	
	public int modifyStudent(Student s)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"update studentdata set sname = ?, marks = ? where rollno = ?");
			
			ps.setString(1, s.getName());
			ps.setDouble(2, s.getMarks());
			ps.setInt(3, s.getRoll());
			x = ps.executeUpdate();
			
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return x;
	}
	public int deleteStudent(Student s)
	{
		int x=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"delete from studentdata where rollno = ?");
			
			ps.setInt(1, s.getRoll());
			x = ps.executeUpdate();
			
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return x;
	}
	public ArrayList<Student> getAllStudents()
	{
		ArrayList<Student>al = new ArrayList<Student>();
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"select * from studentdata");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				Student s = new Student();
				s.setRoll(rs.getInt("rollno"));
				s.setName(rs.getString("sname"));
				s.setMarks(rs.getDouble("marks"));
				al.add(s);
			}
			
			
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return al;
	}
	public Student getStudent(int rno)
	{
		Student s = new Student();
		try 
		{
			PreparedStatement ps = con.prepareStatement(
			"select * from studentdata where rollno = ?");
			ps.setInt(1, rno);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()==true)
			{
				
				s.setRoll(rs.getInt("rollno"));
				s.setName(rs.getString("sname"));
				s.setMarks(rs.getDouble("marks"));
			}
			
			
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return s;
	}
	
	
}




