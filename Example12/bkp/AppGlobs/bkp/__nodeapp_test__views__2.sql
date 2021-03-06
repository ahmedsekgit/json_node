============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 1
============================================================
file: ajax.ejs
============================================================
content: <script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script src="/magic.js"></script>
<h1>
    Quote: 
    <%=quote%>
    </h1>
    <form method="post" id="changeQuote">
        <input type="text" placeholder="Set quote of the day" name="quote"/>
        <input type="submit" value="Save">
    </form>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 2
============================================================
file: crud-form.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/highlight.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/prettier_standalone.js"></script>
        <script type="text/javascript" src="/javascripts/js/prettier_plugin_standalone.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>

    <script src="/crud_form.js"></script>

    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <!--adding bootstrap vap??r-->
    <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />

</head>

<script>
$(document).ready(function() 
{   if(typeof($('#show_div').val()) !== undefined)
    {
        format();
    }
});


function copyToClipboard(element) 
{
    var $temp = $("<textarea>");
    $("body").append($temp);
    $temp.val($(element).text().trim()).select();
    document.execCommand("copy");
    $temp.remove();
}

function format() 
{

    if(typeof($('#show_div').val()) !== undefined)
    {
        var htmlstr = $('#show_div').val();
        
        htmlstr = htmlstr.split(/\>[ ]?\</).join(">\n<");

        //htmlstr = htmlstr.split(/([*]?\{|\}[*]?\{|\}[*]?)/).join("\n");

        htmlstr = htmlstr.split(/[*]?\;/).join("\;\n    ");
        $('#show_div').val(htmlstr);
    }

}

hljs.initHighlightingOnLoad();
</script>
<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
<% include partials/address_port_value.ejs %>
<div class="container crud-form">

<form class="add-player-form" action="<%=(typeof editData!='undefined')?'/update/'+editData.id:'/create'%>
                " method="POST"> 
<% if(typeof editData!='undefined') { %>                
<a href="/links/show/<%=editData.id %>" target="_blank" rel="noopener" class="btn btn-sm btn-success float-right">Show</a>
<% } %>
                <div class="row">
                    <div class="col-25">
                        <label for="link">link</label>
                    </div>
                    <div class="col-75">
                        <input type="text" placeholder="link" name="link" class=".auto-resize" value="<%=(typeof editData!='undefined')? editData.link:''%>
                        "> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="title">Title</label>
                    </div>
                    <div class="col-75">
                        <input type="text" placeholder="title" name="title" class=".auto-resize" value="<%=(typeof editData!='undefined')? editData.title:''%>
                        "> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="description">Description</label>
                    </div>

                    <div class="col-75">
<textarea id='show_div' type="description" placeholder="description" name="description" class=".auto-resize">
<%=(typeof editData!='undefined')? editData.description:''%>
                    </textarea>
                    </div>

                </div>

                <div class="row">
                    <input type="submit" class = 'btn btn-primary' value="Submit" onclick="return confirm('Are you sure you want to proceed')">
                </div>
                <% if(typeof editData!='undefined') { %>  
             <a href="/delete/<%=editData.id %>" class="btn btn-primary btn-sm btn-danger float-right" onclick="return confirm('Are you sure you want to delete')">Delete</a>
             <% } %>     
            </form>
        </div>
    </body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 3
============================================================
file: crud-operation.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <title>CRUD Operation</title>
        <link rel='stylesheet' href='/stylesheets/style.css' />
    </head>
    <% include partials/header.ejs %>
<body>
    <% include partials/address_port_value.ejs %>
    <% if(typeof editData!='undefined'){ %>
        <h1>
<%= editData %>
</h1>
<form method="POST" action="/crudy/edit/<%=editId %>
    "> 
    <input type="submit" value="Update Data">
</form>
<% } else{ %>
    <h1>
        Crud Operation
    </h1>
    <h3>
        This is View Page
    </h3>
    <h4>
        Create Data
    </h4>
    <form method="POST" action="/crudy/create">
        <input type="submit" value="Create Data">
    </form>
    <% } %>
    <table border="1" >
        <tr>
            <th><a href="/crudy/form">Crud Form</a></th>
            <th><a href="/crudy/fetch">Fetch Data</a></th>
            <th><a href="/crudy/edit/5">Edit Data</a></th>
            <th><a href="/crudy/delete/5">Delete Data</a></th>
        </tr>
    </table>
    </body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 4
============================================================
file: crud-table.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
   <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />

</head>
<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
<% include partials/address_port_value.ejs %>
    <table class="table table-hover" cellpadding="3" cellspacing="0" border="0" style="width: 67%; margin: 0 auto 2em auto;">
        <thead>
            <tr>
                <th scope="col">Target</th>
                <th scope="col">Search text</th>
                <th scope="col">Treat as regex</th>
                <th scope="col">Use smart search</th>
            </tr>
        </thead>
        <tbody>
            <tr id="filter_global" class="table-active">
                <td>Global search</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="global_filter" id="global_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-primary" id="filter_col1" data-column="0">
                <td> + result number</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col0_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-secondary" id="filter_col2" data-column="1">
                <td>
                    <!-- Column - Delete -->
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col1_filter" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_regex" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;">
                </td>
            </tr>
            <tr class="table-success" id="filter_col3" data-column="2">
                <td>
                    <!-- Column - Edit -->
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col2_filter" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_regex" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;" >
                </td>
            </tr>
            <tr id="filter_col4" data-column="3">
                <td> + title</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col3_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col3_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col3_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-warning" id="filter_col5" data-column="4">
                <td> + description</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col4_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col4_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col4_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-dark" id="filter_col6" data-column="5">
                <td> + link</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col5_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col5_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col5_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-dark" id="filter_col7" data-column="6">
                <td> + Registration date</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col6_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col6_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col6_smart" checked= "checked">
                </td>
            </tr>
        </tbody>
    </table>
    <input type='hidden' id='keywords_vals_id' value="<%=(fetchData.length!=0)? fetchData.keywords_vals:''%>
    " /> <a href="/search">Search Data</a>
