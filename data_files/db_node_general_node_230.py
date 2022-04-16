==============================
 Hide elements until Alpine Js loads  
==============================
//Add `x-cloak` to any element you wish to hide while alpine loads // It'll be removed when Alpine is loaded <div class="step2" x-show="condition" x-cloak >... // Also add the following to your css [x-cloak] {     display: none !important; } 
  
==============================
230 at  2021-10-29T15:22:52.000Z
==============================
