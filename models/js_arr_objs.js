/*
arr_from_obj(obj) return arrObj with obj

add_obj_to_arr(myArray, new_obj) return sorted arrObj + newobj

arrObj_dupKey(myArray, obj, key) return 1 if dup key else 0

updateByKey(myArray,key,value,obj) return array if find o.key == value > update value

_updateObjByObj(srcObj, targetObj) return resObj target val receive src val if same keys

updateObjByObj(srcObj, targetObj)return resObj target val receive src val if same keys

readAll(myArray) console.log(Object.entries(myArray[each item])

readByKey(myArray,key,value) retrun return myArray[objIndex] if findindex if o.key == value

removeByKey(myArray,key,value) return myArray after remove Obj index if o.key == value

sortByKey(myArray, key) retur sorted myArray by given key

filterObjects(array, { keys, values }) return resArray 
    example : 
    const arr = [
    { a: 34, b: 2 },
    { b: 1 },
    { c: 34 },
    { a: 'c', d: 45 }
]

const filteredByValue = objarr.filterObjects(arr, { values: [45] }) 
// [ { a: 'c', d: 45 } ]
const filteredByKey = objarr.filterObjects(arr, { keys: ['a'] }) 
// [ { a: 34, b: 2 }, { a: 'c', d: 45 } ]
const filteredByKeyAndValue = objarr.filterObjects(arr, { keys: ['a'], values: [34] }) 
// [ { a: 34, b: 2 } ]

getObjValueByKey(array, key) 

    example:
    const arr = [
    {name:'Anna',age: 20},
    {name:'Jim',age: 60},
    {name:'Daniel'},
    {name:'Anait',age: 16},
    {name:'Diana',age: 30},
]

const namesArray = objarr.getObjValueByKey(arr, 'name') 
// [ 'Anna', 'Jim', 'Daniel', 'Anait', 'Diana' ]
const agesArray = objarr.getObjValueByKey(arr, 'age') 
// [ 20, 60, 16, 30 ]
};
 
removeMatches(array)

    example
    const arr = [
    { a: null, helloStr: 'hello world' },
    {},
    { a: 34 },
    {},
    { a: null, helloStr: 'hello world' },
    { a: 34 }
]

const uniqueArray = objarr.removeMatches(arr) 
// [ { a: null, helloStr: 'hello world' }, {}, { a: 34 } ]

sortedByKey(array, key, sortMode = 0)
const sortedByName = objarr.sortedByKey(arr,'name')
// [
//     { name: 'Anait', age: 16 },
//     { name: 'Anna', age: 20 }, 
//     { name: 'Daniel' },        
//     { name: 'Diana', age: 30 },
//     { name: 'Jim', age: 60 }
// ]
const sortAscending = objarr.sortedByKey(arr,'age',1)

// [
//     { name: 'Anait', age: 16 },
//     { name: 'Anna', age: 20 },
//     { name: 'Diana', age: 30 },
//     { name: 'Jim', age: 60 }
// ]

const sortDescending = objarr.sortedByKey(arr,'age',-1)

// [
//     { name: 'Jim', age: 60 },
//     { name: 'Diana', age: 30 },
//     { name: 'Anna', age: 20 },
//     { name: 'Anait', age: 16 }
// ]

*/
module.exports = {
    ObjByObjArrObj:function(myArray,key,val,objSrc)
    {
      
        try 
        {
            myArray.forEach( function(elObj, index) {
                if (elObj[key] == val) 
                {
                    let ObjT = module.exports.updateObjByObj(objSrc,elObj);
                    myArray[index] = ObjT;
                    throw 'Break';
                }
                });
        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }
       
        return myArray ;

    },
    ArrHasObj:function(myArray,key,val)
    {
        if(myArray.some(o => o[key] == val))
        {
            return true;
        } 
        else
        {
            return false;
        }
    },
    arr_from_obj: function(obj) {
        let keyValues = Object.entries(obj); //convert object to keyValues ["key1", "value1"] ["key2", "value2"]

        //splice(index, how match i have to remove at index, array)
        keyValues.splice(0, 0, ["id", 1]); // insert key value at the index you want like 0.
        let newObj = Object.fromEntries(keyValues) // convert key values to obj {key1: "value1", newKey: "newValue", key2: "value2"}
        
        let tmp_arr = Array.from([newObj]);
        /*
        	obj = Object.assign({ id: 1 }, obj);
          	let tmp_arr = Array.from([obj]);
        	console.log(Array.isArray(tmp_arr));
    	*/
        return tmp_arr;
    },

    add_obj_to_arr: function(myArray, new_obj) 
    {
        var max_id = Math.max.apply(Math, myArray.map(function(obj) {
            return obj.id;
        }));
        //console.log("Finding max id: ", max_id);
        new_obj = Object.assign({
            id: max_id + 1
        }, new_obj);
        myArray.push(new_obj);
        myArray = module.exports.sortedByKey(myArray,"id",1);
        return myArray;
    },
    add_obj_to_arr_node: function(myArray, new_obj) 
    {
        var retResult = [];
        var max_id = Math.max.apply(Math, myArray.map(function(obj) {
            return obj.id;
        }));
        //console.log("Finding max id: ", max_id);
        new_obj = Object.assign({
            id: max_id + 1
        }, new_obj);
        myArray.push(new_obj);
        retResult["insertObj"] = new_obj;
        myArray = module.exports.sortedByKey(myArray,"id",1);
        retResult["records"] = myArray;
        return retResult;
    },
    arrObj_dupKey: function(myArray, obj, key)
    {
        const arrayOfObjCopy = [...myArray];    
        arrayOfObjCopy.push(obj);
        unique = [...new Set(arrayOfObjCopy.map(o => o[key]))];
        if(unique.length ==  arrayOfObjCopy.length)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    },

    updateByKey:function(myArray,key,value,obj)
    {
    	//Find index of specific object using findIndex method.    
    	objIndex = myArray.findIndex((o => o[key] == value));
    	let obj_tmp = {};
    		obj_tmp[key] = value;
    	obj = Object.assign(obj_tmp, obj);
    	myArray[objIndex] = obj;

    	return myArray = module.exports.sortedByKey(myArray,"id",1);
    },

    updateObjByObjhas:function(srcObj, targetObj) {
      const resObj = {};
      Object.keys(targetObj)
            .forEach(k => resObj[k] = (srcObj.hasOwnProperty(k) ? srcObj[k] : targetObj[k]));
      return resObj;
    },

    updateObjByObj:function(srcObj, targetObj) {
      const resObj = {};
      Object.keys(targetObj)
            .forEach(k => resObj[k] = (srcObj[k] ?? targetObj[k]));
      return resObj;
    },

    readAll:function(myArray)
    {
    	myArray.forEach(function (arrayItem) {
    	//var x = arrayItem.prop1 + 2;
    	console.log(Object.entries(arrayItem))
    	//console.log(arrayItem);
		});

    },

    readByKey:function(myArray,key,val)
    {
        var resObj = {};
    	try 
        {
            myArray.forEach( function(elObj, index) {

                if (elObj[key] == val) 
                {
                    resObj = elObj;
                    throw 'Break';
                }
                });
        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }
       return resObj;
    },

    removeByKey:function(myArray,key,value)
    {
        try 
        {
            myArray.forEach( function(elObj, index) 
            {
                if (elObj[key] == value) 
                {
                    myArray.splice(index, 1);
                    throw 'Break';
                }
            });
        } 
        catch (e) 
        {
            if (e !== 'Break') throw e;
        }
       
        return myArray ;
    },

    sortByKey:function(myArray, key) {
        myArray.sort(function(a, b) {
            var keyA = a[key],
                keyB = b[key];
            // Compare the 2 keys
            if (keyA < keyB) return -1;
            if (keyA > keyB) return 1;
            return 0;
        });
        return myArray;
    },

    filterObjects:function(array, { keys, values }) {
        const resArray = []
        if (!keys) {
            array.forEach((item) => {
                Object.keys(item).forEach((key) => {
                    values.forEach(value => {
                        if (item[key] === value) {
                            resArray.push(item)
                        }
                    });
                })
            })
            return resArray
        }

        array.forEach((item, i) => {
            keys.forEach(key => {
                if (item[key]) {
                    if (!values) {
                        return resArray.push(item)
                    }

                    values.forEach(value => {
                        if (item[key] === value) {
                            return resArray.push(item)
                        }
                    })
                }
            });
        })

        return resArray
    },

    getObjValueByKey:function(array, key) {
        const resArray = []

        array.forEach((item) => {
            Object.keys(item).forEach((itemKey) => {
                if (itemKey === key) {
                    resArray.push(item[itemKey])
                }
            })
        })

        return resArray
    },

    removeMatches:function(array) {
        const res = [...new Set(array.map(JSON.stringify))].map(JSON.parse);
        return res;
    },

    sortedByKey:function(array, key, sortMode = 0) {
        if (sortMode !== 0 && sortMode !== 1 && sortMode !== -1) {
            throw new Error('sortMode can only take values: 0, 1, -1')
        }

        const res = []

        array.forEach(item => {
            if (item[key]) {
                res.push(item)
            }
        });

        if (sortMode === 0) {
            res.sort(function (a, b) {
                if (a[key] > b[key]) {
                    return 1;
                }

                if (a[key] < b[key]) {
                    return -1;
                }

                return 0;
            })
        } else if (sortMode === 1) {
            res.sort((a, b) => a[key] - b[key])
        } else if (sortMode === -1) {
            res.sort((a, b) => b[key] - a[key])
        }

        return res
    }
};