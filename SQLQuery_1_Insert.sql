--INSERT

INSERT INTO genders_lookup
VALUES
('Male'),
('Female'),
('Transgender'),
('other')


INSERT INTO state_lookup(state_name,state_code)
VALUES 
       ('Alabama', 'AL'),
       ('Alaska', 'AK'),
       ('Arizona', 'AZ'),
       ('Arkansas', 'AR'),
       ('California', 'CA'),
       ('Colorado', 'CO'),
       ('Connecticut', 'CT'),
       ('Delaware', 'DE'),
       ('District of Columbia', 'DC'),
       ('Florida', 'FL'),
       ('Georgia', 'GA'),
       ('Hawaii', 'HI'),
       ('Idaho', 'ID'),
       ('Illinois', 'IL'),
       ('Indiana', 'IN'),
       ('Iowa', 'IA'),
       ('Kansas', 'KS'),
       ('Kentucky', 'KY'),
       ('Louisiana', 'LA'),
       ('Maine', 'ME'),
       ('Maryland', 'MD'),
       ('Massachusetts', 'MA'),
       ('Michigan', 'MI'),
       ('Minnesota', 'MN'),
       ('Mississippi', 'MS'),
       ('Missouri', 'MO'),
       ('Montana', 'MT'),
       ('Nebraska', 'NE'),
       ('Nevada', 'NV'),
       ('New Hampshire', 'NH'),
       ('New Jersey', 'NJ'),
       ('New Mexico', 'NM'),
       ('New York', 'NY'),
       ('North Carolina', 'NC'),
       ('North Dakota', 'ND'),
       ('Ohio', 'OH'),
       ('Oklahoma', 'OK'),
       ('Oregon', 'OR'),
       ('Pennsylvania', 'PA'),
       ('Rhode Island', 'RI'),
       ('South Carolina', 'SC'),
       ('South Dakota', 'SD'),
       ('Tennessee', 'TN'),
       ('Texas', 'TX'),
       ('Utah', 'UT'),
       ('Vermont', 'VT'),
       ('Virginia', 'VA'),
       ('Washington', 'WA'),
       ('West Virginia', 'WV'),
       ('Wisconsin', 'WI'),
       ('Wyoming', 'WY');

Insert into customer_login_details(customer_login_id, pass)
VALUES
('Kevin', '1969'),
('Shrish', '2001'),
('Coop', '1996'),
('LeoH', '1998')

--Using procedure to insert the policy type and policy subtypes
EXEC p_policy_add 'Life'
EXEC p_policy_add 'Health'

--Exec p_policy_add 'MedPlus'

-- select * from policy_types
-- select * from policy_subtypes

insert into family
VALUES ('Cooper', 'Coop', '3'),
('Hofstader', 'LeoH','3')

insert into premiumcustomers
values ('Sheldon', 'Cooper', '10-12-1996', 13210, 315886754, 1, 2, 1, 'ShellyCopp@gmail.com', NULL, 'NY', 'Coop', 1),
('Hofstader', 'Leonard', '11-11-1998', 13210, 315886759, 2, 2, 1, 'HofLeone@gmail.com', Null,'NY', 'LeoH', 2)

Insert into customers 
values ('Shrish', 'Vaidya', '12-31-2000', 13210, 315886754, 1, 2, 1, 'Shrish._Vaidya@gmail.com', NULL, 'NY', 'Shrish'),
('Kevin', 'Weiss', '12-07-2000', 13210, 315887755, 2, 1, 1, 'KWeiss@gmail.com', Null, 'NY', 'Kevin')

insert into department_lookup(department_name) VALUES ('Premium'), ('Non-Premium')

Insert INTO admins
VALUES
('Manager', 101, 'Rutvij', 'Patil', '06/12/1998'),
('Boss', 102, 'Rohan', 'Bhowmick', '07/15/2000')


insert INTO admins_login_details values
(101,1001,1,'Boss'),
(102,1002,2,'Manager')


select * from admins
select * from admins_login_details


-- --using the procedure to add the new admin
-- -- Assigning the new admin department Premium(1)
-- Exec p_upsert_admin 'Head Manager', 'Phoebe', 'Buffay', '11-23-1982','1007', 1

-- -- Assigning the new admin department Non-Premium(2)
-- Exec p_upsert_admin 'Employee', 'Adams', 'Ken', '12-23-1982','1008', 2

