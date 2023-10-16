
-- down

Go
drop function if EXISTS f_number
GO
drop trigger if exists t_requests_trigger
GO
drop TRIGGER if exists t_new_customer_requests_trigger
GO
drop procedure if exists p_upsert_admin
GO
drop procedure if EXISTS p_policy_add
GO
drop function if exists f_concat
GO
--up

GO

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_premiumcustomers_customer_state_code')
    alter table premiumcustomers drop constraint fk_premiumcustomers_customer_state_code
if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_premiumcustomers_customer_customer_login_id')
    alter table premiumcustomers drop constraint fk_premiumcustomers_customer_customer_login_id
if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_premiumcustomers_customer_gender_id')
    alter table premiumcustomers drop constraint fk_premiumcustomers_customer_gender_id
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where constraint_name = 'fk_premiumcustomers_customer_policy_type_id')
    alter table premiumcustomers drop CONSTRAINT fk_premiumcustomers_customer_policy_type_id
if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME = 'fk_premiumcustomers_customer_policy_sub_type_id')
    alter table premiumcustomers drop CONSTRAINT fk_premiumcustomers_customer_policy_sub_type_id
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where constraint_name = 'fk_premiumcustomers_family_id')
    alter table premiumcustomers drop constraint fk_premiumcustomers_family_id

drop table if exists premiumcustomers

if exists (select * from information_schema.TABLE_CONSTRAINTS
    where constraint_name = 'fk_fmaily_family_customer_login_id')
    alter table family drop constraint fk_family_family_customer_login_id

drop table if exists family


if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_customers_customer_state_code')
    alter table customers drop constraint fk_customers_customer_state_code
if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_customers_customer_customer_login_id')
    alter table customers drop constraint fk_customers_customer_customer_login_id
if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_customers_customer_gender_id')
    alter table customers drop constraint fk_customers_customer_gender_id
if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where constraint_name = 'fk_customers_customer_policy_type_id')
    alter table customers drop CONSTRAINT fk_customers_customer_policy_type_id
if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME = 'fk_customers_customer_policy_sub_type_id')
    alter table customers drop CONSTRAINT fk_customers_customer_policy_sub_type_id
drop table if exists customers


GO

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_pending_requests_request_customer_gender_id')
    alter table pending_requests drop constraint fk_pending_requests_request_customer_gender_id
if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_pending_requests_disease_id')
    alter table pending_requests drop constraint fk_pending_requests_disease_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_NAME = 'fk_pending_requests_request_customer_login_id')
    alter table pending_requests drop CONSTRAINT fk_pending_requests_request_customer_login_id

if EXISTS(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME = 'fk_pending_requests_request_reviewed_by')
    alter table pending_requests drop CONSTRAINT fk_pending_requests_request_reviewed_by

if EXISTS (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where constraint_name = 'fk_pending_requests_approval_request_id')
    alter table pending_requests drop constraint fk_pending_requests_approval_request_id

drop table if exists pending_requests
GO


drop table if exists disease
GO

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_approved_requests_approved_request_by')
    alter table approved_requests drop constraint fk_approved_requests_approved_request_by

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_approved_requests_customer_gender_id')
    alter table approved_requests drop constraint fk_approved_requests_customer_gender_id

if exists (select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where constraint_name = 'fk_approved_requests_customer_login_id')
    alter TABLE approved_requests drop constraint fk_approved_requests_customer_login_id

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_decline_requests_decline_request_by')
    alter table decline_requests drop constraint fk_decline_requests_decline_request_by

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_decline_requests_decline_request_customer_gender_id')
    alter table decline_requests drop constraint fk_decline_requests_decline_customer_gender_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where constraint_name = 'fk_admins_login_details_admin_login_id')
    alter table admins_login_details drop constraint fk_admins_login_details_admin_login_id

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_admins_login_details_admin_department_id')
    alter table admins_login_details drop constraint fk_admins_login_details_admin_department_id

drop table if exists admins_login_details
drop table if exists department_lookup

DROP TABLE IF EXISTS admins






drop table if EXISTS approved_requests

drop table if exists decline_requests

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_new_customer_requests_customer_gender_id')
    alter table new_customer_requests drop constraint fk_new_customer_requests_customer_gender_id

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_new_customer_requests_policy_type')
    alter table new_customer_requests drop constraint fk_new_customer_requests_policy_type

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_new_customer_requests_policy_sub_type')
    alter table new_customer_requests drop constraint fk_new_customer_requests_policy_sub_type

