/* Exercise 3: work with subqueries to gather information from multiple tables. */


/*require all the available information about the reservations where the commission rate of the channel is higher than 10%.*/

SELECT 
    *
FROM
    STAY
WHERE
    ChannelID IN (SELECT 
            ChannelID
        FROM
            CHANNEL
        WHERE
            ChannelCommission > 0.1);


/* requires average price per stay rounded to two decimal places for all the houses in the system. However, ensure that you do not include the cancelled stays with negative payment information */

SELECT 
    HouseID,
    ROUND(AVG(StayPrice * (1 - StayDiscount)), 2) AS Payment
FROM
    STAY
WHERE
    StayPrice > 0
GROUP BY HouseID;



/* team wants to learn the apartment that have more than average number of stays. */

SELECT 
    HouseID, COUNT(StayID) AS Stays
FROM
    STAY
GROUP BY HouseID
HAVING COUNT(StayID) > (SELECT 
        AVG(s.Stays)
    FROM
        (SELECT 
            COUNT(StayID) AS Stays
        FROM
            STAY
        GROUP BY HouseID) AS s);

/*

"COUNT" : The COUNT function is used to count the number of rows that match a specific condition or the total number of rows in a table.

*/



/* team wants to get all the houses in the system which are larger than the average in size. For the calculation, you will compare against the AVG of HouseSquareMeter for all the houses in InstantStay */

SELECT 
    *
FROM
    HOUSE
WHERE
    HouseSquareMeter >= (SELECT 
            AVG(HouseSquareMeter)
        FROM
            HOUSE);


/* team wants to get the name and email information for all the guests which have been registered into the system so far though not stayed in any property yet. The team is planning to use the collected information to fill the email templates with first name, last name and email fields and then send the reminder emails */

SELECT 
    g.GuestFirstName, g.GuestLastName, g.GuestEmail
FROM
    GUEST g
WHERE
    g.GuestID != ALL (SELECT DISTINCT
            s.GuestID
        FROM
            STAY s);

/*

"SELECT DISTINCT" : The statement is used to retrieve unique values from a specific column or a combination of columns in a table.

*/



/* team wants to send new General Data Protection Regulation (GDPR) emails who are registered in the system. Collect email information for all owners and guests */

SELECT 
    OwnerEmail
FROM
    OWNER 
UNION SELECT 
    GuestEmail
FROM
    GUEST;

/*

"UNION" : operator is used to combine the result sets of two or more 'SELECT' statements into a single result set.

*/
