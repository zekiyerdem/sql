# Homework 1: farmersmarket.db
#Zekiye_Erdem_edition
#Date: 11-09-2024

A logical data model must contain:
- table name
- column names
- relationship type

In this homework, I have selected "Customer" and "Customer-purchases' Tables:
- "Customer", "Customer_Purchases"
- Column names addressed in the diagram along with the datatypes
- There is a one-to-many relationship between those tables because one customer can make many purchases.

Please find the diagram below;




<img width="506" alt="homework_1" src="https://github.com/user-attachments/assets/d7ca94c3-6c24-4b54-9559-dd81a45c3b83">


Please do not pick the exact same tables that I have already diagramed. For example, you shouldn't diagram the relationship between `product` and `product_category`, but you could diagram `product` and `customer_purchases`.

**A few hints**:
- You will need to use the Browse Data tab in the main window to figure out the relationship types.
- You can't diagram tables that don't share a common column
	- These are the tables that are connected
	-  ![01_farmers_market_conceptual_model.png](./images/01_farmers_market_conceptual_model.png)
- The column names can be found in a few spots (DB Schema window in the bottom right, the Database Structure tab in the main window by expanding each table entry, at the top of the Browse Data tab in the main window)

