==============================
best talk about sql ever after   
==============================
You can do this. You just need to count how many of the keywords are matched and sort your table by that count.

Matching one of the keywords like this: (keywords LIKE '%wheels%') will return a boolean, represented in MySQL by 1 (true) or 0 (false). So just add together all of your keyword matches like this:

(keywords LIKE '%wheels%') + (keywords LIKE '%pedals') + (keywords LIKE '%chain%')

And then sort by that sum. If you sort in descending order and select the first row, it should be the best match.

SELECT mydb.*, 
    ((keywords LIKE '%wheels%') + 
    (keywords LIKE '%pedals') + 
    (keywords LIKE '%chain%')) AS best_match
FROM mydb
ORDER BY best_match DESC
LIMIT 1;

  
==============================
4 at  2021-10-29T15:22:52.000Z
==============================
