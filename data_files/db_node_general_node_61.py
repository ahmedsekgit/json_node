==============================
un petit form de donnees data to update displayed dans une div  
==============================
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<!--====form section start====-->
<div class="user-detail">
    <h2>Update Data</h2>
    <p id="msg"></p>
    <form id="updateForm" method="POST">
           <button type="submit" name="update">Submit</button>
           <input type="hidden" name="id" id="updateId">
           <label>Title</label>     
           <textarea name="title" placeholder="Enter a title" rows="1" cols="120" required></textarea> 
           <br>
           <br>
           <label>Description</label>               
           <textarea name="description" placeholder="Enter a description" rows="20" cols="240" required id="a"></textarea> 
   
    </form>
        </div>
</div>

</body>
</html>  
==============================
61 at  2021-10-29T15:22:52.000Z
==============================
