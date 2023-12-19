/* Exercise 4: 
Combining data in the same database table.
Use functions for counting, average and maximum calculation while grouping the rows in the tables*/




/*They require a detailed analysis on the count of houses in the InstantStay. To start with, they require the count of houses based in each state in a descending order:*/

SELECT 
    HouseState, COUNT(HouseID)
FROM
    HOUSE
GROUP BY HouseState
ORDER BY COUNT(HouseID) DESC;

/* 

"COUNT" : returns the number of rows that match a specified criterion.
          - It is often used to retrieve the total number of records in a table.

*/





/*In addition, House Development team wants the same information (as mentioned in the Task 1) along with the city, state level details */


SELECT 
    HouseState, HouseCity, COUNT(HouseID)
FROM
    HOUSE
GROUP BY HouseState, HouseCity
ORDER BY COUNT(HouseID) DESC;


/*The InstantStay will be unable to process the reservation requests if the request count is higher than count of registered houses in the state currently available to rent out. Therefore to take further steps to work on such issues, the team requires to know all the states having less than 2 properties registered in the system: */

SELECT 
    COUNT(HouseID), HouseState
FROM
    HOUSE
GROUP BY HouseState 
HAVING COUNT(HouseID) < 2
ORDER BY COUNT(HouseID) DESC;



/* The House Development team also requires to calculate the total number of rooms available in each state: */

SELECT 
    HouseState, SUM(HouseNumberOfRooms) AS TotalAvailability
FROM
    HOUSE
GROUP BY HouseState;



/* the House Development team wants to know the largest and average house in terms of number of rooms for each state: */

SELECT 
    HouseState,
    MAX(HouseNumberOfRooms) AS LargestHouse,
    AVG(HouseNumberOfRooms) AS AverageHouse
FROM
    HOUSE
GROUP BY HouseState;

/* they need some specific information such as distinct ZIP codes of all houses and distinct list of cities in two separate tables: */

SELECT DISTINCT
    HouseZIPCode
FROM
    HOUSE;


SELECT DISTINCT
    HouseCity
FROM
    HOUSE;


/*the InstantStay Marketing team wants to create a word cloud from the cities of the houses. They want to learn the number of characters in the longest city: */

SELECT 
    MAX(LENGTH(HouseCity))
FROM
    HOUSE;



/* Big one:

They want to send celebration mails to the owners on their joining date in the system.
They need the combined details which includes name and surname of the owners with their email addresses. 
In addition, they are planning to make this as practice for every year. 
The team requires the day and month of owners joining date to send emails on exact dates every year:
*/

SELECT 
    CONCAT(OwnerFirstName, CONCAT(' ', OwnerLastName)) AS Name,
    OwnerEmail,
    MONTH(OwnerJoinDate) AS Month,
    DAY(OwnerJoinDate) AS Day
FROM
    OWNER;

/* " CONCAT " = you can concatenate (combine) strings from multiple columns or literals using the CONCAT function.

        CONCAT(string1, string2)
*/



/* create a specialized carpets to the houses with the initials of owners. They wanted to get the uppercase first letter of firstname and surname of the owners */

SELECT 
    UPPER(SUBSTR(OwnerFirstName, 1, 1)) AS initial_1,
    UPPER(SUBSTR(OwnerLastName, 1, 1)) AS initial_2
FROM
    OWNER;

/* "SUBSTR" = Used to extract a substring from a string. It allows you to specify the starting position and the length of the substring you want to extract.

        SUBSTR(string, start_position, length)

*/

