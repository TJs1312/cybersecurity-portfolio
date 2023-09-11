# Apply Filters to SQL queries

### Project description

My organization is working to make their system more secure. It is my job to ensure the system is safe, investigate all potential security issues, and update employee computers as needed. The following steps provide examples of how I used SQL with filters to perform security-related tasks.

### Retrieve after hours failed login attempts

The organization recently discovered a potential security incident that occurred after business hours. To investigate this, a query to the **log_in_attempts** is needed, using filters to identify all failed login attempts that occurred after 18:00.

Filters will focus on : 
- **login_time**: The time the login attempt was recorded
- **success**: The success of the login attempt; 0 indicates a failed attempt

![SQL queries 1st screenshot](https://drive.google.com/uc?export=view&id=1FZrXgaLY_VlPUbn_oiu0kSLTtTBDhzmy)

We selected all the columns from the **log_in_attempts** table using the filter conditions where and  and where **login_time** is less than 18:00 and success is equal to 0 (failed login attempt)

### Retrieve login attempts on specific dates

A suspicious event occurred on 2022-05-09. To investigate this event, all login attempts which occurred on this day and the day before have to be reviewed. The date of the login attempt is found in the **login_date** column.

![SQL queries 2nd screenshot](https://drive.google.com/uc?export=view&id=)

We selected all the columns from the **log_in_attempts** table using the filter conditions **where** and **or** on the **login_date** column to identify the login attempts that occurred on 2022-05-09 or 2022-05-08.

### Retrieve login attempts outside of Mexico

There’s been suspicious activity with login attempts, but the team has determined that this activity didn't originate in Mexico. This time, the specific **country** column will be the focus of our query.

![SQL queries 3rd screenshot]()

We selected all the columns from the **log_in_attempts** table using the filter conditions **where** and **not** on the **country** column, while also specifying the **filter** condition like followed by **MEX%** to get out of the query all the MEX- enquiries.

### Retrieve employees in Marketing

The cybersecurity team wants to perform security updates on specific employee machines in the Marketing department from the East office. This time, the **employees** table will be query. 

Filters will focus on : 
- **department**: The department the employee is in
- **office**: The office the employee is located in

![SQL queries 4th screenshot]()

We selected all the columns from the **employees** table using the filter conditions **where** and **and** on the **department** column and the **office** column, while also specifying the filter condition **like** followed by **East%** to focus on the East office.

### Retrieve employees in Finance or Sales

The cybersecurity team now needs to perform a different security update on machines for employees in the Sales and Finance departments. 

![SQL queries 5th screenshot]()

We selected all the columns from the **employees** table using the filter conditions **where** and **or** on the **department** column.

### Retrieve all employees not in IT

The cybersecurity team needs to make one more update to employee machines. The employees who are in the Information Technology department already had this update, but employees in all other departments need it.

![SQL queries 6th screenshot]()

The first part of the screenshot is my query, and the second part is a portion of the output. The query returns all employees not in the Information Technology department. First, I started by selecting all data from the employees table. Then, I used a **WHERE** clause with **NOT** to filter for employees not in this department.

### Summary

I applied filters to SQL queries to get specific information on login attempts and employee machines. I used two different tables, **log_in_attempts** and **employees**. I used the **AND**, **OR**, and **NOT** operators to filter for the specific information needed for each task. I also used **LIKE** and the percentage sign (%) wildcard to filter for patterns.
