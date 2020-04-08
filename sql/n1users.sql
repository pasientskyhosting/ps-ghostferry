CREATE USER 'ghostferry'@'%' IDENTIFIED BY 'ghostferry';
GRANT SELECT ON `abc`.* TO 'ghostferry'@'%';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'ghostferry'@'%';