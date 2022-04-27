REM   Script: Good Buy store data
REM   Good Buy store data.

INSERT INTO supplier VALUES(1, 'MATT & COMP.');

INSERT INTO supplier VALUES(2, 'ROYAL FAMILY');

INSERT INTO supplier VALUES(3, 'SUPLEX ENT.');

INSERT INTO supplier VALUES(4, 'EST PRODUCTS');

INSERT INTO supplier VALUES(5, 'SAMSUNG');

INSERT INTO customer VALUES(1, 'James Potter', TO_DATE('16-08-2003', 'dd-mm-yyyy'), 18, '12th Madison Street', '620610468');

INSERT INTO customer VALUES(2, 'Peter Parker', TO_DATE('19-03-2001', 'dd-mm-yyyy'), 21, '9th Royalty Street', '864016026');

INSERT INTO customer VALUES(3, 'Jessica Rabbit', TO_DATE('18-02-2002', 'dd-mm-yyyy'), 20, '21st Kingdom Street', '652103365');

INSERT INTO customer VALUES(4, 'Cody Effron', TO_DATE('22-04-2003', 'dd-mm-yyyy'), 18, '38th Sacrifice Street', '645213547');

INSERT INTO customer VALUES(5, 'Hilary Clinton', TO_DATE('23-01-1995', 'dd-mm-yyyy'), 27, '18th Sacrifice Street', '666616777');

INSERT INTO seller VALUES (2,'Jose Antonio',TO_DATE('09-11-1979','DD-MM-YYYY'),'Senior',1499,NULL);

INSERT INTO seller VALUES (3,'Jesus Rodriguez',TO_DATE('28-11-1999','DD-MM-YYYY'),'Junior',1299,2);

INSERT INTO seller VALUES (4,'Rosa Maria',TO_DATE('28-11-1999','DD-MM-YYYY'),'Senior',1499,NULL);

INSERT INTO seller VALUES (5,'Josefa Ochoa',TO_DATE('28-11-1999','DD-MM-YYYY'),'Junior',1299,4);

INSERT INTO seller VALUES (1,'Juan Bernal',TO_DATE('28-11-1999','DD-MM-YYYY'),'Junior',1299,2);

INSERT INTO product VALUES(1, 100, 'BOSH', 'PR', 'Bosch TAT3A004', 26, 55, 60, 2000);

INSERT INTO product VALUES(2, 101, 'NESPRESSO', 'PR', 'Mini Me', 30, 60, 120, 1000);

INSERT INTO product VALUES(3, 102, 'AOC', 'BR', 'Gaming 24G2U 24"', 10, 40, 130, 100);

INSERT INTO product VALUES(4, 103, 'BALAY', 'BR', '3BE297RW', 15, 1, 90, 100);

INSERT INTO product VALUES(5, 104, 'BEKO', 'PR', 'Phantom', 20, 250, 400, 5000);

INSERT INTO product VALUES(1, 105, 'HP', 'GR', 'HP Pro M28w', 10, 300, 400, 2500);

INSERT INTO product VALUES(2, 106, 'BOSH', 'GR', 'Razer Kraken', 5, 60, 80, 5000);

INSERT INTO product VALUES(3, 107, 'MyLittlePony', 'GR', 'RadiantPony', 20,  1, 100, 10);

INSERT INTO product VALUES(4, 108, 'Ryzen AMD', 'WB', 'Knuckles Edition', 1, 20, 100, 2);

INSERT INTO product VALUES(5, 109, 'BLACKBERRY', 'GR', 'Blackberry', 15, 40, 70, 30);

INSERT INTO product VALUES(1, 110, 'SAMSUNG', 'PR', 'PCI 4.0', 54, 50, 600, 30);

INSERT INTO purchase VALUES('1',TO_DATE('23-11-1999','DD-MM-YYYY'),1,2);

INSERT INTO purchase VALUES('2',TO_DATE('14-06-1996','DD-MM-YYYY'),2,3);

INSERT INTO purchase VALUES('3',TO_DATE('21-07-1998','DD-MM-YYYY'),3,4);

INSERT INTO purchase VALUES('4',TO_DATE('04-10-1999','DD-MM-YYYY'),4,5);

INSERT INTO purchase VALUES('5',TO_DATE('10-12-1997','DD-MM-YYYY'),5,1);

INSERT INTO relatedto VALUES(100, 1, 110, 1);

INSERT INTO relatedto VALUES(101, 2, 106, 2);

INSERT INTO relatedto VALUES(102, 3, 107, 3);

INSERT INTO relatedto VALUES(108, 4, 103, 4);

INSERT INTO relatedto VALUES(105, 1, 100, 1);

INSERT INTO contains VALUES (1, 100, 1, 5, 1000);

INSERT INTO contains VALUES (2, 106, 2, 3, 500);

INSERT INTO contains VALUES (3, 104, 5, 3, 750);

INSERT INTO contains VALUES (4, 105, 1, 4, 25.03);

INSERT INTO contains VALUES (5, 108, 4, 2, 37);

