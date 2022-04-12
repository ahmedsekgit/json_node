/*!
 * FlyJsonQL ES6 v1.2.1 [NodeJS & Browser]
 * https://github.com/aalfiann/fly-json-ql
 *
 * Copyright 2021 M ABD AZIZ ALFIAN
 * Released under the MIT license
 * https://github.com/aalfiann/fly-json-ql/blob/master/LICENSE
 */
'use strict';

const FlyJsonOdm = require('fly-json-odm');

class FlyJsonQL {
  constructor () {
    // Promise Stackholder
    this.promiseStack = [];
    // Result from database
    this.content = [];
    // flyjsonodm
    this._odm = new FlyJsonOdm();
    // joined stack
    this.joined = [];
  }

  /**
     * Get json odm
     * @return {_odm}
     */
  get odm () {
    return this._odm;
  }

  /**
     * Cleanup data in stackholder
     */
  clean () {
    this.content = [];
    this.promiseStack = [];
  }

  /**
     * Query between function
     * @param {_odm} parent
     * @param {string} name
     * @param {string|integer} valueA
     * @param {string|integer} valueB
     */
  _funcBetween (parent, name, valueA, valueB) {
    parent.where(name, '>=', valueA).where(name, '<=', valueB);
  }

  /**
     * Query search function
     * @param {_odm} parent
     * @param {string} name
     * @param {string|integer} value
     */
  _funcSearch (parent, name, value) {
    parent.where(name, 'like', value, false);
  }

  /**
     * Query RegExp function
     * @param {_odm} parent
     * @param {string} name
     * @param {string|integer} value
     */
  _funcRegExp (parent, name, value) {
    parent.where(name, 'regex', value);
  }

  /**
     * builder.where
     * @param {_odm} parent
     * @param {array} where
     */
  _builderWhere (parent, where) {
    if (!this._odm.isEmpty(where) && this._odm.isArray(where) && !this._odm.isEmptyArray(where)) {
      for (let i = 0; i < where.length; i++) {
        parent.where(...where[i]);
      }
    }
  }

  /**
     * builder.between
     * @param {_odm} parent
     * @param {array} between
     */
  _builderBetween (parent, between) {
    if (!this._odm.isEmpty(between) && this._odm.isArray(between) && !this._odm.isEmptyArray(between)) {
      for (let i = 0; i < between.length; i++) {
        this._funcBetween(parent, ...between[i]);
      }
    }
  }

  /**
     * builder.search
     * @param {_odm} parent
     * @param {array} search
     */
  _builderSearch (parent, search) {
    if (!this._odm.isEmpty(search) && this._odm.isArray(search) && !this._odm.isEmptyArray(search)) {
      for (let i = 0; i < search.length; i++) {
        this._funcSearch(parent, ...search[i]);
      }
    }
  }

  /**
     * builder.regexp
     * @param {_odm} parent
     * @param {array} regexp
     */
  _builderRegExp (parent, regexp) {
    if (!this._odm.isEmpty(regexp) && this._odm.isArray(regexp) && !this._odm.isEmptyArray(regexp)) {
      for (let i = 0; i < regexp.length; i++) {
        this._funcRegExp(parent, ...regexp[i]);
      }
    }
  }

  /**
     * builder.or
     * @param {_odm} parent
     * @param {object} or
     */
  _builderOr (parent, or) {
    if (!this._odm.isEmpty(or) && this._odm.isArray(or) && !this._odm.isEmptyArray(or)) {
      parent.begin();
      for (let i = 0; i < or.length; i++) {
        this._builderBetween(parent, or[i].between);
        this._builderWhere(parent, or[i].where);
        this._builderSearch(parent, or[i].search);
        this._builderRegExp(parent, or[i].regexp);
        if (i !== (or.length - 1)) parent.or();
      }
      parent.end();
    }
  }

  /**
     * builder item list for map transform
     * @param {array} table
     * @return {object}
     */
  _builderItemList (table) {
    const keys = Object.keys(table[0]);
    const result = {};
    for (let i = 0; i < keys.length; i++) {
      Object.assign(result, { [keys[i]]: keys[i].toString() });
    }
    return result;
  }

