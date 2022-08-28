-- Assignment 5:
CREATE TABLE CAR_TRANSACTION (
	TOY_CAR_ID varchar(255) NOT NULL,
    ENTRY_TIME varchar(255) NOT NULL,
    EXIT_TIME varchar(255) NOT NULL,
    ROOM_ID varchar(255) NOT NULL,
    LIGHT_INDICATOR varchar(255) NOT NULL
);

 insert into CAR_TRANSACTION
 select * FROM testdb.sample_csv_data;

-- Assignment 6:
select LIGHT_INDICATOR, 
	coalesce(count(case when LIGHT_INDICATOR = 'RED' and TOY_CAR_ID = 'CAR111' then 1 end), 0) as car111RedCount,
    coalesce(count(case when LIGHT_INDICATOR = 'GREEN' and TOY_CAR_ID = 'CAR111' then 1 end), 0) as car111GreenCount,
    coalesce(count(case when LIGHT_INDICATOR = 'RED' and TOY_CAR_ID = 'CAR222' then 1 end), 0) as car222RedCount,
    coalesce(count(case when LIGHT_INDICATOR = 'GREEN' and TOY_CAR_ID = 'CAR222' then 1 end), 0) as car222RedCount
from car_transaction;

-- Assignment 7:
select MIN(ENTRY_TIME) AS car111Second FROM car_transaction WHERE ENTRY_TIME > (select MIN(ENTRY_TIME) FROM car_transaction WHERE TOY_CAR_ID = 'CAR111') and TOY_CAR_ID = 'CAR111';
select MIN(ENTRY_TIME)AS car222Second FROM car_transaction WHERE ENTRY_TIME > (select MIN(ENTRY_TIME) FROM car_transaction WHERE TOY_CAR_ID = 'CAR222') and TOY_CAR_ID = 'CAR222';
