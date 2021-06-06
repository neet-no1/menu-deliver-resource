#/bin/bash

echo "create database"
PGPASSWORD=postgres psql -U postgres -f ./reset_database.sql
PGPASSWORD=postgres psql -U postgres -d menu_deliver -f ./create_tables.sql
PGPASSWORD=postgres psql -U postgres -d menu_deliver -f ./insert_master.sql