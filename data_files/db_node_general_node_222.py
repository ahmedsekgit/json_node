==============================
 For-each over an array in JavaScript  
==============================
/** 1. Use forEach and related */ var a = ["a", "b", "c"]; a.forEach(function(entry) {     console.log(entry); });  /** 2. Use a simple for loop */ var index; var a = ["a", "b", "c"]; for (index = 0; index < a.length; ++index) {     console.log(a[index]); }  /**3. Use for-in correctly*/ // `a` is a sparse array var key; var a = []; a[0] = "a"; a[10] = "b"; a[10000] = "c"; for (key in a) {     if (a.hasOwnProperty(key)  &&        // These checks are         /^0$|^[1-9]\d*$/.test(key) &&    // explained         key <= 4294967294                // below         ) {         console.log(a[key]);     } }  /** 4. Use for-of (use an iterator implicitly) (ES2015+) */ const a = ["a", "b", "c"]; for (const val of a) {     console.log(val); }  /** 5. Use an iterator explicitly (ES2015+) */ const a = ["a", "b", "c"]; const it = a.values(); let entry; while (!(entry = it.next()).done) {     console.log(entry.value); } 
listName.forEach((listItem) => {   Logger.log(listItem); }):
  
==============================
222 at  2021-10-29T15:22:52.000Z
==============================