<a href="/read">Fetch Data</a> 
    <div class="table-data">
        <table style= "background-color: black; color: white;" border="1" id="my_table_sek" >
            <thead>
                <tr>
                    <th>S.N</th>
                    <th>Delete</th>
                    <th>Edit</th>
                    <th>title</th>
                    <th>description</th>
                    <th>link</th>
                    <th>reg date</th>
                </tr>
            </thead>
            <tbody>
<% if(fetchData.length!=0){ var i=1; fetchData.forEach(function(data){ %>
<tr>
    <td style= "background-color: black; color: white;">
        <% if(typeof data.href_to_file!='undefined') { %>
            <a href="<%=data.href_to_file%>" download rel="noopener noreferrer" target="_blank" title="<%=data.id%>"><%=data.id%></a>
            <% } else { %>
                <%=i%>
            <% } %>
    </td>


<td style= "background-color: black; color: white;"> <a href="/links/show/<%=data.id %>" target="_blank" rel="noopener" class="btn btn-sm btn-success float-right">Show</a> </td>

<td style= "background-color: black; color: white;"><a href="/edit/<%=data.id%>" target="_blank" rel="noopener" class="btn btn-sm  btn-dark  float-right">Edit</a></td>

    <td style= "background-color: black; color: white;">
        <%=data.title %>
    </td>

    <td style= "background-color: black; color: white;">
    <%=data.description %>
    </td>

<td style= "background-color: black; color: white;">
    <%=data.link %>
</td>

<td style= "background-color: black; color: white;">
    <%=data.reg_date %>
</td>

</tr>
<% i++; }) %>
    <% } else{ %>
    <tr>
<td style= "background-color: black; color: white;" colspan="7">No Data Found</td>
            </tr>
    <% } %>
            </tbody>
            <tfoot>
                <tr>
                    <th>S.N</th>
                    <th>Delete</th>
                    <th>Edit</th>
                    <th>title</th>
                    <th>description</th>
                    <th>link</th>
                    <th>reg date</th>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 5
============================================================
file: crud_mongo_form.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
<% include partials/header.ejs %>
    <body>
<% include partials/address_port_value.ejs %>    
        <!--====form section start====-->
        <div class="user-detail">
            <div class="form-title">
                <h2>
                    CRUD Form
                </h2>
                <a href="/crud_mongo/data-list_mongo">CRUD List</a> 
            </div>
            <hr>
            <form action="<%=(typeof userData!='undefined')? '/crud_mongo/edit_mongo/'+userData.id:'crud_mongo/create_mongo'%>
                "> 
                <label>Full Name</label>
                <input type="text" placeholder="Enter Full Name" name="fullName" required value="<%=(typeof userData!='undefined')? userData.fullName:''%>
                "> 
                <label>Email Address</label>
                <input type="email" placeholder="Enter Email Address" name="emailAddress" required value="<%=(typeof userData!='undefined')? userData.emailAddress:''%>
                "> 
                <label>City</label>
                <input type="city" placeholder="Enter Full City" name="city" required value="<%=(typeof userData!='undefined')? userData.city:''%>
                "> 
                <label>Country</label>
                <input type="text" placeholder="Enter Full Country" name="country" required value="<%=(typeof userData!='undefined')? userData.country:''%>
                "> 
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
    <!--====form section start====-->
</body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 6
============================================================
file: crud_mongo_list.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <% include partials/header.ejs %>
    <body>
    <% include partials/address_port_value.ejs %>
        <!--====form section start====-->
        <div class="table-data">
            <div class="list-title">
                <h2>
                    CRUD List
                </h2>
                <a href="/crud_mongo">CRUD From</a> 
            </div>
            <br>
            <br>
            <table border="1" >
                <tr>
                    <th>S.N</th>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>City</th>
                    <th>Country</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <% if(userData.length!=0){ var i=1; userData.forEach(function(data){ %>
                    <tr>
                        <td>
                            <%=i; %>
                            </td>
                            <td>
                                <%=data.fullName %>
                                </td>
                                <td>
                                    <%=data.emailAddress %>
                                    </td>
                                    <td>
                                        <%=data.city %>
                                        </td>
                                        <td>
                                            <%=data.country %>
                                            </td>
                                            <td><a href="/crud_mongo/edit_mongo/<%=data.id%>">Edit</a></td>
                                            <td><a href="/crud_mongo/delete_mongo/<%=data.id%>">Delete</a></td>
                                        </tr>
                                        <% i++; }) %>
                                            <% } else{ %>
                                                <tr>
                                                    <td colspan="7">No Data Found</td>
                                                </tr>
                                                <% } %>
                                                </table>
                                            </div>
                                        </body>
                                    </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 7
