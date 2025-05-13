Select * from netflix;

select  type, --max(rating) 
rating,
count(*)
from netflix group by 1,2
order by 1, 3 DESC

select  type, --max(rating) 
rating,
count(*), RANK() over(partition by type order  by  count(*)) as ranking
from netflix group by 1,2
order by 1, 3 DESC

select type,
rating 
from

(
select  type, --max(rating) 
rating,
count(*), RANK() over(partition by type order  by  count(*) DESC) as ranking
from netflix group by 1,2
) as tl

where ranking  = 1

select  string_to_array (country, ',') as new_country
from netflix

select  string_to_array (country, ',') as new_country
from netflix

select 
 UNNEST (string_to_array (country, ',')) as new_country,
count(show_id) as total_contant
from netflix
group by 1
order by 2 DESC
limit 5

select * from netflix  
where type = 'Movie'
and  release_year = 2020

-- 6. Find Contant  added in the last 5 years

select * 
from netflix
where 
 TO_DATE(date_added, 'Month DD, YYYY') >= Current_date - interval '5 years'

 select current_date - interval '5 years'

7. Find all the movie/ Tv shows by director'S. Shankar'

select * from netflix
where director ilike '%S. Shankar'

8. List all Tv Shows  with more then 5 Seasons

select *
from netflix
where 
type = 'TV Show' 
and 
SPLIT_PART(duration, ' ', 1):: numeric > 5 

9. Count the number of contant items in each genre

select 
UNNEST (STRING_TO_ARRAY(listed_in, ',')) as genre,
count(show_id) as Total_content
from netflix
group by 1

10.Find each year and the average numbers of content release by india on netflix,
return top 5 year with highest avg content release

total content 333/972

select 
EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) as YEAR ,
count(*) as YEARLY_Content,
round(
count(*)::numeric/(select count(*) from netflix where country ='India')::numeric *100
,2) as AVE_CONTENT
from netflix
where country = 'India'
group by 1

11. List all movies that are documentaries

select * from netflix
where
listed_in ilike '%documentaries%'

12.Find the all contant a director

select * from netflix
where director is null

13. Find  how many movies actor 'Shah Rukh Khan' appered in last 10 years

select * from netflix
where casts ilike '%Shah Rukh Khan%'
and 
release_year > EXTRACT( year from current_date) - 10

14. Find the top 10 actors  who have appeared the highest number of movies produced in india.

select 
UNNEST (STRING_TO_ARRAY(casts, ',')) as actors,
count(*) as Total_Contant
from netflix
where country ilike '%india'
group by 1
order by 2 DESC
limit 10


15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in
the description field. Lable content these keywords as 'Bad' and all others
content as 'Good'. Count how many fall into each category.


with new_table
as
(
select *,

case 
when 
     description ilike '%kill%' OR
     description ilike '%violence%' THEN 'Bad_Content'
	 ELSE 'Good_Content'
	 END category
from netflix
)
select 
     category,
	 count(*) as total_content
from  new_table
group by 1


where 
description ilike '%kill%'
or 
description ilike '%violence%'










































































































