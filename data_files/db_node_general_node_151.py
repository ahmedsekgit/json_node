==============================
 1d convolution javascript  
==============================
function convolve(array, weights) {   if (weights.length % 2 !== 1)     throw new Error('weights array must have an odd length');    var al = array.length;   var wl = weights.length;   var offset = ~~(wl / 2);   var output = new Array(al);    for (var i = 0; i < al; i++) {     var kmin = (i >= offset) ? 0 : offset - i;     var kmax = (i + offset < al) ? wl - 1 : al - 1 - i + offset;      output[i] = 0;     for (var k = kmin; k <= kmax; k++)       output[i] += array[i - offset + k] * weights[k];   }    return output; }
  
==============================
151 at  2021-10-29T15:22:52.000Z
==============================