============================================================
file: crud_search.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_search.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="text/css" href="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">

    <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>  
<% include partials/address_port_value.ejs %>
    <div id="wrapper">
        <div id="search_box">
            <form method="post"action="search_term_key">
                <div class="ui-widget">
        <label for="search_keyword">Enter a keyword:</label>
<input type="text" id="search_keyword" name="search_keyword" class='' placeholder="Enter Keyword">
        <br>
        <label for="search_term">Enter searched terms:</label>
<input type="text" id="search_term" name="search_term" class=' form-control' placeholder="Enter Search">
        <input type='hidden' id='selectuser_ids' />
        <div class="form-group" >
            <label for="pwd">Nombre de rendus maximal:</label>
            <select name="limit_sql" id="limit_sql" class="">
                <option value=25>25</option>
                <option value=50>50</option>
                <option value=100>100</option>
                <option value=1000>1000</option>
                <option value=10000>10000</option>
            </select>
            <label for="display">what to display ? :</label>
            <select name="limit_display" id="limit_display" class="">
                <option value="titles">titles</option>
                <option value="titles_descriptions">titles and descriptions</option>
                <option value="titles_links">titles and links</option>
                <option value="all">all</option>
            </select>
                    </div>
                </div>
                <input type="submit" name="search" value="SEARCH">
            </form>
        </div>
        <div id="result_div"></div>
    </div>
</body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 8
============================================================
file: crud_titles.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
    
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />

</head>
<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
<% include partials/address_port_value.ejs %>
    <table class="table table-hover" cellpadding="3" cellspacing="0" border="0" style="width: 67%; margin: 0 auto 2em auto;">
        <thead>
            <tr>
                <th scope="col">Target</th>
                <th scope="col">Search text</th>
                <th scope="col">Treat as regex</th>
                <th scope="col">Use smart search</th>
            </tr>
        </thead>
        <tbody>
            <tr id="filter_global" class="table-active">
                <td>Global search</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="global_filter" id="global_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-primary" id="filter_col1" data-column="0">
                <td> + result number</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col0_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-secondary" id="filter_col2" data-column="1">
                <td>+ title</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col1_filter" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_regex" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;">
                </td>
            </tr>
            <tr class="table-success" id="filter_col3" data-column="2">
                <td>+ Registration date</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col2_filter" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_regex" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;" >
                </td>
            </tr>
        </tbody>
    </table>
    <input type='hidden' id='keywords_vals_id' value="<%=(fetchData.length!=0)? fetchData.keywords_vals:''%>
    " /> <a href="/search">Search Data</a>
