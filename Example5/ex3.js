const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');


const url1 = "https://www.iban.com/exchange-rates";
const url2 = `https://www.codegrepper.com/code-examples/javascript/frameworks/express`;

fetchData(url1).then((res) => {
    const html = res.data;
    const $ = cheerio.load(html);
    const statsTable = $('.table.table-bordered.table-hover.downloads > tbody > tr');
    statsTable.each(function() {
        let title = $(this).find('td').text();
        console.log(title);
    });
})

fetchData(url2).then((res) => {
    var obselete = [];
    const html = res.data;
    const $ = cheerio.load(html);
    try {
        let urls = $("a");
        Object.keys(urls).forEach((item) => {

            if (urls[item].type === 'tag') {
                let href = urls[item].attribs.href;

                if (href && !obselete.includes(href)) {
                    href = href.trim();
                    obselete.push(href);

                    // Slow down the
                    /*
                    setTimeout(function() {
                        href.startsWith('http') ? crawlAllUrls(href) : crawlAllUrls(`${url}${href}`) // The latter might need extra code to test if its the same site and it is a full domain with no URI
                    }, 5000)
                    */
                }
            }
        });
        for (var i = 0; i < obselete.length; i++) 
        {
            var index_js = obselete[i].indexOf('express');
            var index_tryit = obselete[i].indexOf('tryit');
            
            if (index_js !== -1) {
                console.log('obselete[%d]', i);
                console.dir(obselete[i]);
                fs.appendFileSync('node_express.txt', obselete[i] + '\n');
            }
            if (index_tryit !== -1) {
                console.log('obselete[%d]', i);
                console.dir(obselete[i]);
                fs.appendFileSync('php_tryit_w3_links.txt', obselete[i] + '\n');
            }

        }

    } catch (e) {
        console.error(`Encountered an error crawling ${url2}. Aborting crawl.`);
    }
    return obselete;
})



async function fetchData(url) {
    console.log("Crawling data...")
    // make http call to url
    let response = await axios(url).catch((err) => console.log(err));

    if (response.status !== 200) {
        console.log("Error occurred while fetching data");
        return;
    }
    return response;
}