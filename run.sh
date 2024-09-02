#!/bin/bash

source graph_ql.env

npm install -g stepzen\n

mkdir product_demo

stepzen login ${DOMAIN} -a ${ENV}

stepzen init --endpoint=api/product-demo

stepzen import curl "https://introspection.apis.stepzen.com/customers" --query-name "customers"

stepzen import curl "https://introspection.apis.stepzen.com/orders" --query-name "orders" --query-type "Order"

stepzen start

stepzen import mysql --db-host='db.introspection.stepzen.net' --db-database='introspection' --db-user='testUserIntrospection' --db-password='HurricaneStartingSample1934' --name=mysql