<a href="/read">Fetch Data</a> 
    <div class="table-data">
        <table style= "background-color: black; color: white;" border="1" id="my_table_sek" >
            <thead>
                <tr>
                    <th>S.N</th>
                    <th>title</th>
                    <th>reg date</th>
                </tr>
            </thead>
            <tbody>
                <% if(fetchData.length!=0){ var i=1; fetchData.forEach(function(data){ %>
                    <tr>
                        <td style= "background-color: black; color: white;">
                        <% if(typeof data.href_to_file!='undefined') { %>
<a href="<%=data.href_to_file%>" download rel="noopener noreferrer" target="_blank" title="<%=data.id%>"><%=data.id%></a>
                        <% } else { %>
                            <%=i%>
                        <% } %>
                        </td>
                            <td style= "background-color: black; color: white;">
                                <%=data.title %>
                                </td>
                                <td style= "background-color: black; color: white;">
                                    <%=data.reg_date %>
                                    </td>
                                </tr>
                                <% i++; }) %>
                                    <% } else{ %>
                                        <tr>
                                            <td style= "background-color: black; color: white;" colspan="7">No Data Found</td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>S.N</th>
                                                <th>title</th>
                                                <th>reg date</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </body>
                        </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 9
============================================================
file: crud_titles_descriptions.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">

    <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>

<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
<% include partials/address_port_value.ejs %>
    <table class="table table-hover" cellpadding="3" cellspacing="0" border="0" style="width: 67%; margin: 0 auto 2em auto;">
        <thead>
            <tr>
                <th scope="col">Target</th>
                <th scope="col">Search text</th>
                <th scope="col">Treat as regex</th>
                <th scope="col">Use smart search</th>
            </tr>
        </thead>
        <tbody>
            <tr id="filter_global" class="table-active">
                <td>Global search</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="global_filter" id="global_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-primary" id="filter_col1" data-column="0">
                <td> + result number</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col0_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-secondary" id="filter_col2" data-column="1">
                <td>+ title</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col1_filter" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_regex" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;">
                </td>
            </tr>
            <tr class="table-success" id="filter_col3" data-column="2">
                <td>+ description</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col2_filter" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_regex" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;" >
                </td>
            </tr>
            <tr id="filter_col4" data-column="3">
                <td> + Registration date</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col3_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col3_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col3_smart" checked= "checked">
                </td>
            </tr>
        </tbody>
    </table>
    <input type='hidden' id='keywords_vals_id' value="<%=(fetchData.length!=0)? fetchData.keywords_vals:''%>
    " /> <a href="/search">Search Data</a>
<a href="/read">Fetch Data</a> 
    <div class="table-data">
        <table style= "background-color: black; color: white;" border="1" id="my_table_sek" >
            <thead>
                <tr>
                    <th>S.N</th>
                    <th>title</th>
                    <th>description</th>
                    <th>reg date</th>
                </tr>
            </thead>
            <tbody>
                <% if(fetchData.length!=0){ var i=1; fetchData.forEach(function(data){ %>
                    <tr>
                        <td style= "background-color: black; color: white;">
                        <% if(typeof data.href_to_file!='undefined') { %>
<a href="<%=data.href_to_file%>" download rel="noopener noreferrer" target="_blank" title="<%=data.id%>"><%=data.id%></a>
                        <% } else { %>
                            <%=i%>
                        <% } %>
                        </td>
                            <td style= "background-color: black; color: white;">
                                <%=data.title %>
                                </td>
                                <td style= "background-color: black; color: white;">
                                    <%=data.description %>
                                    </td>
                                    <td style= "background-color: black; color: white;">
                                        <%=data.reg_date %>
                                        </td>
                                    </tr>
                                    <% i++; }) %>
                                        <% } else{ %>
                                            <tr>
                                                <td style= "background-color: black; color: white;" colspan="7">No Data Found</td>
                                            </tr>
                                            <% } %>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>S.N</th>
                                                    <th>title</th>
                                                    <th>description</th>
                                                    <th>reg date</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </body>
                            </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 10
============================================================
file: crud_titles_links.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>  
<% include partials/address_port_value.ejs %>
    <table class="table table-hover" cellpadding="3" cellspacing="0" border="0" style="width: 67%; margin: 0 auto 2em auto;">
        <thead>
            <tr>
                <th scope="col">Target</th>
                <th scope="col">Search text</th>
                <th scope="col">Treat as regex</th>
                <th scope="col">Use smart search</th>
            </tr>
        </thead>
        <tbody>
            <tr id="filter_global" class="table-active">
                <td>Global search</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="global_filter" id="global_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="global_filter" id="global_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-primary" id="filter_col1" data-column="0">
                <td> + result number</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col0_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col0_smart" checked= "checked">
                </td>
            </tr>
            <tr class="table-secondary" id="filter_col2" data-column="1">
                <td>+ title</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col1_filter" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_regex" style="opacity:0; position:absolute; left:9999px;">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col1_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;">
                </td>
            </tr>
            <tr class="table-success" id="filter_col3" data-column="2">
                <td>+ link</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col2_filter" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_regex" style="opacity:0; position:absolute; left:9999px;" >
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col2_smart" checked= "checked" style="opacity:0; position:absolute; left:9999px;" >
                </td>
            </tr>
            <tr id="filter_col4" data-column="3">
                <td> + Registration date</td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="text" class="column_filter" id="col3_filter">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col3_regex">
                </td>
                <td align="center">
                    <input style= "background-color: black; color: white;" type="checkbox" class="column_filter" id="col3_smart" checked= "checked">
                </td>
            </tr>
        </tbody>
    </table>
    <input type='hidden' id='keywords_vals_id' value="<%=(fetchData.length!=0)? fetchData.keywords_vals:''%>
    " /> <a href="/search">Search Data</a>
<a href="/read">Fetch Data</a> 
    <div class="table-data">
        <table style= "background-color: black; color: white;" border="1" id="my_table_sek" >
            <thead>
                <tr>
                    <th>S.N</th>
                    <th>title</th>
                    <th>link</th>
                    <th>reg date</th>
                </tr>
            </thead>
            <tbody>
                <% if(fetchData.length!=0){ var i=1; fetchData.forEach(function(data){ %>
                    <tr>
                       <td style= "background-color: black; color: white;">
                        <% if(typeof data.href_to_file!='undefined') { %>
<a href="<%=data.href_to_file%>" download rel="noopener noreferrer" target="_blank" title="<%=data.id%>"><%=data.id%></a>
                        <% } else { %>
                            <%=i%>
                        <% } %>
                        </td>
                            <td style= "background-color: black; color: white;">
                                <%=data.title %>
                                </td>
                                <td style= "background-color: black; color: white;">
                                    <%=data.link %>
                                    </td>
                                    <td style= "background-color: black; color: white;">
                                        <%=data.reg_date %>
                                        </td>
                                    </tr>
                                    <% i++; }) %>
                                        <% } else{ %>
                                            <tr>
                                                <td style= "background-color: black; color: white;" colspan="7">No Data Found</td>
                                            </tr>
                                            <% } %>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>S.N</th>
                                                    <th>title</th>
                                                    <th>link</th>
                                                    <th>reg date</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </body>
                            </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 11
============================================================
file: dashboard.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>   
<% include partials/address_port_value.ejs %>
    <body>
    <% include partials/address_port_value.ejs %>
        <h2>
            Welcome to Ref Search 
        </h2>
        <p>
            <b>Login Email</b> - 
            <%=email %>
            </p>
            <p><a href="/logout">Logout</a></p>
 </body>
    </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 12
============================================================
file: display-image.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <% include partials/header.ejs %>
    <body>
    <% include partials/address_port_value.ejs %>
        <% if(imagePath.length!=0){ imagePath.forEach(function(data){ %>
            <img src="/images/<%=data.image_name; %>
            " width="200px"> 
            <% }) %>
                <% } else{ %>
                    <p>No Image in the Database</p>
                    <% } %>
                    </body>
                </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 13
============================================================
file: email-form.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
            <%= title %>
            </title>
        </head>
        <body>
        <% include partials/address_port_value.ejs %>
            <!--====form section start====-->
            <div class="user-detail">
                <h2>
                    Send mail with nodejs
                </h2>
                <hr>
                <form action="/send-email" method="POST">
                    <label>To</label>
                    <input type="text" placeholder="Receiver Email" name="to" required >
                    <label>Subject</label>
                    <input type="text" placeholder="Enter Email Address" name="subject" required >
                    <label>Message</label>
                    <textarea placeholder="Enter Full Country" name="message" required ></textarea>
                    <button type="submit">Send and Email</button>
                </div>
            </div>
            <!--====form section start====-->
        </body>
    </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 14
============================================================
file: error.ejs
============================================================
content: <h1>
    <%= message %>
    </h1>
    <h2>
        <%= error.status %>
        </h2>
        <pre>
            <%= error.stack %>
            </pre>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 15
============================================================
file: files_list.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/highlight.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/typeahead.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/hogan-3.0.2.min.js"></script>
        <!-- <script>
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 

    <script>hljs.initHighlightingOnLoad();</script>

    <!--<script src="/links_list.js"></script>-->
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <!--adding highlight all dark stryle-->

    <link rel="stylesheet" href="/stylesheets/css/a11y-dark.css" />

    <link rel="stylesheet" href="/stylesheets/agate.min.css" />
    
    <!--adding bootstrap vap??r-->
    <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
<style> 
        pre {
            height: 20em;
            width: 80vw;
        }
</style>
<script type="text/javascript">

$(function() {
$("#search-google").autocomplete({
        name: 'search-google',
        source: 'http://localhost:3000/search?key=%QUERY',
        limit: 4
    });
});
$('#search-google').on( 'keyup click', function () {
    
  } );

</script>
</head>

    <body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <div id="result_div"></div>    
        <div class="table-data">
            <h2>
                Displaying file names
            </h2>
            <table border="1">
                <tr>
                    <th>Number</th>
                    <th>Title</th>
                    <th>id</th>
                </tr>
                <% if(fileData.length!=0){ var i=1; fileData.forEach(function(data){ %>
            
                <tr>
                <td>
                <%=i; %>
                </td>
                <td>

                    
                    <%=data.title %>
                    
                </td>
                <td>
                     
                    <%=data.id %>
             
                </td>
                </tr>
                    <% i++; }) %>
                        <% } else{ %>
                            <tr>
                                <td colspan="7">No Data Found</td>
                </tr>
                            <% } %>
                            </table>
                        </div>
                    </body>
                </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 16
============================================================
file: index.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>

        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <script src="/javascripts/js/bootstrap-5.1.1-dist/js/bootstrap.min.js"></script>

    <script src="/main.js"></script>

    
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">

    
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />

    <link rel="stylesheet" href="/stylesheets/css/main.css" />

</head>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 70%;
    margin: auto;
  }
  </style>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>

        <% include partials/address_port_value.ejs %>
            <h1>
                <%= title %>
                </h1>
                <p>
                    Welcome to 
                    <%= title %>
                    </p>
                    
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="/images/1.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="/images/2.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="/images/3.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beautiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="/images/4.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beautiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
                </body>
            </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 17