if exists(select * from information_schema.table_constraints
    where constraint_name = 'fk_new_customer_requests_state_code')
    alter table new_customer_requests drop constraint fk_new_customer_requests_state_code
drop TABLE if EXISTS new_customer_requests
drop table if exists genders_lookup


if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME = 'fk_policy_subtypes_policy_type_id')
    alter table policy_subtypes drop CONSTRAINT fk_policy_subtypes_policy_type_id


drop table if exists policy_types
drop table if exists policy_subtypes
DROP TABLE IF EXISTS customer_login_details
drop table if exists approval_status
drop TABLE if EXISTS state_lookup


-- UP
CREATE TABLE genders_lookup(
    gender_id int IDENTITY not null,
    gender varchar(20) not null

    constraint u_genders_lookup_gender UNIQUE (gender_id)
);

CREATE TABLE customer_login_details (
    customer_login_id VARCHAR(20) NOT NULL,
    pass VARCHAR(12) NOT NULL,

    CONSTRAINT pk_customer_login_details_customer_login_id PRIMARY Key(customer_login_id)
)

CREATE TABLE admins (
    admin_login_id VARCHAR(20) NOT NULL,
    employee_id int not null,
    employee_fname varchar(20) not null,
    employee_lname varchar(20) not null,
    employee_dob date not null,

    CONSTRAINT pk_admins_admin_login_id PRIMARY Key(admin_login_id)
)

CREATE TABLE state_lookup (
    state_code CHAR(2) NOT NULL,
    state_name VARCHAR(50) NOT NULL,

    CONSTRAINT pk_state_lookup_state_code PRIMARY Key(state_code)
)


create table disease
(
    disease_id int identity not null,
    disease_name varchar(100) not NULL,

    CONSTRAINT pk_disease_disease_id primary key(disease_id)
)




create table approval_status(
    approval_status_id  int not null,
    approval_status varchar(50),

    constraint pk_approval_status_approval_status_id PRIMARY KEY(approval_status_id)

)
-- alter table pending_requests
--     add constraint fk_pending_requests_disease_id foreign key (disease_id)
--         references disease(disease_id)

-- alter table pending_requests
--     add CONSTRAINT fk_pending_requests_request_customer_gender_id foreign key(request_customer_gender_id)
--         references genders_lookup(gender_id)



GO

create table department_lookup
(
    department_id int IDENTITY NOT null,
    department_name varchar(50) not null

    constraint pk_department_lookup_department_id primary KEY (department_id)
)
GO
CREATE table admins_login_details
(
    admin_employee_id int NOT null,
    pass varchar(50) not null,
    admin_department_id int not null,
    admin_login_id varchar(20) not null,

)

alter table admins_login_details
    add constraint fk_admins_login_details_admin_department_id foreign KEY (admin_department_id)
        references department_lookup(department_id)
    

alter table admins_login_details
    add constraint fk_admins_login_details_admin_login_id foreign key (admin_login_id)
        references admins(admin_login_id)

Go
CREATE TABLE pending_requests (
    request_id INT IDENTITY NOT NULL,
    request_customer_fname VARCHAR(20) NOT NULL,
    request_customer_lname VARCHAR(20) NOT NULL,
    request_customer_dob DATE NOT NULL,
    request_customer_gender_id int NOT NULL,
    request_customer_mobile_number varchar(10) NOT NULL,
    request_date DATE NOT NULL,
    amount_requested INT not NULL,
    disease_id INT not NULL,
    request_customer_login_id VARCHAR(20) NOT null,
    customer_request_type varchar(20),
    amount_approved int,
    approval_id int,
    rejected_reason varchar(100),
    request_reviewed_by varchar(20),


    CONSTRAINT pk_requests_request_id PRIMARY Key(request_id),
    constraint fk_pending_requests_disease_id foreign key (disease_id) references disease(disease_id),
    CONSTRAINT fk_pending_requests_request_customer_gender_id foreign key(request_customer_gender_id) references genders_lookup(gender_id),
    CONSTRAINT fk_pending_requests_request_customer_login_id FOREIGN key(request_customer_login_id) references customer_login_details(customer_login_id),
    CONSTRAINT fk_pending_requests_reviewed__by foreign key(request_reviewed_by) references admins(admin_login_id),
    constraint fk_pending_requests_approval_request_id foreign key(approval_id) references approval_status(approval_status_id)
)


CREATE TABLE approved_requests
(
    approved_request_id INT NOT NULL,
    customer_firstname VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_dob date not null,
    customer_gender_id int not null,
    customer_mobile_number varchar(10) not null,
    requested_amount int not NULL,
    amount_approved int not null,
    approved_request_by varchar(20) not null,
    customer_login_id varchar(20) not null,
    
    CONSTRAINT pk_approved_request_request_id primary key (approved_request_id)
);

