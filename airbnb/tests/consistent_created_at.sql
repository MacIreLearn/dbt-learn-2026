select r.* from {{ ref('fct_reviews') }} r
join {{ ref('dim_listing_cleansed') }} d on r.listing_id = d.listing_id
where r.review_date < d.created_at