#!/bin/bash

migrate -path ./migrations -database "mysql://test:123456@tcp(127.0.0.1:3306)/gin_mall" -verbose up
