 use [darkaddy];
 go
 select*from [dbo].[OLA_data_csv]

 --Retrieve all successful bookings:
 select *
 from [dbo].[OLA_data_csv]
 where Booking_Status = 'successful';

 --Find the average ride distance for each vehicle type:

 select Vehicle_Type,
 avg(Ride_Distance) as avg_ride_distance
 from [dbo].[OLA_data_csv]
 group by vehicle_type;

 --Get the total number of cancelled rides by customers:-

 select count(*) Cancelled_Rides_by_Customer
 from [dbo].[OLA_data_csv]
 where Cancelled_Rides_by_Customer = 1;
 
 --List the top 5 customers who booked the highest number of rides

SELECT TOP 5
       booking_id,
       COUNT(*) AS times_booked
FROM dbo.OLA_data_csv
GROUP BY booking_id
ORDER BY times_booked DESC;

--Get the number of rides cancelled by drivers due to personal and car-related issues:

select count (*) driver_cancel_reason
from dbo.OLA_data_csv
where driver_cancel_reason = 'personal & car related issues';

--Find the maximum and minimum driver ratings for Prime Sedan bookings
select max(Driver_Ratings) as max_driver_rating,
min(driver_ratings) as min_driver_rating
from dbo.OLA_data_csv
where vehicle_type='Prime Sedan';

--Find the average customer rating per vehicle type
select Vehicle_Type,
avg(customer_rating) as avg_customer_rating
from dbo.OLA_data_csv
group by Vehicle_Type

--Calculate the total booking value of rides completed successfully:

select sum(booking_value) as total_bokking_value
from dbo.OLA_data_csv
where Booking_Status = 'successful';

--List all incomplete rides along with the reason:

select incomplete_rides , incomplete_rides_reason
from dbo.OLA_data_csv
where Incomplete_Rides=1;









