==============================
 How To Unzip Files in Node.js  
==============================
/*     This code comes from Vincent Lab     And it has a video version linked here: https://www.youtube.com/watch?v=fFhB2PYVDzQ */  // Import dependencies const decompress = require("decompress"); const path = require("path");  (async () => {      try {         const files = await decompress("unicorn.zip", "dist", {             filter: file => path.extname(file.path) !== ".exe"         });         console.log(files);     } catch (error) {         console.log(error);     }  })();  // decompress("unicorn.zip", "dist").then(files => { //     console.log("done!"); // });   // // Filter out files before extracting // try { //     const files = await decompress("unicorn.zip", "dist", { //         filter: file => path.extname(file.path) !== ".exe" //     }); //     console.log("done!"); // } catch (error) { //     console.log(error); // }   // // Map files before extracting // try { //     const files = await decompress("unicorn.zip", "dist", { //         map: file => { //             file.path = `unicorn-${file.path}`; //             return file; //         } //     }); //     console.log("done!"); // } catch (error) { //     console.log(error); // }
  
==============================
231 at  2021-10-29T15:22:52.000Z
==============================
