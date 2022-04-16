==============================
 How to Communicate With the Serial Port in Node.js  
==============================
/*     This code comes from Vincent Lab     And it has a video version linked here: https://www.youtube.com/watch?v=__FSpGHx9Ow */  // Import dependencies const SerialPort = require("serialport"); const Readline = require("@serialport/parser-readline");  // Defining the serial port const port = new SerialPort("COM3", {     baudRate: 9600, });  // The Serial port parser const parser = new Readline(); port.pipe(parser);  // Read the data from the serial port parser.on("data", (line) => console.log(line));  // Write the data to the serial port port.write("ROBOT POWER ON"); port.write("ROBOT POWER ON");
  
==============================
236 at  2021-10-29T15:22:52.000Z
==============================
