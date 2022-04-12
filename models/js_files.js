const fs = require('fs');
var JSONStream = require('JSONStream');
var es = require('event-stream');
module.exports = {
    OverWriteFile(FilePath, StrData)
    { 
        fs.writeFileSync(FilePath, StrData);
    },

    AppendToFile(FilePath, StrData)
    {
         
        fs.appendFile(FilePath, StrData,function(err){
        if(err) throw err;
        });
        
    },
    ReadFileSync(FileName)
    {
        if (!(fs.existsSync(FileName))) 
        {
            console.log("ReadFileSync: "+FileName + " not found");
            return 0;
        }
        else
        {   
            let rawdata = fs.readFileSync(FileName);
            return rawdata;
            
        }
    },

    ArrObjFromFile: function(FileName) {
        if (!(fs.existsSync(FileName))) 
        {
            console.log("ArrObjFromFile: "+FileName + " not found");
            return 0;
        }
        else
        {   //console.log("ArrObjFromFile: getting arrObjs from "+FileName + " ");
            let tmp_arr = [];
            const rawdata = fs.readFileSync(FileName);
                   tmp_arr= JSON.parse(rawdata);
            return tmp_arr;
        }
    },

    ArrObjToFile: function(FileName, myArray) {
        fs.writeFileSync(FileName, JSON.stringify(myArray, null, 2), 'utf-8');
        
    },

    DeleteFile(FilePath)
    {
        if (!(fs.existsSync(FilePath))) 
        {
            //console.log("DeleteFile: "+FilePath +' not found!');
            return 0;
        }
        else
        {  
            fs.unlink(FilePath, function (err) {
              if (err) throw err;
              console.log("DeleteFile: "+FilePath +' deleted!');
            }); 
        }
    },
    
    CreateEmptyFile : function (FilePath) 
    {   
        if (!(fs.existsSync(FilePath))) 
        {
            // create an empty file
            fs.open(FilePath, 'w', (err, file) => {
                if (err) {
                    throw err;
                }             
            });
        }
        
    },

    CreateEmptyDirRec : function (FilePath) 
    {   
        if (!(fs.existsSync(FilePath))) 
        {
            fs.mkdirSync(FilePath, { recursive: true }, 0755);
        } 
        
    },
    
    AppendToFileArrObj(FilePath, StrData)
    {
        StrData = JSON.stringify(StrData, null, 2);
        fs.appendFile(FilePath, StrData,function(err){
        if(err) throw err;
        });
        
    },

    RenameFile(FileName, NewFileName)
    {
        if (!(fs.existsSync(FileName))) 
        {
            console.log("RenameFile: "+FileName + " not found");
            return 0;
        }
        else
        {  
            fs.rename(FileName, NewFileName, function (err) {
              if (err) throw err;
              console.log("RenameFile: "+FileName +' Renamed! to '+NewFileName);
            }); 
        }
    },

    ReadFileToString(FileName)
    {
        if (!(fs.existsSync(FileName))) 
        {
            console.log("ReadFileToString: "+FileName + " not found");
            return 0;
        }
        else
        {   
            return fs.readFileSync(FileName, 'utf8');
            
        }
    },
    
    RemoveDuplicInFile(FileName, Spliter)
    {
        if (!(fs.existsSync(FileName))) 
        {
            //console.log("RemoveDuplicInFile: "+FileName + " not found");
            return 0;
        }
        else
        {  
    
            let Str1 = this.ReadFileToString(FileName);
            let Arr1 = Str1.split(Spliter);
            let Arr2 = this.ArrUnique(Arr1);
            this.ArrObjToFile(FileName,Arr2);
        }
    },

    ArrUnique: function(myArray)
    {
       let uniqueArray = myArray.filter(function(elem, pos) {
                return myArray.indexOf(elem) == pos;
            });
       return uniqueArray;
    },

    FilegetStream: function(FileName)  
    {
        var getStream = function() {
            var jsonData = FileName,
                stream = fs.createReadStream(jsonData, {
                    encoding: 'utf8'
                }),
                parser = JSONStream.parse('*');
            return stream.pipe(parser);
        };

        getStream()
            .pipe(es.mapSync(function(data) {
                //console.dir("JSONStream");
                //console.dir(data);
            }));
    }, 

    FileExists: function(FilePath)
    {
        if (fs.existsSync(FilePath))
            return 1;
        else
            return 0;
    },

    rmDir : function(dirPath, removeSelf) 
    {
        try 
        {
            var files = fs.readdirSync(dirPath);
        } 
        catch (e) 
        {
            return;
        }
        if (files.length > 0)
            for (var i = 0; i < files.length; i++) 
            {
                var filePath = dirPath + '/' + files[i];
                if (fs.statSync(filePath).isFile())
                    fs.unlinkSync(filePath);
                else
                    rmDir(filePath);
            }
        if (removeSelf)
        {
            fs.rmdirSync(dirPath);
        }
    },

     URLData : function(URL) 
    {
        const request = require('request');
        const cheerio = require('cheerio');

        request(URL, function (err, res, body) {
                if(err)
                {
                    console.log(err);
                }
                else
                {
                        
                    const arr = [];
                    let $ = cheerio.load(body);
                    console.dir($);
   
                    $('div._1HmYoV > div.col-10-12>div.bhgxx2>div._3O0U0u').each(function(index){
                          
                        const data = $(this).find('div._1UoZlX>a').attr('href');
                        const name = $(this).find('div._1-2Iqu>div.col-7-12>div._3wU53n').text();
                        const obj = {
                            data : data,
                            name : name
                        };
                        console.log(obj);
                        arr.push(JSON.stringify(obj));
                    });
                    console.log(arr.toString());
                    fs.writeFile('data.txt', arr, function (err) {
                        if(err) {
                            console.log(err);
                        }
                            else{
                                console.log("success");
                            }
                    });
              
                }
            });
                                
    }
};