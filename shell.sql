-- Number of clients.
CREATE OR REPLACE FUNCTION clients_count
RETURN NUMBER
IS
  number_of_clients NUMBER;
BEGIN

  SELECT 
    COUNT(CUSTOMERID) INTO number_of_clients
  FROM customer;

  RETURN number_of_clients;

END clients_count;
/
CREATE OR REPLACE PROCEDURE get_clients_count
IS
  clients_number NUMBER;
BEGIN

  clients_number := clients_count();

  DBMS_OUTPUT.PUT_LINE(clients_number);

END;
/
-- Number of sellers.
CREATE OR REPLACE FUNCTION sellers_count
RETURN NUMBER
IS
  number_of_sellers NUMBER;
BEGIN

  SELECT 
    COUNT(SELLERID) INTO number_of_sellers
  FROM seller;

  RETURN number_of_sellers;

END sellers_count;
/
CREATE OR REPLACE PROCEDURE get_sellers_count
IS
  sellers_number NUMBER;
BEGIN

  sellers_number := sellers_count();

  DBMS_OUTPUT.PUT_LINE(sellers_number);

END;
/
-- Seniors with their juniors in charge.
CREATE OR REPLACE PROCEDURE seniors_with_juniors_in_charge
IS
  v_senior VARCHAR(50);
  v_junior VARCHAR(50);
  CURSOR c
  IS
  SELECT
    senior.name AS senior,
    junior.name AS junior
  FROM seller senior
  INNER JOIN seller junior
    ON senior.sellerid = junior.seller_sellerid
  ORDER BY senior.name;
BEGIN

  OPEN c;
    LOOP

      FETCH c INTO v_senior, v_junior;
      EXIT WHEN c%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(
        'Senior ' || v_senior || ' Junior ' || v_junior
      );

    END LOOP;
  CLOSE c;

END;
/
-- Se puede hacer exactamente lo mismo pero con un bucle determinado.
CREATE OR REPLACE PROCEDURE seniors_with_juniors_in_charge
IS
  CURSOR c
  IS
  SELECT
    senior.name AS senior,
    junior.name AS junior
  FROM seller senior
  INNER JOIN seller junior
    ON senior.sellerid = junior.seller_sellerid
  ORDER BY senior.name;
BEGIN

  FOR c_row IN c
  LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Senior ' || c_row.senior || ' Junior ' || c_row.junior
    );
  END LOOP;

END;
/