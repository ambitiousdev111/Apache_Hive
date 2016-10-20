drop database IF EXISTS jsolab;
create database jsonlab;

use jsonlab;

create table rawTable(line string);


load data local inpath 'myJSON.json' into table rawTable;

select * from rawTable;


select get_json_object(line,'$.name'),get_json_object(line,'$.age'),get_json_object(line,'$.sex'),get_json_object(line,'$.city') from rawtable;

create table personInfoFromJsonTable(name string , age int, sex string , city string);

insert overwrite table personInfoFromJsonTable select x.* from rawTable lateral view json_tuple (line,'name','age','sex','city') x ;

select name,age ,sex from personInfoFromJsonTable; 
