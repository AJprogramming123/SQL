/*EXERCISE 1: */

/*The Channel development team requires all data available about the channels for their new dashboard team.*/

SELECT 
    *
FROM
    CHANNEL;

/*Channel Development team requires the following information for their weekly-channel presentation: */


/*list of all channel names*/
SELECT 
    ChannelName
FROM
    CHANNEL;
  


/*channel names ordered by commission in starting with the highest commission rate */

SELECT 
    ChannelName, ChannelCommission
FROM
    CHANNEL
ORDER BY ChannelCommission DESC;



/*channel names which have commission rates higher than 10%. */

SELECT 
    ChannelName, ChannelCommission 
FROM
    CHANNEL
WHERE
    ChannelCommission > 0.1;



/* Calculate the actual price using the price and discount amount from the corresponding tables.*/

SELECT 
    StayID, StayPrice * (1 - StayDiscount) AS 'Actual Price'
FROM
    STAY;


/* The InstantStay Finance team indicates that the retrieved data is not suitable for making payments as currency. You need to round up the actual prices to have only 2 decimals */

SELECT
  StayID, 
  ROUND(StayPrice * (1 - StayDiscount), 2) AS 'Actual Price Rounded'
FROM
  STAY;




/*Collect all the owners joined in the last year and did not leave the system yet.*/

SELECT
  *
FROM
  OWNER 
WHERE
  (OwnerJoinDate >= DATE_ADD(CURDATE(), INTERVAL - 1 YEAR))
        AND OwnerEndDate IS NULL;





/*Collect the email address of the owners, notification date as one week later of their leave and last day of the month for financial closure*/

SELECT
  OwnerEmail,
    DATE_ADD(OwnerEndDate, INTERVAL 1 WEEK) AS NotificationDate,
    LAST_DAY(OwnerEndDate) AS FinancialClosure

FROM
    OWNER
WHERE
    OwnerEndDate IS NOT NULL;