alter table approved_requests
    add CONSTRAINT fk_approved_requests_approved_request_by foreign key (approved_request_by)
        references admins(admin_login_id)


alter table approved_requests
    add CONSTRAINT fk_approved_requests_customer_gender_id foreign key (customer_gender_id)
        REFERENCES genders_lookup(gender_id)

alter table approved_requests
    add CONSTRAINT fk_approved_requests_customer_login_id foreign key (customer_login_id)
        REFERENCES customer_login_details(customer_login_id)
GO


create table policy_types
(
    policy_type_id int identity not null,
    policy_type_name varchar(50) not NULL,

    constraint pk_policy_types_policy_type_id primary key (policy_type_id)
)

create table policy_subtypes
(
    policy_subtype_id int identity not null,
    policy_type_id int,
    policy_subtype_name varchar(50) not NULL

    constraint pk_policy_subtypes_policy_subtype_id primary key (policy_subtype_id),
    constraint fk_policy_subtypes_policy_type_id FOREIGN KEY(policy_type_id) REFERENCES policy_types(policy_type_id) 
)


GO






CREATE TABLE decline_requests
    (
        decline_request_id int not null,
        customer_firstname varchar(50) not null,
        customer_lastname varchar(50) not null,
        customer_dob date not null,
        customer_gender_id int not null,
        customer_mobile_number VARCHAR(10) not null,
		requested_amount int not null,
		decline_request_by VARCHAR(20) not null,
		decline_reason varchar(50),
    );

alter table decline_requests
    add CONSTRAINT fk_decline_requests_decline_request_by foreign key (decline_request_by)
        references admins(admin_login_id)


alter table decline_requests
    add constraint fk_decline_requests_customer_gender_id foreign key (customer_gender_id)
        references genders_lookup(gender_id)


CREATE TABLE new_customer_requests
    (
        requested_login_id varchar(20) not null,
        customer_firstname varchar(50) not null,
        customer_lastname varchar(50) not null,
        customer_dob date not null,
		customer_gender_id int not null,
		customer_email varchar(50) not null,
        state_code char(2) not null,
		zip_code int not null,
        mobile_number int not null,
		policy_type_id int not null,
        policy_sub_type_id int not null,
		family_members int not null,
        approval_status_id int,
        department_id int
        
        
        CONSTRAINT pk_new_customer_requests_customer_email primary key(customer_email),
        CONSTRAINT fk_new_customer_requests_customer_gender_id foreign key(customer_gender_id)
        REFERENCES genders_lookup(gender_id),
        CONSTRAINT fk_new_customer_requests_policy_type FOREIGN key (policy_type_id)
        REFERENCES policy_types(policy_type_id),
        CONSTRAINT fk_new_customer_requests_policy_sub_type FOREIGN key (policy_sub_type_id)
        REFERENCES policy_subtypes(policy_subtype_id),
        constraint fk_new_customer_requests_state_code FOREIGN key (state_code)
        REFERENCES state_lookup(state_code)
    );

-- alter table new_customer_requests
--     add constraint fk_new_customer_requests_customer_gender_id foreign key(customer_gender_id)
--         REFERENCES genders_lookup(gender_id)
GO


CREATE TABLE customers (
    customer_id int IDENTITY NOT NULL,
    customer_fname VARCHAR(20) NOT NULL,
    customer_lname VARCHAR(20) NOT NULL,
    customer_dob DATE NOT NULL,
    customer_zip_code int NOT NULL,
    customer_mobile_number VARCHAR(10) NOT NULL,
    customer_policy_type_id int NOT NULL,
    customer_policy_sub_type_id int Not Null,
    customer_gender_id int NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_lastpayement_date DATE,
    customer_state_code CHAR(2) NOT NULL,
    customer_customer_login_id VARCHAR(20) NOT NULL

    CONSTRAINT pk_customers_customer_id PRIMARY Key(customer_id)
)


alter table customers
    add constraint fk_customers_customer_state_code foreign key (customer_state_code)
        references state_lookup(state_code)
alter table customers
    add constraint fk_customers_customer_customer_login_id foreign key (customer_customer_login_id)
        references customer_login_details(customer_login_id)


alter table customers
    add constraint fk_customers_customer_gender_id foreign key (customer_gender_id)
        REFERENCES genders_lookup(gender_id)

alter table customers
    add CONSTRAINT fk_customers_customer_policy_type_id foreign key(customer_policy_type_id)
        references policy_types(policy_type_id)

