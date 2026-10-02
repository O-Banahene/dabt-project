{%macro function1(x) %}

CASE WHEN MONTH({{x}}) IN (12,1,2) THEN 'WINTER'
             WHEN MONTH({{x}}) IN (3,4,5) THEN 'SPRING'
             WHEN MONTH({{x}}) IN (6,7,8) THEN 'AUTUMN'
        END
{%endmacro %}