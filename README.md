
[![Upload Python Package](https://github.com/jadaliha/funsql/actions/workflows/pypi-publish.yml/badge.svg)](https://github.com/jadaliha/funsql/actions/workflows/pypi-publish.yml)
[![Python application](https://github.com/jadaliha/funsql/actions/workflows/python-app.yml/badge.svg)](https://github.com/jadaliha/funsql/actions/workflows/python-app.yml)

# funsql

A python package for building and running SQL-like templates as Python functions against a Postgres database.

## Features

1. build python functions from SQL files.
2. Keep syntax highlighting to represent SQL queries in python.
3. Run them toward the Postgres database

## Installation


```bash
pip install funsql
```


## Usage
Here is a SQL file hosting two templates (validatorX and validatorZ) in the same file. `--> ` at the beginning of each query define the name of the corresponding function in the python funsql object.

Here is an `Example queries.sql` file:


```sql
--> validatorZ
-- a meaningful validation of columns
SELECT 
    {col}, 
    COUNT(*) AS count
FROM {tbl}
GROUP BY 1
ORDER BY 2 DESC

--> validatorX
-- description for the query
SELECT 
    {col1},{col2}, 
    COUNT(*) AS count
FROM {tbl}
GROUP BY 1,2
ORDER BY 3 DESC
```



```go
Here is an example script you can paste in Jupiter:
```



```python
from funsql import Hook, readTemplates

# create a database hook to a public mock database
Hook({
    "host"      : "psql-mock-database-cloud.postgres.database.azure.com",
    "port"      : "5432",
    "user"      : "nxhbvewxsaijdisfftwjgpuw@psql-mock-database-cloud",
    "password"  : "aexcrtmmacdnrmpsomnnsvov",
    "database"  : "booking1666875447372qmebziyvxnskbwrb"
})


# read templates from file
functions = readTemplates('Example queries.sql')

# this print syntax highlighted SQL query
validatorZQ = functions.validatorZ(col='job_type', tbl='public.users')
validatorZQ

# this executes the query and returns a pandas dataframe
validatorZQ()

# you may use padnas.plot to visualize the results
validatorZQ().plot(x='job_type', y='count',kind = 'bar')
```


The `readTemplates` function takes a SQL-like file as an argument and returns a Python object hosting function that can be called with parameters to replace placeholders in the template and execute a query against a Postgres database (which is defined with the `Hook`). The package has syntax highlighting to help you understand the queries that led to the results.

## Additional functionality
You could also add more functionalities to the package. for example :

* Adding support for executing queries against other database types.
* Including functionality for retrieving results as pandas dataframes.
* Provide more detailed logging and error handling.
* etc.

## Note

> This package is for learning purposes, it is not recommended to use in production.