============================================================
file: keywords.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>   
    <% include partials/address_port_value.ejs %>
        <!--====form section start====-->
        <div class="user-detail">
            <h2>
                Create keyword Data
            </h2>
            <form action="/keywords/create" method="POST">
                <label>keyword</label>
                <input type="text" placeholder="Enter keyword " name="keyword" required>
                <label>link</label>
                <input type="text" placeholder="Enter link " name="link" >
                <label>title</label>
                <input type="text" placeholder="Enter title " name="title" >
                <label>description</label>
                <input type="text" placeholder="Enter description " name="description" >
                <button type="submit">Submit</button>
            </div>
        </div>
        <!--====form section start====-->
    </body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 18
============================================================
file: link-form.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/highlight.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/prettier_standalone.js"></script>
        <script type="text/javascript" src="/javascripts/js/prettier_plugin_standalone.js"></script>

        
        <!-- <script>
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 

<script>
$(document).ready(function() 
{
    $('#show_div').val(format());
});


function copyToClipboard(element) 
{
    var $temp = $("<textarea>");
    $("body").append($temp);
    $temp.val($(element).text().trim()).select();
    document.execCommand("copy");
    $temp.remove();
}

function format() 
{
        
     return prettier.format
     ($('#show_div').val(), 
     {
        plugins: prettierPlugins,
        parser: "php"
      });
  }

hljs.initHighlightingOnLoad();
</script>

    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <!--adding highlight all dark stryle-->

    <link rel="stylesheet" href="/stylesheets/css/a11y-dark.css" />

    <link rel="stylesheet" href="/stylesheets/agate.min.css" />

    <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    


<style> 
    
pre 
{
    height: 20em;
    width: 80vw;
    text-align: left;
}

</style>
</head>

