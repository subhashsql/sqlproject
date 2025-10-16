/* cube and Rollup operators
created by -Subhash
date-20-05-2023
*/
--insert data into the tables
use School
go
---------------------------------------
CREATE TABLE dbo.cubeone
(
  Colour    VARCHAR(30) NOT NULL,
  ItemName    VARCHAR(30) NOT NULL,
  qty       INT        NOT NULL
);
INSERT INTO dbo.cubeone(Colour, ItemName, qty)
VALUES
  ('Black','Table',20),
  ('Orange','chair',10),
  ('Red','chair',10),
  ('Yellow','chair',10),
  ('Red','Table',30),
  ('Yellow','Table',20),
  ('Orange','Table',30),
  ('Black','chair',15),
  ('Yellow','chair',13),
  ('Neon','chair',10)
  -------------------------
  select *
  from dbo.cubeone
  -------------------

  /* using cube operator*/
  
  select ItemName,Colour,sum(qty) as Total
  from dbo.cubeone
  group by Itemname,Colour with cube
  go

  ---------------
  --using rollup 
  ----------
    select ItemName,Colour,sum(qty) as Total
  from dbo.cubeone
  group by Itemname,Colour with rollup
  go

