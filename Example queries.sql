--> validatorZ
-- a meaningful validation of columns
SELECT 
    {col}, 
    COUNT(*) AS count
FROM {tbl}
GROUP BY 1
ORDER BY 2 DESC