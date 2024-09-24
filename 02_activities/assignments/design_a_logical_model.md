# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

Please find the Entity Relationship diagram below;
![assignment_SQL](https://github.com/user-attachments/assets/af417aa0-1503-446f-85ab-04411defe9fd)
Entities and Relationships:

## Employee ➔ Order

**Relation: One-to-Many**
#### Key: EmployeeID in Order (Foreign Key)
### Description: Each order is handled by one employee, but each employee can handle many orders.

## Customer ➔ Order
**Relation: One-to-Many**
Key: CustomerID in Order (Foreign Key)
### Description: A customer can place multiple orders, but each order is associated with only one customer.

Order ➔ OrderDetails

Relation: One-to-Many

Key: OrderID in OrderDetails (Foreign Key)

Description: An order can contain multiple books (items), but each order detail is linked to one specific order.

Book ➔ OrderDetails

Relation: One-to-Many

Key: BookID in OrderDetails (Foreign Key)

Description: A book can appear in multiple order details (i.e., sold in many orders), but each entry in order details represents a specific book.

Order ➔ Sales

Relation: One-to-Many

Key: OrderID in Sales (Foreign Key)

Description: Each order generates sales records for the books in the order. A single order can lead to multiple sales records (one for each book sold).

Book ➔ Sales

Relation: One-to-Many

Key: BookID in Sales (Foreign Key)

Description: Each book can appear in multiple sales records, but each sales record is for a specific book sold in an order.

Date ➔ Order

Relation: One-to-Many

Key: DateID in Order (Foreign Key)

Description: Each order is associated with a specific date, but each date can have many orders.

Summary of Foreign Keys:

EmployeeID in Order references Employee.

CustomerID in Order references Customer.

OrderID in OrderDetails references Order.

BookID in OrderDetails references Book.

OrderID in Sales references Order.

BookID in Sales references Book.

DateID in Order references Date.

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

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
```
Your answer...
```

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
