/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/7/11 20:21:56                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists bill_details;

drop table if exists creditsys;

drop table if exists loan;

drop table if exists loan_order;

drop table if exists repayment;

drop table if exists user;

drop table if exists user_order;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   varchar(30) not null,
   passwd               varchar(30),
   primary key (id)
);

/*==============================================================*/
/* Table: bill_details                                          */
/*==============================================================*/
create table bill_details
(
   bill_id              int not null,
   order_id             int,
   loan_id              int,
   repayable_id         int,
   order_time           timestamp,
   repayable_loan       varchar(30),
   rest_loan            varchar(30),
   term                 varchar(30),
   type                 varchar(30),
   primary key (bill_id)
);

/*==============================================================*/
/* Table: creditsys                                             */
/*==============================================================*/
create table creditsys
(
   id                   int not null,
   u_id                 varchar(8),
   credit_mark          int,
   grade                int,
   status               bool,
   is_graduated         bool,
   total_amount         varchar(30),
   primary key (id)
);

/*==============================================================*/
/* Table: loan                                                  */
/*==============================================================*/
create table loan
(
   loan_id              int not null,
   id                   int,
   type                 varchar(30),
   interest_rate        float(3),
   term                 varchar(10),
   product_name         varchar(30),
   grade_limit          int,
   primary key (loan_id)
);

/*==============================================================*/
/* Table: loan_order                                            */
/*==============================================================*/
create table loan_order
(
   order_id             int not null,
   u_id                 varchar(8),
   order_time           timestamp,
   loan_id              int,
   primary key (order_id)
);

/*==============================================================*/
/* Table: repayment                                             */
/*==============================================================*/
create table repayment
(
   repay_id             int not null,
   term                 varchar(30),
   repayable_loan       varchar(30),
   rest_loan            varchar(30),
   repayable_type       varchar(30),
   repayable_time       timestamp,
   order_id             int,
   primary key (repay_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   u_id                 varchar(8) not null,
   name                 varchar(30),
   passwd               varchar(30),
   phone_num            varchar(11),
   salary               varchar(30),
   id_card              varchar(18),
   bank_card            varchar(30),
   status               bool,
   address              varchar(30),
   primary key (u_id)
);

/*==============================================================*/
/* Table: user_order                                            */
/*==============================================================*/
create table user_order
(
   order_id             int,
   id                   int not null,
   u_id                 varchar(8),
   primary key (id)
);

alter table bill_details add constraint FK_Reference_4 foreign key (order_id)
      references loan_order (order_id) on delete restrict on update restrict;

alter table bill_details add constraint FK_Reference_5 foreign key (loan_id)
      references loan (loan_id) on delete restrict on update restrict;

alter table creditsys add constraint FK_Reference_1 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

alter table loan add constraint FK_Reference_2 foreign key (id)
      references creditsys (id) on delete restrict on update restrict;

alter table loan_order add constraint FK_Reference_3 foreign key (loan_id)
      references loan (loan_id) on delete restrict on update restrict;

alter table repayment add constraint FK_Reference_6 foreign key (order_id)
      references loan_order (order_id) on delete restrict on update restrict;

alter table user_order add constraint FK_Reference_8 foreign key (order_id)
      references loan_order (order_id) on delete restrict on update restrict;

alter table user_order add constraint FK_Reference_9 foreign key (u_id)
      references user (u_id) on delete restrict on update restrict;