alter table customers
    add CONSTRAINT fk_customers_customer_policy_sub_type_id foreign key(customer_policy_sub_type_id)
        references policy_subtypes(policy_subtype_id)
Go

Create table family(
    family_id int IDENTITY not null,
    family_lastname varchar(20) not null,
    family_customer_login_id varchar(20) not null,
    number_of_family_members int not null

    CONSTRAINT pk_family_family_id primary KEY (family_id)

)

alter table family
    add constraint fk_family_family_customer_login_id foreign key (family_customer_login_id)
        references customer_login_details(customer_login_id)

GO

CREATE TABLE premiumcustomers (
    customer_id int IDENTITY NOT NULL,
    customer_fname VARCHAR(20) NOT NULL,
    customer_lname VARCHAR(20) NOT NULL,
    customer_dob DATE NOT NULL,
    customer_zip_code int NOT NULL,
    customer_mobile_number VARCHAR(10) NOT NULL,
    customer_policy_type_id INT NOT NULL,
    customer_policy_sub_type_id int not null,
    customer_gender_id int NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_lastpayement_date DATE,
    customer_state_code CHAR(2) NOT NULL,
    customer_customer_login_id VARCHAR(20) NOT NULL,
    family_id int null

    CONSTRAINT pk_premiumcustomers_customer_id PRIMARY Key(customer_id)
)




alter table premiumcustomers
    add constraint fk_premiumcustomers_customer_state_code foreign key (customer_state_code)
        references state_lookup(state_code)
alter table premiumcustomers
    add constraint fk_premiumcustomers_customer_customer_login_id foreign key (customer_customer_login_id)
        references customer_login_details(customer_login_id)

alter table premiumcustomers
    add constraint fk_premiumcustomers_customer_gender_id foreign key (customer_gender_id)
        REFERENCES genders_lookup(gender_id)

alter table premiumcustomers
    add CONSTRAINT fk_premiumcustomers_customer_policy_type_id foreign key(customer_policy_type_id)
        references policy_types(policy_type_id)

alter table premiumcustomers
    add CONSTRAINT fk_premiumcustomers_customer_policy_sub_type_id foreign key(customer_policy_sub_type_id)
        references policy_subtypes(policy_subtype_id)
    
alter table premiumcustomers
    add CONSTRAINT fk_premium_customers_family_id foreign key (family_id)
        references family(family_id)


--Triggers, Procedures and user defined functions
GO
create function f_number(
    @next_num as int 
)returns int AS
BEGIN
    set @next_num += 1
    return @next_num
END

GO
-- update pending_requests set amount_approved = 425, approval_id = 1, rejected_reason = 'NA', request_reviewed_by = 'Manager'
Go

create TRIGGER t_requests_trigger
on pending_requests
after UPDATE
as BEGIN
    declare @approval_status int = (select inserted.approval_id as approval_status from inserted)
    declare @customer_loginid varchar(20) = (select inserted.request_customer_login_id as customer_loginid from inserted)
    if @approval_status = 1
    BEGIN
        insert into approved_requests(approved_request_id, customer_firstname, customer_last_name, customer_dob, customer_gender_id,customer_mobile_number, requested_amount,amount_approved, approved_request_by, customer_login_id)
        select inserted.request_id,inserted.request_customer_fname,inserted.request_customer_lname,inserted.request_customer_dob,inserted.request_customer_gender_id,inserted.request_customer_mobile_number,inserted.amount_requested,inserted.amount_approved,inserted.request_reviewed_by,inserted.request_customer_login_id from inserted
        delete from pending_requests where request_customer_login_id = @customer_loginid and approval_id = @approval_status
    END
    if @approval_status = 2
    BEGIN
        Insert into decline_requests(decline_request_id,customer_firstname,customer_lastname,customer_dob,customer_gender_id,customer_mobile_number,requested_amount,decline_reason,decline_request_by)
        select inserted.request_id, inserted.request_customer_fname, inserted.request_customer_lname, inserted.request_customer_dob, inserted.request_customer_gender_id, inserted.request_customer_mobile_number, inserted.amount_requested,inserted.rejected_reason, inserted.request_reviewed_by from inserted
        delete from pending_requests where request_customer_login_id = @customer_loginid and approval_id = @approval_status
    END
END

update pending_requests set amount_approved = 500, approval_id = 2, rejected_reason = 'NA', request_reviewed_by = 'Manager' where request_id = 5

GO