  /**
     * builder.nested
     * @param {array} table
     * @param {array} nested
     * @return {array}
     */
  _builderNested (table, nested) {
    const removed = [...nested];
    removed.shift();

    const data = {
      posts: table
    };

    const map = {
      list: 'posts',
      item: this._builderItemList(table),
      each: function (item) {
        let up = null;
        for (let x = 1; x < nested.length; x++) {
          if (up) {
            up[nested[x]] = item[nested[x]];
            up = up[nested[x]];
          } else {
            item[nested[0]][nested[x]] = item[nested[x]];
            up = item[nested[0]][nested[x]];
          }
        }
        return item;
      },
      defaults: {
        missingData: true
      },
      remove: removed
    };
    return this._odm.jsonTransform(data, map).make();
  }

  /**
     * builder.fields
     * @param {_odm} parent
     * @param {array} fields
     */
  _setFields (parent, fields) {
    if (!this._odm.isEmpty(fields) && this._odm.isArray(fields) && !this._odm.isEmptyArray(fields)) {
      parent.select(fields);
    }
  }

  /**
     * builder.groupby
     * @param {_odm} parent
     * @param {array} groupby
     */
  _setGroupBy (parent, groupby) {
    if (!this._odm.isEmpty(groupby) && this._odm.isArray(groupby) && !this._odm.isEmptyArray(groupby)) {
      parent.groupBy(...groupby);
    }
  }

  /**
     * builder.groupdetail
     * @param {_odm} parent
     * @param {array} groupdetail
     */
  _setGroupDetail (parent, groupdetail) {
    if (!this._odm.isEmpty(groupdetail) && this._odm.isArray(groupdetail) && !this._odm.isEmptyArray(groupdetail)) {
      parent.groupDetail(...groupdetail);
    }
  }

  /**
     * builder.orderby
     * @param {_odm} parent
     * @param {array} orderby
     */
  _setOrderBy (parent, orderby) {
    if (!this._odm.isEmpty(orderby) && this._odm.isArray(orderby) && !this._odm.isEmptyArray(orderby)) {
      parent.orderBy(...orderby);
    }
  }

  /**
     * builder.skip
     * @param {_odm} parent
     * @param {string|integer} skip
     */
  _setSkip (parent, skip) {
    if (!this._odm.isEmpty(skip) && (this._odm.isString(skip) || this._odm.isInteger(skip))) {
      parent.skip(skip);
    }
  }

  /**
     * builder.take
     * @param {_odm} parent
     * @param {string|integer} take
     */
  _setTake (parent, take) {
    if (!this._odm.isEmpty(take) && (this._odm.isString(take) || this._odm.isInteger(take))) {
      parent.take(take);
    }
  }

  /**
     * builder.distinct
     * @param {_odm} parent
     * @param {string} distinct
     */
  _setDistinct (parent, distinct) {
    if (this._odm.isEmpty(distinct) || this._odm.isString(distinct)) {
      parent.distinct(distinct);
    }
  }

  /**
     * builder.paginate
     * @param {_odm} parent
     * @param {array} paginate
     */
  _setPaginate (parent, paginate) {
    if (!this._odm.isEmpty(paginate) && this._odm.isArray(paginate) && !this._odm.isEmptyArray(paginate)) {
      parent.paginate(...paginate);
    }
  }

  /**
     * Merge Builder
     * @param {string} scope
     * @param {_odm} parent
     * @param {object} obj
     */
  _mergeScope (scope, parent, obj) {
    if (!this._odm.isEmpty(obj) && this._odm.isArray(obj) && !this._odm.isEmptyArray(obj)) {
      const len = obj.length;
      const rejoin = [];
      for (let i = 0; i < len; i++) {
        // nested join
        if (obj[i].merge) {
          if (this.joined.length === 0) {
            this.joined.push(parent.join(obj[i].name, obj[i].from).merge(...obj[i].on).exec());
          } else {
            for (let x = 0; x < this.joined.length; x++) {
              rejoin.push(parent.set(this.joined[x]).join(obj[i].name, obj[i].from).merge(...obj[i].on).exec());
            }
          }
          this.joined = [...this.joined.concat(rejoin)];
          this._mergeScope('nested', parent, obj[i].merge);
        } else {
          if (this.joined.length > 0) {
            parent.set(this.joined[(this.joined.length - 1)]).join(obj[i].name, obj[i].from).merge(...obj[i].on);
            this.joined = [];
          } else {
            parent.join(obj[i].name, obj[i].from).merge(...obj[i].on);
          }
          this._selectScope(scope, parent, obj[i]);
        }
      }
    }
  }

