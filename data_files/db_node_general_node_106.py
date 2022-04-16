==============================
codegrepper nodejs node loop files and push to array to display on screen with nunjucks  
==============================
<!-- Nunjucks to loop the array and show each file in a list -->
<ul>
  {% for file in fileList %}
  	<li>{{ file }}</li>
  {% endfor %}
</ul>

const directoryPath = './path/to/dir/';

// loop files in directory and push to an array and pass to rendered screen
router.get('/slug', (req, res) => {
    let fileList = [];
    fs.readdir(directoryPath, (err, file) => {
        if (err) {
            return console.log('Unable to scan directory: ' + err);
        } 
        file.forEach((file) => {
            fileList.push(file);
        });
      	// Passing the array to the rendered screen
        res.render('rendered/screen', {fileList});
    });
});  
==============================
106 at  2021-10-29T15:22:52.000Z
==============================