<body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
<% include partials/address_port_value.ejs %>
<!--====form section start====-->
<!--====form section start====-->
<div class="container ">
    <!-- <%= (typeof showData!='undefined')?'':"" %> -->
   <!-- <%= (typeof showData!='undefined')?'':"" %> -->

            <div class="">
                <div class="">
                    <label for="title">Title</label>
                </div>
                <div class="">
                <code style = "background-color:black;" class="hljs js"> 
                    <div><%=(typeof showData!='undefined')? showData.title:''%></div>
                </code> 
                </div>
            </div>
                        
            <div class="">    
                <div class="">
                    <label for="description">Description</label>
                </div>
                <button type="button" class="btn btn-success btn-sm" onclick="copyToClipboard('#show_div')">Copy</button>
                <a href="/edit/<%=showData.id%>" target="_blank" rel="noopener" class="btn btn-sm btn-dark float-center">Edit</a>
                <% if(typeof showData.href_to_file!='undefined') { %>
                <a href="<%=showData.href_to_file%>" download rel="noopener noreferrer" target="_blank" title="<%=showData.id%>" class="btn btn-sm  btn-info float-left"><%=showData.id%></a>
                <% } %>
                <div id = 'show_div' class="" >
                    <pre><code style = "text-align:left; background-color:black;" class="hljs js">
<%=(typeof showData!='undefined')? showData.description.trim():''%>
                    
                    </pre></code>
                </div>
            </div>
            <!--
            <div class="row">
                <div class="col-25">
                    <label for="link">link</label>
                </div>
                <div class="col-75">
                <code class="hljs js"> 
                    <div><%=(typeof showData!='undefined')? showData.link:''%></div>
                </code> 
                </div>
            </div>
            -->
            <br>
            <div class="row">
            <!--<input type="submit" value="Return" onclick="return confirm('Are you sure you want to proceed')">-->
            </div>

</div>
                <!--====form section start====-->
                <!--====form section start====-->
</body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 19
============================================================
file: link_search.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/highlight.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/typeahead.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/hogan-3.0.2.min.js"></script>
        <!-- <script>
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 

    <script>hljs.initHighlightingOnLoad();</script>

    <script src="/link_form.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <!--adding highlight all dark stryle-->
    
    <link rel="stylesheet" href="/stylesheets/css/a11y-dark.css" />
    
    <link rel="stylesheet" href="/stylesheets/agate.min.css" />
    
    <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
    
<style> 
        pre {
            height: 20em;
            width: 80vw;
        }
</style>
<script type="text/javascript">
$(function() {
$("#search-google").autocomplete({
        name: 'search-google',
        source: 'http://localhost:3000/search?key=%QUERY',
        limit: 4
    });
});
$('#search-google').on( 'keyup click', function () {
    
  } );

</script>
</head>

    <body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>   
    <% include partials/address_port_value.ejs %>
        <div class="row dsp">
        <h2> Autocomplete Search </h2>
        
            <!-- <input class="typeahead tt-query" spellcheck="false" autocomplete="off" name="typeahead" type="text" /> -->
        </div>
        </div>
            <div class="bs-example">
            <input type="text" name="typeahead" class="typeahead tt-query" autocomplete="off" spellcheck="false" placeholder="Type your Query" size="50">
            </div>
            <pre><code>
                <div id='typeahead_response'> 
            </pre></code>        
    </body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 20
============================================================
file: links-list.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/highlight.min.js"></script>

        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/typeahead.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/hogan-3.0.2.min.js"></script>
        <!-- <script>
        </script>
        <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
        <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
        --> 

        <script>hljs.initHighlightingOnLoad();</script>

        <script src="/links_list.js"></script>
        <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
        <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
        <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
        <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
        <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
        <!--adding highlight all dark stryle-->

        <link rel="stylesheet" href="/stylesheets/css/a11y-dark.css" />

        <link rel="stylesheet" href="/stylesheets/agate.min.css" />
        
        <!--adding bootstrap vap??r-->
        <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
        <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
        <link rel="stylesheet" href="/stylesheets/css/main.css" />
    
<style>
        body {
                background-color : #000000;
                color: #ffffff; 

            } 
    .table-wrapper {
        margin-top: 50px;
    }

    .player-img {
        width: 40px;
        height: 40px;
    }
    textarea {
      height: 500px;
    }
    input, textarea {

                width: 100%;
                background-color : #000000;
                color: #ffffff; 

            }       
    .add-player-form {
        margin-top: 50px;
    }
</style>
<script type="text/javascript">

$(function() {
$("#search-google").autocomplete({
        name: 'search-google',
        source: 'http://localhost:3000/search?key=%QUERY',
        limit: 4
    });
});
$('#search-google').on( 'keyup click', function () {
    
  } );

</script>
</head>

    <body>
<nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
<% include partials/address_port_value.ejs %>
<h2 class="demoHeaders">Dialog</h2>
    <p>
        <button id="dialog-link3" class="ui-button ui-corner-all ui-widget">
            <span class=""></span>Open Dialog
        </button>
    </p>
