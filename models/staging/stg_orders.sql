select 
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
(o.ordersellingprice - o.ordercostprice) as orderprofit
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on c.customerid = o.customerid
left join {{ ref('raw_products') }} as p 
on p.productid = o.productid