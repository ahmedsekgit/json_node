==============================
 Bot say command discord.js  
==============================
client.on('message', message => {     if (message.content.startsWith(prefix + 'say')) {         if (message.author.bot) return;         const SayMessage = message.content.slice(6).trim();         message.channel.send(SayMessage)         message.channel.send("Text By " + ` **${message.author}**`)     } });
if (command === 'say') { 	let text = args.join(' '); 	message.delete(); 	message.channel.send(text); }
  
==============================
163 at  2021-10-29T15:22:52.000Z
==============================
