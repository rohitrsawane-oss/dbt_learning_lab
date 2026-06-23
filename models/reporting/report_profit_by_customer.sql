select 
customerid,
customername,
segment,
sum(orderprofit) as orderprofit
from 
{{ ref('stg_orders') }}
 group by 
 customerid,
customername,
segment
