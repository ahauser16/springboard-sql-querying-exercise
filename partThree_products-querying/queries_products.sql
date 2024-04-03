-- Comments in SQL Start with dash-dash --
--1. Add a product to the table with the name of “chair”, price of 44.00, and can_be_returned of false.

INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);

--2. Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.

INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);

--3. Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of true.

INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, true);

--4. Display all of the rows and columns in the table.

SELECT * FROM products;

--5. Display all of the names of the products.

SELECT name FROM products;

--6. Display all of the names and prices of the products.

SELECT name, price FROM products;

--7. Add a new product - make up whatever you would like!

INSERT INTO products (name, price, can_be_returned) VALUES ('couch', 399.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('lamp', 19.99, false);

INSERT INTO products (name, price, can_be_returned) VALUES ('rug', 89.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('desk', 199.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('bookshelf', 149.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('dresser', 299.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('nightstand', 49.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('mirror', 29.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('end table', 59.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('coffee table', 99.00, true);

INSERT INTO products (name, price, can_be_returned) VALUES ('tv stand', 79.00, true);

--8. Display only the products that can_be_returned

SELECT * FROM products WHERE can_be_returned = true;
SELECT name FROM products WHERE can_be_returned = true;

--9. Display only the products that have a price less than 44.00.
SELECT * FROM products WHERE price < 44.00;
SELECT * FROM products WHERE price < 44;

--10. Display only the products that have a price in between 22.50 and 99.99.

SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

--11. There’s a sale going on: Everything is $20 off! Update the database accordingly.

UPDATE products SET price = price - 20 WHERE price >= 20;

--12. Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.

DELETE FROM products WHERE price < 25;

--13. And now the sale is over. For the remaining products, increase their price by $20.

UPDATE products SET price = price + 20;

--14. There is a new company policy: everything is returnable. Update the database accordingly.

UPDATE products SET can_be_returned = true;
