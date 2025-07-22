#!/bin/bash

# Start PostgreSQL
sudo service postgresql start

# Create DB & user
sudo -u postgres psql -c "CREATE DATABASE apninotes;"
sudo -u postgres psql -c "CREATE USER postgres WITH PASSWORD 'postgres';"
sudo -u postgres psql -c "ALTER ROLE postgres SUPERUSER;"