select * from approval_status
GO
create trigger t_new_customer_requests_trigger
on new_customer_requests
After UPDATE
AS BEGIN
    declare @approval_status int = (select approval_status_id as approval_status from inserted)
    declare @login varchar(20) =  (select requested_login_id as login from inserted)
    declare @pass varchar(10) = (select mobile_number as pass from inserted)
    declare @department int =  (select department_id as department from inserted)
    if @approval_status = 2
    Begin
        Delete from new_customer_requests where requested_login_id = @login
    END
    if @department = 1 and @approval_status = 1
    Begin
        Insert into customer_login_details VALUES (@login, @pass)
        insert into family(family_lastname,family_customer_login_id,number_of_family_members)
        select inserted.customer_lastname, inserted.requested_login_id, inserted.family_members from inserted
        declare @family_id int = (select family_id from family where family_customer_login_id = @login)
        Insert into premiumcustomers(customer_fname,customer_lname,customer_dob,customer_zip_code,customer_mobile_number,customer_policy_type_id,customer_policy_sub_type_id,customer_gender_id,customer_email,customer_state_code,customer_customer_login_id)
        select inserted.customer_firstname,customer_lastname,inserted.customer_dob,inserted.zip_code,inserted.mobile_number,inserted.policy_type_id,inserted.policy_sub_type_id,inserted.customer_gender_id,inserted.customer_email,inserted.state_code,inserted.requested_login_id  from inserted
        update premiumcustomers set family_id = @family_id where customer_customer_login_id = @login
        Delete from new_customer_requests where requested_login_id = @login
    END
    if @department = 2 and @approval_status = 1
    BEGIN
        Insert into customer_login_details VALUES (@login, @pass)
        Insert into customers(customer_fname,customer_lname,customer_dob,customer_zip_code,customer_mobile_number,customer_policy_type_id,customer_policy_sub_type_id,customer_gender_id,customer_email,customer_state_code,customer_customer_login_id)
        select inserted.customer_firstname,customer_lastname,inserted.customer_dob,inserted.zip_code,inserted.mobile_number,inserted.policy_type_id,inserted.policy_sub_type_id,inserted.customer_gender_id,inserted.customer_email,inserted.state_code,inserted.requested_login_id from inserted
        delete from new_customer_requests where requested_login_id = @login
    END
END
Go



--Stored Procedures

Go

create procedure p_upsert_admin
(
@admin_login_id as varchar(20),
@employee_fname as varchar(20),
@employee_lname as varchar(20),
@employee_dob as date,
@psd as varchar(20),
@employee_dept as int

) AS
BEGIN
    declare @next_employee_id as int 
    set @next_employee_id =  (select TOP 1 employee_id from admins order by employee_id DESC)
    set @next_employee_id = dbo.f_number(@next_employee_id)
    if not exists (select * from admins where admin_login_id = @admin_login_id)
    BEGIN
        Insert into admins(admin_login_id,employee_id,employee_dob,employee_fname,employee_lname) values(@admin_login_id,@next_employee_id,@employee_dob,@employee_fname,@employee_lname)
        Insert into admins_login_details(admin_employee_id,admin_department_id,admin_login_id,pass)values(@next_employee_id,@employee_dept,@admin_login_id,@psd)
    END
    ELSE
    BEGIN
        declare @existing_employee_id as int
        set @existing_employee_id = (select employee_id from admins where admin_login_id = @admin_login_id)
        INSERT into admins_login_details(admin_employee_id,admin_department_id,admin_login_id,pass) values(@existing_employee_id,@employee_dept,@admin_login_id,@psd)    
    END
END




GO

create function f_concat(
    @policy_type_name as varchar(20),
    @policy_sub_type_name as varchar(20)
)returns varchar(20) AS 
BEGIN
    return CONCAT(@policy_type_name,' ',@policy_sub_type_name)
END

Go


create PROCEDURE p_policy_add
(
@policy_type_name as varchar(20)
) as
Begin
    declare @policy_type_id int
    if not exists ( select * from policy_types where policy_type_name = @policy_type_name)
    Begin
    Insert into policy_types values(@policy_type_name)
    set @policy_type_id = (select policy_type_id from policy_types where policy_type_name = @policy_type_name)
    Insert into policy_subtypes(policy_type_id, policy_subtype_name) values (@policy_type_id, dbo.f_concat(@policy_type_name, 'max'))
    INSERT into policy_subtypes(policy_type_id, policy_subtype_name) values (@policy_type_id, dbo.f_concat(@policy_type_name, 'pro'))
    END
    ELSE
        THROW 500001, 'Error: Duplicate policy name inserted', 1

END
