# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

Please find the Entity Relationship diagram below;
![assignment_SQL](https://github.com/user-attachments/assets/af417aa0-1503-446f-85ab-04411defe9fd)
Entities and Relationships:

## Employee ➔ Order

**Relation: One-to-Many**
**Key: EmployeeID in Order (Foreign Key)**
***Description: Each order is handled by one employee, but each employee can handle many orders.***

## Customer ➔ Order
**Relation: One-to-Many**
**Key: CustomerID in Order (Foreign Key)**
***Description: A customer can place multiple orders, but each order is associated with only one customer.***

## Order ➔ OrderDetails
**Relation: One-to-Many**
**Key: OrderID in OrderDetails (Foreign Key)**
***Description: An order can contain multiple books (items), but each order detail is linked to one specific order.***

## Book ➔ OrderDetails
**Relation: One-to-Many**
**Key: BookID in OrderDetails (Foreign Key)**
***Description: A book can appear in multiple order details (i.e., sold in many orders), but each entry in order details represents a specific book.***

## Order ➔ Sales
**Relation: One-to-Many**
**Key: OrderID in Sales (Foreign Key)**
***Description: Each order generates sales records for the books in the order. A single order can lead to multiple sales records (one for each book sold).***

## Book ➔ Sales
**Relation: One-to-Many**
**Key: BookID in Sales (Foreign Key)**
***Description: Each book can appear in multiple sales records, but each sales record is for a specific book sold in an order.***

## Date ➔ Order
**Relation: One-to-Many**
**Key: DateID in Order (Foreign Key)**
***Description: Each order is associated with a specific date, but each date can have many orders.***

## Summary of Foreign Keys:
- EmployeeID in Order references Employee.
- CustomerID in Order references Customer.
- OrderID in OrderDetails references Order.
- BookID in OrderDetails references Book.
- OrderID in Sales references Order.
- BookID in Sales references Book.
- DateID in Order references Date.

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.


![assignment_SQL2](https://github.com/user-attachments/assets/f3d5cf70-54e0-4278-91d5-1fb93da243e1)

## Shift Management: Employee, Shifts, and Dates

#### **Employee** ➔ **Employee_Shift**
- **Relation**: One-to-Many
- **Foreign Key**: `EmployeeID` in **Employee_Shift**
- **Description**: An employee can be assigned to multiple shifts, but each shift assignment is linked to one employee.

#### **Shift** ➔ **Employee_Shift**
- **Relation**: One-to-Many
- **Foreign Key**: `ShiftID` in **Employee_Shift**
- **Description**: A shift (e.g., morning or evening) can be assigned to many employees, but each shift assignment entry relates to one specific shift.

#### **Date** ➔ **Employee_Shift**
- **Relation**: One-to-Many
- **Foreign Key**: `DateID` in **Employee_Shift**
- **Description**: Each shift assignment happens on a specific date, and one date can have many shift assignments (for different employees or shifts).

---

### Foreign Key Summary
- `EmployeeID` in **Order** references **Employee**.
- `CustomerID` in **Order** references **Customer**.
- `OrderID` in **OrderDetails** references **Order**.
- `BookID` in **OrderDetails** references **Book**.
- `OrderID` in **Sales** references **Order**.
- `BookID` in **Sales** references **Book**.
- `DateID` in **Order** references **Date**.
- `EmployeeID` in **Employee_Shift** references **Employee**.
- `ShiftID` in **Employee_Shift** references **Shift**.
- `DateID` in **Employee_Shift** references **Date**.

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?

## Question 4: Comparison to the AdventureWorks Schema

From the **AdventureWorks** schema, the main difference is on the **purchasing** and **production** side. Since this is a bookstore, I never considered the **production** aspect, but AdventureWorks clearly includes that. This makes sense for a company involved in manufacturing, but for a bookstore, this isn't necessary.

In terms of **purchasing**, AdventureWorks keeps records of **vendor** and **shipment** details. For my model, I imagined a small, local bookstore that doesn’t have an online store or large vendor management needs, so I kept things simple. 

I also liked the detailed approach to the **HR** side in AdventureWorks, which includes employee records, shift management, and sales tracking. This could be very useful if our bookstore decides to expand. For a small shop, the model I created works well, but if the store grows, adopting some of the more detailed elements from AdventureWorks—such as vendor tracking and advanced HR features—would be beneficial.

Overall, I aimed to imitate a **small, local bookstore**, but for future growth, the **AdventureWorks** model is definitely well-designed and could inspire improvements to my own.


# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
