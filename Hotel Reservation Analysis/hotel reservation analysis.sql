# Checking the table
select * from hotel limit 50;

# Total no. of reservations
select count(distinct(Booking_ID)) AS Total_Bookings from hotel;

# Which meal plan is the most popular among guests?
select type_of_meal_plan AS Popular_Meal from hotel
group by type_of_meal_plan
order by count(Booking_ID) DESC LIMIT 1;

# What is the average price per room for reservations involving children?
select avg(avg_price_per_room) AS avg_price_with_children from hotel
where no_of_children > 0;

# How many reservations were made for the year 20XX (replace XX with the desired year)?
select count(distinct(Booking_ID)) AS Booking_per_Year, year(arrival_date) from hotel
group by year(arrival_date);

# What is the most commonly booked room type?
select room_type_reserved AS Popular_Room_Type from hotel
group by room_type_reserved
order by count(Booking_ID) DESC LIMIT 1;

# How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(distinct(Booking_ID)) AS Weekend_Bookings from hotel
where no_of_weekend_nights > 0; 

# What is the highest and lowest lead time for reservations?
select max(lead_time) AS Max_Lead_Time, min(lead_time) AS Min_Lead_Time from hotel;

# What is the most common market segment type for reservations?
select market_segment_type AS Popular_Market_Seg_Type from hotel
group by market_segment_type
order by count(Booking_ID) DESC LIMIT 1;

# How many reservations have a booking status of "Confirmed"?
select count(distinct(Booking_ID)) AS Comfirmed_Bookings from hotel
where booking_status = 'Confirmed';  ## 0 were marked as confirmed.

# What is the total number of adults and children across all reservations?
select sum(no_of_adults) AS total_adults, sum(no_of_children) AS total_children from hotel;

# What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) AS avg_on_weekend from hotel
where no_of_children > 0;

# How many reservations were made in each month of the year?
-- select count(distinct(Booking_ID)), arrival_date from hotel
-- group by month(arrival_date), year(arrival_date);

SELECT COUNT(DISTINCT Booking_ID), YEAR(arrival_date) AS year, MONTH(arrival_date) AS month
FROM hotel
GROUP BY year, month;


# What is the average number of nights (both weekend and weekday) spent by guests for each roomtype?
select room_type_reserved, avg(no_of_weekend_nights) AS avg_on_weekend, avg(no_of_week_nights) AS avg_on_weekday from hotel
group by room_type_reserved;

# For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved AS Popular_Room_Type, avg(avg_price_per_room) AS avg_price from hotel
where no_of_children > 0
group by room_type_reserved
order by count(Booking_ID) DESC LIMIT 1;

# Find the market segment type that generates the highest average price per room.
select market_segment_type from hotel
group by market_segment_type
order by max(avg_price_per_room) DESC LIMIT 1;