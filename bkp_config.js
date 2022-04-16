const arr_json_paths =
[
"./db_json/bkp_db_test_general_test.json",
"./db_json/bkp_db_cpp_general_cpp.json",                
"./db_json/bkp_db_jquery_general_jquery.json",  
"./db_json/bkp_db_sql_general_sql.json",
"./db_json/bkp_db_css_general_css.json",                
"./db_json/bkp_db_node_general_node.json",      
"./db_json/bkp_db_test_general_test.json",
"./db_json/bkp_db_express_general_express.json",        
"./db_json/bkp_db_php_general_php.json",        
"./db_json/bkp_db_test_general_test_JSON_BKP.json",
"./db_json/bkp_db_html_general_html.json",              
"./db_json/bkp_db_python_general_python.json",  
"./db_json/bkp_db_tryit_general_tryit.json",
"./db_json/bkp_db_java_general_java.json",              
"./db_json/bkp_db_react_general_react.json",
"./db_json/bkp_db_javascript_general_javascript.json",  
"./db_json/bkp_db_shell_general_shell.json"
];

const arr_databases =
[
"db_test",		//0
"db_javascript",//1
"db_node",		//2
"db_tryit",		//3	
"db_express",	//4
"db_react",		//5
"db_jquery",	//6	
"db_shell",		//7
"db_css",		//8
"db_sql",		//9
"db_php",		//10
"db_html",		//11	
"db_cpp",		//12	
"db_python",	//13
"db_java"		//14
];

const arr_tables =
[
"general_test",			//0
"general_javascript",	//1
"general_node",			//2
"general_tryit",		//3	
"general_express",		//4
"general_react",		//5
"general_jquery",		//6	
"general_shell",		//7
"general_css",			//8
"general_sql",			//9
"general_php",			//10
"general_html",			//11	
"general_cpp",			//12	
"general_python",		//13
"general_java"			//14
];

const config = {
	JSON: 1,
	JSON_PATH: arr_json_paths[0],
	HOST: "localhost",
	HOST: "localhost",
	USER: "root",
  	PASSWORD: "",
  	DB: arr_databases[2],
  	dialect: "mysql",
  	arr_tables : arr_tables,
  	arr_databases :arr_databases,
  	arr_json_paths :arr_json_paths,
	database: 
	{
		host:	  'localhost', 	// database host
		user: 	  'root', 		// your database username
		password: '', 		// your database password
		port: 	  3306, 		// default MySQL port
		db: 	  arr_databases[2], 	// your database name
		table: 	  arr_tables[2] 		// your table name
	},
	server: 
	{
		host: '127.0.0.1',
		host_adr: 'http://localhost:',
		port: '3012'
	},
	redis: 
	{
	    host: '',
	    port: '',
	    password: ''
  	},
	 pool: 
	{
	    max: 5,
	    min: 0,
	    acquire: 30000,
	    idle: 10000
	}
}
module.exports = config