-- -- Assigning the old admin additional department
-- Exec p_upsert_admin 'Head Manager', 'Phoebe', 'Buffay', '11-23-1982','1007', 2

-- select * from admins
-- select * from admins_login_details

-- select * from premiumcustomers
-- select * from customers


INSERT INTO disease(disease_name)
VALUES
('Malaria'),
('Typhoid'),
('Car Accident');

INSERT into approval_status values (1,'Approved'), (2,'Rejected')

insert into pending_requests
VALUES('Shrish', 'Vaidya', '12-31-2000', 1, 315886754, '12/09/2022', 450, 1, 'Shrish', 'Non-Premium', Null, Null, Null, NULL),
('Shrish', 'Vaidya', '12-31-2000', 1, 315886754, '11/06/2022', 560, 3, 'Shrish', 'Non-Premium', Null, Null, Null, NULL),
('Shrish', 'Vaidya', '12-31-2000', 1, 315886754, '11/05/2022', 540, 2, 'Shrish', 'Non-Premium', Null, Null, Null, NULL),
('Sheldon', 'Cooper', '10-12-1996', 1, 315886754, '12/09/2022', 550, 2, 'Coop', 'Premium', NULL, Null, Null, NULL),
('Sheldon', 'Cooper', '10-12-1996', 1, 315886754, '11/07/2022', 560, 3, 'Coop', 'Premium', NULL, Null, Null, NULL),
('Sheldon', 'Cooper', '10-12-1996', 1, 315886754, '11/08/2022', 505, 1, 'Coop', 'Premium', NULL, Null, Null, NULL)



--For insertion off approved and declined request we use the trigger that will add into approve and disaprove request according to what the admin does on the front end
update pending_requests set amount_approved = 425, approval_id = 1, request_reviewed_by = 'Manager' where request_customer_login_id = 'Shrish' and request_id = 1
update pending_requests set approval_id = 2, request_reviewed_by = 'Manager', rejected_reason = 'xyz' where request_customer_login_id = 'Shrish' and request_id = 2
update pending_requests set amount_approved = 500, approval_id = 1, request_reviewed_by = 'Boss' where request_customer_login_id = 'Coop' and request_id = 4
update pending_requests set approval_id = 2, request_reviewed_by = 'Boss', rejected_reason = 'abc' where request_customer_login_id = 'Coop' and request_id = 5

--Update pending_requests set amount_approved = 500,approval_id = 1, request_reviewed_by = 'Manager' where request_customer_login_id = 'Shrish' and request_id = 3
--Update pending_requests set approval_id = 2, request_reviewed_by = 'Boss', rejected_reason = 'abc' where request_customer_login_id = 'don1' and request_id = 7

-- select * from pending_requests
-- select * from approved_requests
-- select * from decline_requests
select * from new_customer_requests

insert into new_customer_requests 
values('TomH', 'Tom', 'Hardy', '12/06/1999', 1, 'TharDy@gmail.com', 'NY', 13210, 315886758, 1 , 2, 1, NULL, Null),
    ('PenG', 'Penny', 'Green', '12/08/1993', 2, 'Peng@gmail.com', 'NY', 13210, 315886756, 2, 2, 3, NULL, Null),
    ('MelRa', 'Melissa', 'Rauch', '12/15/1986', 3, 'MelissaR@gmail.com','NY', 13210, 315886759, 1, 1, 4, null, Null),
    ('JarrodS', 'Jarrod', 'Sally', '12/18/1989', 4, 'JarrodS@gmail.com', 'NY', 13210, 315886754, 2, 1, 3, Null, NULL)

update new_customer_requests set approval_status_id = 1, department_id = 1 WHERE requested_login_id = 'PenG'
update new_customer_requests set approval_status_id = 2, department_id = 2 where requested_login_id = 'TomH'


--Using triggers to seggrigate new customers into customers and premium customers TRIGGER 1


-- update new_customer_requests set approval_status_id = 1, department_id = 1 where requested_login_id = 'shane124'
-- update new_customer_requests set approval_status_id = 2 where requested_login_id = 'MelRa'

-- select * from premiumcustomers
-- SELECT * from customer_login_details
-- select * from customers

select * from disease

select * from decline_requests
