-- Account used by mall-admin and mall-search (see config/*/*-prod.yaml)
CREATE USER IF NOT EXISTS 'reader'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
GRANT ALL PRIVILEGES ON mall.* TO 'reader'@'%';
FLUSH PRIVILEGES;