<!-- ui-dialog -->
    <div id="dialog" title="Dialog Title">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>

        <div class="row dsp">
        <div id="result_div"></div>    
        <h2> Search Area </h2>
            <!--<form method="post" action="/links/search_link_ajax" onsubmit="return do_search();">-->
            <form method="post" action="" onsubmit="return do_search();">    
                <div class="ui-widget">
                    <label for="search_link_term">Search in titles and descriptions:</label>
                    <input type="text" id="search_link_term" name="search_link_term" class='' placeholder="Enter Search">
                    <input type='hidden' id='selected_link_ids' />
                    <input type='hidden' id='keywords_link_vals' />
                    <div class="form-group" >
                        <label for="pwd">Nombre de rendus maximal:</label>
                        <select name="limit_link_sql" id="limit_link_sql" class="">
                            <option value=100>100</option>
                            <option value=1000>1000</option>
                            <option value=10000>10000</option>
                        </select>
                    </div>
                </div>
                <label for="search_link_keyword">Search in titles:</label>
                    <input type="text" id="search_link_keyword" name="search_link_keyword" class='' placeholder="Enter Keyword">
                    
                <input type="submit" name="search" value="SEARCH">
            </form>
        </div>
        <!--
        <div class="bs-example">
        <input type="text" name="typeahead" class="typeahead tt-query" autocomplete="off" spellcheck="false" placeholder="Type your Query">
        </div>-->
        <div id = 'main_div_bobnamespringsummer' class="table-data">
            <h2>
                Displaying Data
                <%= %>
            </h2>
            <table border="1">
                <tr>
                    <th>Number</th>
                    <th>Show</th>
                    <th>Link</th>
                    <th>Title</th>
                    <th>Dialog</th>
                    
                </tr>
                <% if(linkData.length!=0){ var i=1; linkData.forEach(function(data){ %>
                
                <tr id=link_div_<%=data.id%> class="link_div_bobnamespringsummer">
                <td>
                <%=i; %>
                </td>
                <td>
                    <a href="/links/show/<%=data.id %>" target="_blank" rel="noopener" class="btn btn-sm btn-success float-right">Show</a>
                </td>
                <td>
                    <%=data.link %>
                </td>

                <td>
                    <%=data.title %>
                </td>
                <td>
                    <p>
                        <button id="dialog-link" class="dialog_div ui-button ui-corner-all ui-widget">
                            <span id =<%=data.id%>  class=""></span>Open Dialog
                        </button>
                    </p>
                    <!-- ui-dialog -->
                    <div id=dialog_div_<%=data.id%> class = 'dialog_div_links' title=<%=data.title %> >
                        <p><%=data.description %></p>
                    </div>
                </td>
                </tr>
                    <% i++; }) %>
                        <% } else{ %>
                            <tr>
                                <td colspan="7">No Data Found</td>
                </tr>
                            <% } %>
                            </table>
                        </div>
                    </body>
                </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 21
============================================================
file: login-form.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <div class="login-form">
            <h3>
                Login Form
            </h3>
            <p>
                <%=(typeof alertMsg!='undefined')? alertMsg:''%>
                </p>
                <form method="post" action="/login">
                    <input type="email" placeholder="Email Address" name="email_address" required">
                    <input type="password" placeholder="Password" name="password" required">
                    <button type="submit">Login Now</button>
                    <a href="/register">New Registration</a> 
                </div>
            </form>
        </div>
    </body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 22
============================================================
file: registration-form.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <div class="registration-form">
            <h3>
                Registration Form
            </h3>
            <p>
                <%=(typeof alertMsg!='undefined')? alertMsg:''%>
                </p>
                <form method="post" action="register">
                    <div class="form-container">
                        <div>
                            <input type="text" placeholder="First Name" name="first_name" >
                        </div>
                        <div>
                            <input type="text" placeholder="Last Name Name" name="last_name" >
                        </div>
                    </div>
                    <div class="form-container">
                        <div>
                            <input type="password" placeholder="Password" name="password">
                        </div>
                        <div>
                            <input type="password" placeholder="Confirm Password" name="confirm_password" >
                        </div>
                    </div>
                    <div class="form-container">
                        <div>
                            <input type="email" placeholder="Email Address" name="email_address" >
                        </div>
                        <div>
                            <br>
                            <input type="radio" value="male" name="gender" >
                            <label>Male</label>
                            <input type="radio" value="female" name="gender" >
                            <label>Female</label>
                        </div>
                    </div>
                    <button type="submit">Register Now</button>
                    <a href="/login">Login</a>

                </form>
            </div>
       </body>
    </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 23
============================================================
file: upload-form.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <form action="/store-image" method="POST" enctype="multipart/form-data">
            <label>Store Image</label>
            <br>
            <br>
            <p>
                <%=(typeof alertMsg!='undefined')? alertMsg:''%>
                </p>
                <input type="file" name="image" multiple>
                <button type="submit">Upload</button>
            </form>
        </body>
    </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 24
============================================================
file: user-form.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <!--====form section start====-->
        <div class="user-detail">
            <hr>
            <form action="/create" method="POST">
                <label>Full Name</label>
                <input type="text" placeholder="Enter Full Name" name="full_name" required >
                <label>Email Address</label>
                <input type="email" placeholder="Enter Email Address" name="email_address" required>
                <label>City</label>
                <input type="city" placeholder="Enter Full City" name="city" required>
                <label>Country</label>
                <input type="text" placeholder="Enter Full Country" name="country" required>
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
    <!--====form section start====-->
