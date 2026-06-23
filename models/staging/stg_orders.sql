select 
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_id,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
c.customerid,
c.customername,
c.segment,
p.productid,
p.productname,
p.category,
p.subcategory,
d.delivery_team,
(o.ordersellingprice - o.ordercostprice) as orderprofit,
{{ markup() }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on c.customerid = o.customerid
left join {{ ref('raw_products') }} as p 
on p.productid = o.productid
left join {{ ref('delivery_team') }} as d
on d.shipmode = o.shipmode