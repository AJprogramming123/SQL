/* EXERCISE 2: Combining data from multiple tables. */



/* need all of the guest information, such as their first and last name and their stay start and end dates, without checking the existence of reservation data */

SELECT 
    GuestFirstName, GuestLastName, S.StayStartDate, S.StayEndDate
FROM
    GUEST G
         LEFT JOIN
    STAY S ON S.GuestID = G.GuestID;

/*
"LEFT JOIN" : 
  - It returns all the rows from the left table and the matching rows from the right table 

"ON" : Used in the join clause to specify the join condition between two or more tables.
*/ 





/*Need all house owner's first and last names along with their house ids and addresses. Collect the information from HOUSE and OWNER tables and return in a consolidated way:*/

SELECT 
    OwnerFirstName,
    OwnerLastName,
    HouseID,
    HouseAddress,
    HouseCity,
    HouseZIPCode,
    HouseState
FROM
    HOUSE
        JOIN
    OWNER USING (OwnerID);

/*

"JOIN" : Combines rows from two or more tables based on a related column between them.

"USING" : Used in the context of a JOIN operation to specify the columns used in the join condition when the column names are the same in both tables.

*/


/* collect all Stay IDs with the price, discount and channel commission rate */
SELECT 
    StayID, StayPrice, StayDiscount, ChannelCommission
FROM
    STAY
        JOIN
    CHANNEL ON STAY.ChannelID = CHANNEL.ChannelID;



/* requires the list of Stay IDs, GuestIDs, and the positive dollar amount rounded up to the nearest whole number */

SELECT 
    StayID, GuestID, ROUND(CEIL (ABS(StayPrice))) AS StayPrice
FROM
    STAY
WHERE
    StayPrice < 0;



/*ERROR: There could be duplicate users in the system. CheCheck for the guests with the same name but different GuestIDs to check whether they are duplicate or not */

SELECT 
    *
FROM
    GUEST G
        JOIN
    GUEST H ON G.GuestFirstName = H.GuestFirstName
        AND G.GuestLastName = H.GuestLastName
        AND G.GuestID != H.GuestID
