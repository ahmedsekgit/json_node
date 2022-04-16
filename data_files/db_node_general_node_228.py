==============================
 Getting the differences between two objects javascript lib  
==============================
import { transform, isEqual, isObject } from 'lodash';  /**  * Deep diff between two object, using lodash  * @param  {Object} object Object compared  * @param  {Object} base   Object to compare with  * @return {Object}        Return a new object who represent the diff  */ function difference(object, base) { 	return transform(object, (result, value, key) => { 		if (!isEqual(value, base[key])) { 			result[key] = isObject(value) && isObject(base[key]) ? difference(value, base[key]) : value; 		} 	}); }
  
==============================
228 at  2021-10-29T15:22:52.000Z
==============================