</body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 25
============================================================
file: user-list.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <div class="table-data">
            <h2>
                Display Data using Node.js & MySQL
            </h2>
            <table border="1">
                <tr>
                    <th>Number</th>
                    <th>Link</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Registry date</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <% if(userData.length!=0){ var i=1; userData.forEach(function(data){ %>
                <tr>
                <td>
                <%=i; %>
                </td>
                <td>
                    <%=data.title %>
                </td>

                <td>
                <%=data.link %>
                </td>
                
                <td>
                    <%=data.description %>
                    </td>
                    <td>
                        <%=data.reg_date %>
                        </td>
                        <td><a href="/users/edit/<%=data.id%>">Edit</a></td>
                        <td><a href="/users/delete/<%=data.id%>">Delete</a></td>
                    </tr>
                    <% i++; }) %>
                        <% } else{ %>
                            <tr>
                                <td colspan="7">No Data Found</td>
                            </tr>
                            <% } %>
                            </table>
                        </div>
                    </body>
                </html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 26
============================================================
file: user-mongo-form.ejs
============================================================
content: <!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <!--====form section start====-->
        <div class="user-detail">
            <div class="form-title">
                <h2>
                    CRUD Form
                </h2>
                <a href="/user/data-list">CRUD List</a> 
            </div>
            <hr>
            <form action="/user/edit/<%=userData.id %>
                " method="POST"> 
                <label>Full Name</label>
                <input type="text" placeholder="Enter Full Name" name="fullName" required value="<%=(typeof userData!='undefined')? userData.fullName:''%>
                "> 
                <label>Email Address</label>
                <input type="email" placeholder="Enter Email Address" name="emailAddress" required value="<%=(typeof userData!='undefined')? userData.emailAddress:''%>
                "> 
                <label>City</label>
                <input type="city" placeholder="Enter Full City" name="city" required value="<%=(typeof userData!='undefined')? userData.city:''%>
                "> 
                <label>Country</label>
                <input type="text" placeholder="Enter Full Country" name="country" required value="<%=(typeof userData!='undefined')? userData.country:''%>
                "> 
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
    <!--====form section start====-->
</body>
</html>

============================================================


============================================================
path : __home__sea__nodeapp_test__views__
============================================================
============================================================
id: 27
============================================================
file: user-table.ejs
============================================================
content: <!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="/javascripts/js/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
        <script src="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/DataTables/datatables.min.js"></script>
        <script type="text/javascript" src="/javascripts/js/jquery.mark.min.js"></script>
        <!-- Plugin -->
        <script src="/javascripts/js/DataTables/jquery.dataTables.colResize.js"></script>
        <!-- <script>
        6
    </script>
    <script type="text/javascript" src="/javascripts/js/ajax-script.js"></script>
    <script type="text/javascript" src="/javascripts/js/autocomplete.js"></script>
    --> 
    <script src="/crud_table.js"></script>
    <script src="/main.js"></script>
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.css">
    <link rel="stylesheet" href="/javascripts/js/jquery-ui-1.12.1/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="/javascripts/js/DataTables/datatables.min.css"/>
    <link rel="stylesheet" href="/javascripts/js/DataTables/jquery.dataTables.colResize.css">
     <!--adding bootstrap vap??r-->
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.css" />
    <link rel="stylesheet" href="/stylesheets/css/bootstrap.4.4.0.min.css" />
    <link rel="stylesheet" href="/stylesheets/css/main.css" />
</head>
<body>
    <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header"> <a class="navbar-brand" href="/">Ref Search</a>

                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/form/" target="_parent"  class="btn btn-sm btn-success float-right">Add a new record</a> 
                    </li>
                </ul>
                <ul class="nav nav-pills nav-stacked">
                    <li class="active">
                        <a href="/links/links-list/" target="_parent"  class="btn btn-sm btn-warning float-right">Links list</a>
                    </li>
                    <li>
                        <a href="/file/checkData/" target="_parent"  class="btn btn-sm btn-dark float-right">Check files registred data</a>
                    </li>
                    <li>
                        <a href="/file/files/" target="_parent"  class="btn btn-sm btn-info float-right">Show available files list</a>
                    </li>
                    <li>
                        <a href="/read/" target="_parent"  class="btn btn-sm btn-danger float-right">Datatable listing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="">
                        <a href="/register"><span class="glyphicon glyphicon-user "></span> Sign Up</a>
                    </li>
                    <li class="">
                        <a href="/login"><span class="glyphicon glyphicon-log-in "></span> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
    <% include partials/address_port_value.ejs %>
        <!--====form section start====-->
        <div class="table-data">
            <table border="1" >
                <tr>
                    <th>S.N</th>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>City</th>
                    <th>Country</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <% if(userData.length!=0){ var i=1; userData.forEach(function(data){ %>
                    <tr>
                        <td>
                            <%=i; %>
                            </td>
                            <td>
                                <%=data.full_name %>
                                </td>
                                <td>
                                    <%=data.email_adress %>
                                    </td>
                                    <td>
                                        <%=data.city %>
                                        </td>
                                        <td>
                                            <%=data.country %>
                                            </td>
                                            <td><a href="/edit/<%=data.id%>">Edit</a></td>
                                            <td><a href="/delete/<%=data.id%>">Delete</a></td>
                                        </tr>
                                        <% i++; }) %>
                                            <% } else{ %>
                                                <tr>
                                                    <td colspan="7">No Data Found</td>
                                                </tr>
                                                <% } %>
                                                </table>
                                            </div>
                                        </body>
                                    </html>

============================================================


