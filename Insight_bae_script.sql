select count(distinct a.user_id) from review a 
where a.business_id in (select business_id from restaurants_bae);
-- Total number of user who gave rate on Restaurant:908921

select count(distinct a.user_id) from bad_reviewers a 
where a.business_id in (select business_id from restaurants_bae);
-- Total number of user(average rate <=2) who gave rate on Restaurant: 78839

-- 78839 * 100 / 908921 =  8.7%


select c.rest_star, round(count(c.user_star)*100/sum(count(c.user_star)) over(),2) as ratio from 
(select a.business_id,  a.stars as rest_star, b.stars as user_star 
from restaurants_bae a join bad_reviewers b on (a.business_id = b.business_id)) c
group by c.rest_star;
÷������ ����
