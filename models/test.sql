select *
from {{ source('my_source', 'customer') }}

limit 10