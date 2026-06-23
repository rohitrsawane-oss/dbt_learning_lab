select
productid,
productname,
category,
subcategory,
sum(orderprofit) as orderprofit
from {{ ref('stg_orders') }} 
group by
productid,
productname,
category,
subcategory 