  /**
     * Join Builder
     * @param {string} scope
     * @param {_odm} parent
     * @param {object} obj
     */
  _joinScope (scope, parent, obj) {
    if (!this._odm.isEmpty(obj) && this._odm.isArray(obj) && !this._odm.isEmptyArray(obj)) {
      const len = obj.length;
      const rejoin = [];
      for (let i = 0; i < len; i++) {
        // nested join
        if (obj[i].join) {
          if (this.joined.length === 0) {
            this.joined.push(parent.join(obj[i].name, obj[i].from).on(...obj[i].on).exec());
          } else {
            for (let x = 0; x < this.joined.length; x++) {
              rejoin.push(parent.set(this.joined[x]).join(obj[i].name, obj[i].from).on(...obj[i].on).exec());
            }
          }
          this.joined = [...this.joined.concat(rejoin)];
          this._joinScope('nested', parent, obj[i].join);
        } else {
          if (this.joined.length > 0) {
            parent.set(this.joined[(this.joined.length - 1)]).join(obj[i].name, obj[i].from).on(...obj[i].on);
            this.joined = [];
          } else {
            parent.join(obj[i].name, obj[i].from).on(...obj[i].on);
          }
          this._selectScope(scope, parent, obj[i]);
        }
      }
    }
  }

  /**
     * Scope for Query Select
     * @param {string} scope
     * @param {DatabaseBuilder} parent
     * @param {object} obj
     */
  _selectScope (scope, parent, obj) {
    scope = scope.toLowerCase();
    this._builderBetween(parent, obj.between);
    this._builderWhere(parent, obj.where);
    this._builderSearch(parent, obj.search);
    this._builderRegExp(parent, obj.regexp);
    this._builderOr(parent, obj.or);
    this._setGroupDetail(parent, obj.groupdetail);
    this._setGroupBy(parent, obj.groupby);
    this._setOrderBy(parent, obj.orderby);
    this._setSkip(parent, obj.skip);
    this._setTake(parent, obj.take);
    this._setDistinct(parent, obj.distinct);
    this._setPaginate(parent, obj.paginate);
    this._setFields(parent, obj.fields);
  }

  /**
     * Query Builder for Select
     * @param {object} obj
     * @return {Promise}
     */
  _select (obj) {
    this.promiseStack.push(new Promise((resolve, reject) => {
      try {
        this._odm.promisify(builder => { return builder; }).then(table => {
          table.setMode('shallow').set(obj.from);
          this._selectScope('main', table, obj);
          // merge
          this._mergeScope('join', table, obj.merge);
          // join
          this._joinScope('join', table, obj.join);
          let result = this._odm.deepClone(table.exec());
          // join nested
          if (obj.join && obj.nested) {
            result = this._odm.deepClone(this._builderNested(result, obj.nested));
          }
          resolve(result);
        }).catch(error => {
          reject(error);
        });
      } catch (error) {
        reject(error);
      }
    }));
  }

  /**
     * Query Builder for Insert
     * @param {object} obj
     * @return {Promise}
     */
  _insert (obj) {
    this.promiseStack.push(new Promise((resolve, reject) => {
      this._odm.promisify(builder => { return builder; }).then(table => {
        resolve({
          data: table.set(obj.into).insertMany(obj.values).exec(),
          count: obj.values.length
        });
      }).catch(error => {
        reject(error);
      });
    }));
  }

