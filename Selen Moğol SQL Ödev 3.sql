
WITH combined_ads_data as 

(SELECT 
ad_date , 'Facebook Ads' as media_source, spend, impressions, reach, clicks, leads, value 
FROM
facebook_ads_basic_daily fabd 

UNION

SELECT
ad_date, 'Google Ads' as media_source, spend , impressions, reach, clicks , leads , value 
FROM
google_ads_basic_daily gabd)

SELECT 
ad_date, 
media_source,
sum(spend) as total_spend,
sum(impressions) as total_impressions,
sum(clicks) as total_clicks,
sum(value) as total_value
FROM combined_ads_data cad 
GROUP BY ad_date, media_source
ORDER BY ad_date  asc ;




