CREATE TABLE supplier/farmer
(
  sup_ID INT NOT NULL,
  middle_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  first_name VARCHAR(10) NOT NULL,
  city VARCHAR(10) NOT NULL,
  zip INT NOT NULL,
  street VARCHAR(20) NOT NULL,
  PRIMARY KEY (sup_ID)
);

CREATE TABLE staff/worker
(
  stf_ID INT NOT NULL,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  middle_name VARCHAR(10) NOT NULL,
  city VARCHAR(10) NOT NULL,
  street VARCHAR(20) NOT NULL,
  zip INT NOT NULL,
  state VARCHAR(20) NOT NULL,
  date_of_joining DATE NOT NULL,
  position VARCHAR(10) NOT NULL,
  DOB DATE NOT NULL,
  PRIMARY KEY (stf_ID)
);

CREATE TABLE Retailer/customer
(
  c_ID INT NOT NULL,
  city VARCHAR(10) NOT NULL,
  apt_number VARCHAR(20) NOT NULL,
  street VARCHAR(20) NOT NULL,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  Max_credit INT NOT NULL,
  PRIMARY KEY (c_ID)
);

CREATE TABLE pdt_type/cat
(
  pt_ID INT NOT NULL,
  name VARCHAR(10) NOT NULL,
  PRIMARY KEY (pt_ID)
);

CREATE TABLE payment
(
  pay_id INT NOT NULL,
  payment_sattus VARCHAR(10) NOT NULL,
  PRIMARY KEY (pay_id)
);

CREATE TABLE supplier/farmer_phone_no
(
  phone_no INT NOT NULL,
  sup_ID INT NOT NULL,
  PRIMARY KEY (phone_no, sup_ID),
  FOREIGN KEY (sup_ID) REFERENCES supplier/farmer(sup_ID)
);

CREATE TABLE Retailer/customer_phone_no
(
  phone_no INT NOT NULL,
  c_ID INT NOT NULL,
  PRIMARY KEY (phone_no, c_ID),
  FOREIGN KEY (c_ID) REFERENCES Retailer/customer(c_ID)
);

CREATE TABLE Product/stock
(
  p_ID INT NOT NULL,
  name VARCHAR(10) NOT NULL,
  type/cat VARCHAR(10) NOT NULL,
  unit_price NUMERIC(10,2) NOT NULL,
  quality VARCHAR(10) NOT NULL,
  quantity INT NOT NULL,
  delivery_date DATE NOT NULL,
  pt_ID INT NOT NULL,
  sup_ID INT NOT NULL,
  PRIMARY KEY (p_ID),
  FOREIGN KEY (pt_ID) REFERENCES pdt_type/cat(pt_ID),
  FOREIGN KEY (sup_ID) REFERENCES supplier/farmer(sup_ID)
);

CREATE TABLE Order
(
  o_ID INT NOT NULL,
  total_price NUMERIC(10,2) NOT NULL,
  date_of_order DATE NOT NULL,
  ordered_pdt_name VARCHAR(10) NOT NULL,
  pay_id INT NOT NULL,
  c_ID INT NOT NULL,
  stf_ID INT NOT NULL,
  PRIMARY KEY (o_ID, pay_id),
  FOREIGN KEY (pay_id) REFERENCES payment(pay_id),
  FOREIGN KEY (c_ID) REFERENCES Retailer/customer(c_ID),
  FOREIGN KEY (stf_ID) REFERENCES staff/worker(stf_ID)
);

CREATE TABLE pdt_order
(
  o_ID INT NOT NULL,
  pay_id INT NOT NULL,
  p_ID INT NOT NULL,
  PRIMARY KEY (o_ID, pay_id, p_ID),
  FOREIGN KEY (o_ID, pay_id) REFERENCES Order(o_ID, pay_id),
  FOREIGN KEY (p_ID) REFERENCES Product/stock(p_ID)
);