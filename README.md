ДЗ №27: Репликация mysql.

Цель домашнего задания: настроить стенд по репликации MySQL сервера в режиме Master -> Slave на основе GTID.

Для проверки представляю Vagrantfile, который разворачивает две ВМ - сервера Master и Slave. 
После разворачивания ВМ необходимо запустить ansible playbook.yaml, с помощью которого производится доустановка
необходимых пакетов, загрузка на ВМ необходимых конфигурационных файлов.
После выполнения playbook.yaml имеем исходное состояние:

Сервер "Master"

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bet                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE bet;

mysql> SHOW TABLES;
+------------------+
| Tables_in_bet    |
+------------------+
| bookmaker        |
| competition      |
| events_on_demand |
| market           |
| odds             |
| outcome          |
| v_same_event     |
+------------------+
7 rows in set (0.00 sec)

mysql> SHOW MASTER STATUS\G
*************************** 1. row ***************************
             File: mysql-bin.000001
         Position: 156
     Binlog_Do_DB:
 Binlog_Ignore_DB:
Executed_Gtid_Set:
1 row in set (0.00 sec)

Сервер "Slave"

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bet                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE bet;

mysql> SHOW TABLES;
+---------------+
| Tables_in_bet |
+---------------+
| bookmaker     |
| competition   |
| market        |
| odds          |
| outcome       |
+---------------+
5 rows in set (0.01 sec)

Далее на сервере Slave конфигурирум репликацию используя GTID и auto-positioning

CHANGE REPLICATION SOURCE TO SOURCE_HOST = "192.168.56.10", SOURCE_PORT = 3306, SOURCE_USER = "repl", SOURCE_PASSWORD = "OtusLinux2022", SOURCE_AUTO_POSITION=1;

команда отработала

mysql> CHANGE REPLICATION SOURCE TO SOURCE_HOST = "192.168.56.10", SOURCE_PORT = 3306, SOURCE_USER = "repl", SOURCE_PASSWORD = "OtusLinux2022", SOURCE_AUTO_POSITION=1;
Query OK, 0 rows affected, 2 warnings (0.01 sec)

Где и как посмотреть, что за варнинги мы получили в результате?

START REPLICA;

команда отработала

mysql> START REPLICA;
Query OK, 0 rows affected (0.01 sec)

Проверяю состояние репликации

SHOW REPLICA STATUS\G

mysql> SHOW REPLICA STATUS\G
*************************** 1. row ***************************
             Replica_IO_State: Waiting for source to send event
                  Source_Host: 192.168.56.10
                  Source_User: repl
                  Source_Port: 3306
                Connect_Retry: 60
              Source_Log_File: mysql-bin.000001
          Read_Source_Log_Pos: 156
               Relay_Log_File: Slave-relay-bin.000002
                Relay_Log_Pos: 371
        Relay_Source_Log_File: mysql-bin.000001
           Replica_IO_Running: Yes
          Replica_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table: bet.events_on_demand,bet.v_same_event
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Source_Log_Pos: 156
              Relay_Log_Space: 580
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Source_SSL_Allowed: No
           Source_SSL_CA_File:
           Source_SSL_CA_Path:
              Source_SSL_Cert:
            Source_SSL_Cipher:
               Source_SSL_Key:
        Seconds_Behind_Source: 0
Source_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Source_Server_Id: 1
                  Source_UUID: 89ca52ce-1748-11ee-9e71-5254000315fa
             Source_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
    Replica_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Source_Retry_Count: 86400
                  Source_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Source_SSL_Crl:
           Source_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 1
         Replicate_Rewrite_DB:
                 Channel_Name:
           Source_TLS_Version:
       Source_public_key_path:
        Get_Source_public_key: 0
            Network_Namespace:
1 row in set (0.00 sec)

Наблюдаю:

  - работае (Replica_IO_State: Waiting for source to send event, Replica_IO_Running: Yes, Replica_SQL_Running: Yes),
  - ошибок нет (Last_IO_Error:, Last_SQL_Error:),
  - реплика игнорирует таблицы (Replicate_Ignore_Table: bet.events_on_demand,bet.v_same_event).

Проверяю ход репликации:

Сервер "Master"

mysql> USE bet;
Database changed

Добавим в таблицу bookmaker запись '1xbet'

mysql> INSERT INTO bookmaker (id,bookmaker_name) VALUES(1,'1xbet');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM bookmaker;
+----+----------------+
| id | bookmaker_name |
+----+----------------+
|  1 | 1xbet          |
|  4 | betway         |
|  5 | bwin           |
|  6 | ladbrokes      |
|  3 | unibet         |
+----+----------------+
5 rows in set (0.00 sec)

Сервер "Slave"

Вижу изменения в статусе

mysql> SHOW REPLICA STATUS\G
*************************** 1. row ***************************
             Replica_IO_State: Waiting for source to send event
                  Source_Host: 192.168.56.10
                  Source_User: repl
                  Source_Port: 3306
                Connect_Retry: 60
              Source_Log_File: mysql-bin.000001
          Read_Source_Log_Pos: 472
               Relay_Log_File: Slave-relay-bin.000002
                Relay_Log_Pos: 687
        Relay_Source_Log_File: mysql-bin.000001
           Replica_IO_Running: Yes
          Replica_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table: bet.events_on_demand,bet.v_same_event
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Source_Log_Pos: 472
              Relay_Log_Space: 896
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Source_SSL_Allowed: No
           Source_SSL_CA_File:
           Source_SSL_CA_Path:
              Source_SSL_Cert:
            Source_SSL_Cipher:
               Source_SSL_Key:
        Seconds_Behind_Source: 0
Source_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Source_Server_Id: 1
                  Source_UUID: 89ca52ce-1748-11ee-9e71-5254000315fa
             Source_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
    Replica_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Source_Retry_Count: 86400
                  Source_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Source_SSL_Crl:
           Source_SSL_Crlpath:
           Retrieved_Gtid_Set: 89ca52ce-1748-11ee-9e71-5254000315fa:1
            Executed_Gtid_Set: 89ca52ce-1748-11ee-9e71-5254000315fa:1
                Auto_Position: 1
         Replicate_Rewrite_DB:
                 Channel_Name:
           Source_TLS_Version:
       Source_public_key_path:
        Get_Source_public_key: 0
            Network_Namespace:
1 row in set (0.00 sec)

mysql> USE bet;
Database changed

mysql> SELECT * FROM bookmaker;
+----+----------------+
| id | bookmaker_name |
+----+----------------+
|  1 | 1xbet          |
|  4 | betway         |
|  5 | bwin           |
|  6 | ladbrokes      |
|  3 | unibet         |
+----+----------------+
5 rows in set (0.00 sec)

Наблюдаю среплицированную запись в таблице.

Вывод: репликация работает.


P.S.:
Два последних таска "Configure the replica to use GTID-based auto-positioning" и "Start replica" не удалось запустить из playbook.yaml,
таск "Configure the replica to use GTID-based auto-positioning" завершается с ошибкой:
"""

fatal: [Slave]: FAILED! => {
"changed": false,
"msg": "unable to connect to database, check login_user and login_password are correct or /root/.my.cnf has the credentials. Exception message: (1045,
        \"Access denied for user 'root'@'::1' (using password: YES)\")"}

"""
решение которой найти не смог, буду признателен если покажете правильный метод.
