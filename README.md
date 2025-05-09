# Human Resource Management System (HRMS) Database

## 📘 Project Description

This project is a **relational database system** designed to manage core human resource functions within an organization. It supports operations such as:

- Employee records management  
- Department and role assignments  
- Salary and bonus tracking  
- Attendance monitoring  
- Leave request tracking  
- Project assignments

This system is suitable for small to medium-sized businesses and serves as the backend foundation for a larger HR software solution.

> 🛠️ The database is still undergoing growth and development as part of an ongoing effort to evolve into a fully fledged Human Resource Management System.

---

## 🚀 How to Set Up / Run the Project

1. Make sure you have **MySQL** installed and running.
2. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, CLI).
3. Import the SQL file using one of the following methods:

### Using CLI:
```bash
mysql -u your_username -p your_database_name < hrms.sql
```

### Using MySQL Workbench:
- Open Workbench and connect to your server.
- Open the `hrms.sql` file.
- Run the entire script (or use the lightning bolt button).

---

## 🖼️ Entity Relationship Diagram (ERD)

The ERD visually represents the structure and relationships in the database.

![HRMS ERD](HRMS%20Database%20ERD.png)

---

## 📁 Files in This Repository

- `hrms.sql` – The full SQL script to create the HRMS database with sample data.
- `HRMS Database ERD.png` – The visual Entity Relationship Diagram of the database schema.

---

## 📌 Future Enhancements

- Add user authentication and role-based access
- Integrate payroll processing logic
- Automate leave approval workflows
- Implement audit logging for data changes

---

Feel free to fork, contribute, or suggest improvements.
