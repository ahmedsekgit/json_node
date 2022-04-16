==============================
 JavaScript how do you create a screen button in 10 lines?  
==============================
const stream = await navigator. mediaDevices. getDisplayMedia({ video: { mediaSource: "screen" } }); const recorder = new MediaRecorder(stream); const chunks = []; recorder. ondataavailable = e => chunks. push(e. ... recorder. onstop = e => { const completeBlob = new Blob(chunks, { type: chunks[0]. type }); video.
how do you create a button in the shortest way possible? 
  
==============================
272 at  2021-10-29T15:22:52.000Z
==============================
