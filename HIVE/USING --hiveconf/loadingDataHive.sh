file_path="$1"
db_name="$2"
table_name="$3"
usage(){
 echo "you have used the command in a wrong manner "
 echo "USAGE : sh LOAD_DATA.sh <<filepath>> <<db_name>> <<table_name>> <<partition_name_optional>> "
}
executeLoadQuery(){
echo "---------LODADING DATA---------"
echo your file path : "$file_path" 
echo your db name : "$db_name"
echo your table name : "$table_name"
echo ------------------------------
hive --hiveconf file_path="$file_path" --hiveconf db_name="$db_name" --hiveconf table_name="$table_name" -e "use \${hiveconf:db_name};LOAD data local inpath '\${hiveconf:file_path}' into table \${hiveconf:table_name};select * from \${hiveconf:table_name};select count(*) from \${hiveconf.table_name;}" 
echo ------------------------------
}
if [ ! $1 ] 
then 
 usage
elif [ ! $2 ] 
then
 usage
elif [ ! $3 ]
then 
 usage
else
 executeLoadQuery
fi 

