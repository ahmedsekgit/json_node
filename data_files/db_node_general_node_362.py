==============================
                      json2csv    
==============================

                    
1

You have to set parametrs in the res headers.

You can try for the following:

var fields = ['firstName', 'email'];
                var csv = json2csv({ data: resp, fields: fields });
                res.set('Cache-Control', 'max-age=0, no-cache, must-revalidate, proxy-revalidate');
                res.set('Content-Type','application/force-download');
                res.set('Content-Type','application/octet-stream');
                res.set('Content-Type','application/download');
                res.set('Content-Disposition','attachment;filename=userList.csv');
                res.set('Content-Transfer-Encoding','binary');
                res.send(csv); 

SO when you hit the API in browser, it will ask for SaveFile option and if user clicks OK it will be downloaded to default Download directory of chrome.
  
==============================
362 at  2021-10-29T21:33:33.000Z
==============================