  /**
     * Query Builder for Update
     * @param {object} obj
     * @return {Promise}
     */
  _update (obj) {
    this.promiseStack.push(new Promise((resolve, reject) => {
      this._odm.promisify(builder => { return builder; }).then(table => {
        table.set(obj.from);
        this._builderBetween(table, obj.between);
        this._builderWhere(table, obj.where);
        this._builderSearch(table, obj.search);
        this._builderRegExp(table, obj.regexp);
        this._builderOr(table, obj.or);
        const oldest = this._odm.deepClone(table.exec());
        const index = Object.keys(obj.set);
        const len = oldest.length;
        const indexlen = index.length;
        for (let i = 0; i < len; i++) {
          for (let x = 0; x < indexlen; x++) {
            oldest[i][index[x]] = obj.set[index[x]];
          }
        }
        resolve({
          data: table.set(obj.from).updateMany(obj.key, oldest).exec(),
          count: len
        });
      }).catch(error => {
        reject(error);
      });
    }));
  }

  /**
     * Query Builder for Modify
     * @param {object} obj
     * @return {Promise}
     */
  _modify (obj) {
    this.promiseStack.push(new Promise((resolve, reject) => {
      this._odm.promisify(builder => { return builder; }).then(table => {
        table.set(obj.from);
        this._builderBetween(table, obj.between);
        this._builderWhere(table, obj.where);
        this._builderSearch(table, obj.search);
        this._builderRegExp(table, obj.regexp);
        this._builderOr(table, obj.or);
        const oldest = this._odm.deepClone(table.exec());
        const index = Object.keys(obj.set);
        const len = oldest.length;
        const indexlen = index.length;
        for (let i = 0; i < len; i++) {
          for (let x = 0; x < indexlen; x++) {
            oldest[i][index[x]] = obj.set[index[x]];
          }
        }
        resolve({
          data: table.set(obj.from).modifyMany(obj.key, oldest).exec(),
          count: len
        });
      }).catch(error => {
        reject(error);
      });
    }));
  }

  /**
     * Query Builder for Delete
     * @param {object} obj
     * @return {Promise}
     */
  _delete (obj) {
    this.promiseStack.push(new Promise((resolve, reject) => {
      this._odm.promisify(builder => { return builder; }).then(table => {
        table.set(obj.from);
        this._builderBetween(table, obj.between);
        this._builderWhere(table, obj.where);
        this._builderSearch(table, obj.search);
        this._builderRegExp(table, obj.regexp);
        this._builderOr(table, obj.or);
        const oldest = this._odm.deepClone(table.select([obj.key]).exec());
        const data2delete = [];
        const len = oldest.length;
        for (let i = 0; i < len; i++) {
          data2delete.push(oldest[i][obj.key]);
        }
        resolve({
          data: table.set(obj.from).deleteMany(obj.key, data2delete).exec(),
          count: len
        });
      }).catch(error => {
        reject(error);
      });
    }));
  }

  /**
     * Set Query
     * @param {array} query
     * @return {FlyJsonQL}
     */
  query (query) {
    this.clean();
    if (this._odm.isArray(query)) {
      for (const key in query) {
        for (const k in query[key]) {
          if (Object.prototype.hasOwnProperty.call(query[key], k)) {
            switch (true) {
              case (k === 'insert'):
                this._insert(query[key].insert);
                break;
              case (k === 'update'):
                this._update(query[key].update);
                break;
              case (k === 'modify'):
                this._modify(query[key].modify);
                break;
              case (k === 'delete'):
                this._delete(query[key].delete);
                break;
              default:
                this._select(query[key].select);
            }
          }
        }
      }
    }
    return this;
  }

  /**
     * Execute Query Builder
     * @param {callback} callback   Callback(error,data)
     */
  exec (callback) {
    try {
      const toResultObject = (promise) => {
        return promise
          .then((response) => ({ status: true, response }))
          .catch(error => ({ status: false, error }));
      };
      Promise.all(this.promiseStack.map(toResultObject)).then(result => {
        const len = result.length;
        for (let i = 0; i < len; ++i) {
          this.content.push(result[i]);
        }
        const dataresult = [...this.content];
        callback(null, dataresult);
      });
    } catch (err) {
      callback(err);
    }
  }

  /**
     * Execute Query Builder on top Promise
     */
  promise () {
    return new Promise((resolve, reject) => {
      this.exec(function (err, data) {
        if (err) return reject(err);
        resolve(data);
      });
    });
  }
}

module.exports = FlyJsonQL;
