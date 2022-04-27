REM   Script: Good Buy store DDL
REM   Good buy store ddl

CREATE TABLE contains ( 
    purchase_purchaseid INTEGER NOT NULL, 
    product_productid   INTEGER NOT NULL, 
    product_supplierid  INTEGER NOT NULL, 
    quantity            INTEGER NOT NULL, 
    saleprice           NUMBER(6, 2) NOT NULL 
);

ALTER TABLE contains 
    ADD CONSTRAINT contains_pk PRIMARY KEY ( purchase_purchaseid, 
                                             product_productid, 
                                             product_supplierid );

CREATE TABLE customer ( 
    customerid      INTEGER NOT NULL, 
    name            VARCHAR2(20 CHAR) NOT NULL, 
    dateofbirth     DATE NOT NULL, 
    age             INTEGER NOT NULL, 
    address         VARCHAR2(100) NOT NULL, 
    telephonenumber CHAR(9) NOT NULL 
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customerid );

CREATE TABLE product ( 
    supplier_supplierid INTEGER NOT NULL, 
    productid           INTEGER NOT NULL, 
    brand               VARCHAR2(20 CHAR) NOT NULL, 
    type                CHAR(2) NOT NULL, 
    model               VARCHAR2(20 CHAR) NOT NULL, 
    weight              NUMBER(4, 2) NOT NULL, 
    purchaseprice       NUMBER(6, 2) NOT NULL, 
    saleprice           NUMBER(6, 2) NOT NULL, 
    stock               INTEGER NOT NULL 
);

ALTER TABLE product 
    ADD CHECK ( type IN ( 'BR', 'GR', 'PR', 'WB' ) );

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( productid, 
                                                            supplier_supplierid );

CREATE TABLE purchase ( 
    purchaseid          INTEGER NOT NULL, 
    "Date"              DATE NOT NULL, 
    customer_customerid INTEGER NOT NULL, 
    seller_sellerid     INTEGER NOT NULL 
);

ALTER TABLE purchase ADD CONSTRAINT purchase_pk PRIMARY KEY ( purchaseid );

CREATE TABLE relatedto ( 
    product_productid   INTEGER NOT NULL, 
    product_supplierid  INTEGER NOT NULL, 
    product_productid1  INTEGER NOT NULL, 
    product_supplierid1 INTEGER NOT NULL 
);

ALTER TABLE relatedto 
    ADD CONSTRAINT relatedto_pk PRIMARY KEY ( product_productid, 
                                              product_supplierid, 
                                              product_productid1, 
                                              product_supplierid1 );

CREATE TABLE seller ( 
    sellerid        INTEGER NOT NULL, 
    name            VARCHAR2(20 CHAR) NOT NULL, 
    dateofbirth     DATE NOT NULL, 
    typeofseller    CHAR(6) NOT NULL, 
    salary          NUMBER(6, 2) NOT NULL, 
    seller_sellerid INTEGER 
);

ALTER TABLE seller 
    ADD CHECK ( typeofseller IN ( 'Junior', 'Senior' ) );

ALTER TABLE seller ADD CONSTRAINT seller_pk PRIMARY KEY ( sellerid );

CREATE TABLE supplier ( 
    supplierid INTEGER NOT NULL, 
    name       VARCHAR2(20 CHAR) NOT NULL 
);

ALTER TABLE supplier ADD CONSTRAINT supplier_pk PRIMARY KEY ( supplierid );

ALTER TABLE contains 
    ADD CONSTRAINT contains_product_fk FOREIGN KEY ( product_productid, 
                                                     product_supplierid ) 
        REFERENCES product ( productid, 
                             supplier_supplierid );

ALTER TABLE contains 
    ADD CONSTRAINT contains_purchase_fk FOREIGN KEY ( purchase_purchaseid ) 
        REFERENCES purchase ( purchaseid );

ALTER TABLE product 
    ADD CONSTRAINT product_supplier_fk FOREIGN KEY ( supplier_supplierid ) 
        REFERENCES supplier ( supplierid ) 
            ON DELETE CASCADE;

ALTER TABLE purchase 
    ADD CONSTRAINT purchase_customer_fk FOREIGN KEY ( customer_customerid ) 
        REFERENCES customer ( customerid );

ALTER TABLE purchase 
    ADD CONSTRAINT purchase_seller_fk FOREIGN KEY ( seller_sellerid ) 
        REFERENCES seller ( sellerid );

ALTER TABLE relatedto 
    ADD CONSTRAINT relatedto_product_fk FOREIGN KEY ( product_productid, 
                                                      product_supplierid ) 
        REFERENCES product ( productid, 
                             supplier_supplierid );

ALTER TABLE relatedto 
    ADD CONSTRAINT relatedto_product_fkv1 FOREIGN KEY ( product_productid1, 
                                                        product_supplierid1 ) 
        REFERENCES product ( productid, 
                             supplier_supplierid );

ALTER TABLE seller 
    ADD CONSTRAINT seller_seller_fk FOREIGN KEY ( seller_sellerid ) 
        REFERENCES seller ( sellerid );

