/* global describe it */
const assert = require('assert');
const FlyJsonQL = require('../src/flyjsonql');

describe('query test', function () {
  const data1 = [
    { user_id: 1, name: 'budi', age: 10 },
    { user_id: 5, name: 'wawan', age: 20 },
    { user_id: 3, name: 'tono', age: 30 }
  ];

  const data2 = [
    { id: 1, address: 'bandung', email: 'a@b.com' },
    { id: 2, address: 'jakarta', email: 'c@d.com' },
    { id: 3, address: 'solo', email: 'e@f.com' },
    { id: 4, address: 'solo, balapan', email: 'g@h.com' },
    { id: 5, address: 'surabaya', email: 'i@j.com' }
  ];

  const data3 = [
    { id: 1, bio: 'I was born in bandung', phone: 'a@b.com' },
    { id: 2, bio: 'I was born in jakarta', phone: 'c@d.com' },
    { id: 3, bio: 'I was born in solo', phone: 'e@f.com' },
    { id: 4, bio: 'I was born in semarang', phone: 'g@h.com' },
    { id: 5, bio: 'I was born in surabaya', phone: 'i@j.com' }
  ];

  const data4 = [
    { id: 1, about: 'I come from bandung' },
    { id: 2, about: 'I come from jakarta' },
    { id: 3, about: 'I come from solo' },
    { id: 4, about: 'I come from semarang' },
    { id: 5, about: 'I come from surabaya' }
  ];

  const data5 = [
    { brand: 'Audi', color: 'black', stock: 32 },
    { brand: 'Audi', color: 'white', stock: 76 },
    { brand: 'Ferarri', color: 'red', stock: 8 },
    { brand: 'Ford', color: 'white', stock: 49 },
    { brand: 'Peugot', color: 'white', stock: 23 }
  ];

  const data6 = [
    { id: 1, name: 'AAA', created: '2019-10-01 00:02:33' },
    { id: 1, name: 'AAA', created: '2019-10-01 00:02:33' },
    { id: 1, name: 'BBB', created: '2019-10-01 00:02:33' },
    { id: 4, name: 'DDD', created: '2019-10-04 03:32:13' },
    { id: 4, name: 'DDD', created: '2019-10-04 03:32:13' },
    { id: 7, name: 'GGG', created: '2019-10-07 06:02:03' },
    { id: 7, name: 'GGG', created: '2019-10-07 06:02:03' }
  ];

  it('get odm', function () {
    const jsonql = new FlyJsonQL();
    const result = jsonql.odm;
    assert.deepStrictEqual(result.data1, []);
    assert.deepStrictEqual(result.data2, []);
    assert.deepStrictEqual(result.query, []);
    assert.deepStrictEqual(result.result, []);
  });

  it('query must an array object', function () {
    const jsonql = new FlyJsonQL();
    const result = jsonql.query('abc');
    assert.deepStrictEqual(result.promiseStack, []);
    assert.deepStrictEqual(result.content, []);
    assert.deepStrictEqual(result.joined, []);
    assert.deepStrictEqual(result._odm.data1, []);
    assert.deepStrictEqual(result._odm.data2, []);
    assert.deepStrictEqual(result._odm.query, []);
    assert.deepStrictEqual(result._odm.result, []);
  });

  it('query must hasOwnProperty', function () {
    const jsonql = new FlyJsonQL();
    const q = [
      Object.create({ select: 'inherited' })
    ];
    const result = jsonql.query(q);
    assert.deepStrictEqual(result.promiseStack, []);
    assert.deepStrictEqual(result.content, []);
    assert.deepStrictEqual(result.joined, []);
    assert.deepStrictEqual(result._odm.data1, []);
    assert.deepStrictEqual(result._odm.data2, []);
    assert.deepStrictEqual(result._odm.query, []);
    assert.deepStrictEqual(result._odm.result, []);
  });

  it('query where', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          where: [
            ['name', '==', 'wawan']
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response[0].user_id, 5);
      done();
    });
  });

  it('query where on top promise', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          where: [
            ['name', '==', 'wawan']
          ]
        }
      }
    ];

    jsonql.query(q).promise().then(data => {
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response[0].user_id, 5);
      done();
    });
  });

  it('query where + and', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data2,
          where: [
            ['address', 'like', 'a'],
            ['address', 'like', 'ba']
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 3);
      assert.strictEqual(data[0].response[0].address, 'bandung');
      assert.strictEqual(data[0].response[1].address, 'solo, balapan');
      assert.strictEqual(data[0].response[2].address, 'surabaya');
      done();
    });
  });

  it('query between', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          between: [
            ['age', '20', '30']
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].user_id, 5);
      assert.strictEqual(data[0].response[1].user_id, 3);
      done();
    });
  });

  it('query search', function () {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data2,
          search: [
            ['address', 'solo']
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].id, 3);
      assert.strictEqual(data[0].response[1].id, 4);
    });
  });

  it('query regexp', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data2,
          regexp: [
            ['address', /balapan/]
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 1);
      assert.strictEqual(data[0].response[0].id, 4);
      done();
    });
  });

  it('query join', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          join: [
            {
              name: 'data2',
              from: data2,
              on: ['user_id', 'id']
            }
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 3);
      assert.strictEqual(data[0].response[0].data2.id, 1);
      assert.strictEqual(data[0].response[1].data2.id, 5);
      assert.strictEqual(data[0].response[2].data2.id, 3);
      done();
    });
  });

  it('query join nested', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          join: [
            {
              name: 'data2',
              from: data2,
              on: ['user_id', 'id'],
              join: [
                {
                  name: 'data3',
                  from: data3,
                  on: ['user_id', 'id'],
                  join: [
                    {
                      name: 'data4',
                      from: data4,
                      on: ['user_id', 'id']
                    }
                  ]
                }
              ]
            }
          ],
          nested: ['data2', 'data3', 'data4']
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 3);
      assert.strictEqual(data[0].response[0].data2.id, 1);
      assert.strictEqual(data[0].response[0].data2.data3.id, 1);
      assert.strictEqual(data[0].response[0].data2.data3.data4.id, 1);
      assert.strictEqual(data[0].response[1].data2.id, 5);
      assert.strictEqual(data[0].response[1].data2.data3.id, 5);
      assert.strictEqual(data[0].response[1].data2.data3.data4.id, 5);
      assert.strictEqual(data[0].response[2].data2.id, 3);
      assert.strictEqual(data[0].response[2].data2.data3.id, 3);
      assert.strictEqual(data[0].response[2].data2.data3.data4.id, 3);
      done();
    });
  });

  it('query join nested in another version', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          join: [
            {
              name: 'data2',
              from: data2,
              on: ['user_id', 'id']
            },
            {
              name: 'data3',
              from: data3,
              on: ['user_id', 'id']
            },
            {
              name: 'data4',
              from: data4,
              on: ['user_id', 'id']
            }
          ],
          nested: ['data2', 'data3', 'data4']
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 3);
      assert.strictEqual(data[0].response[0].data2.id, 1);
      assert.strictEqual(data[0].response[0].data2.data3.id, 1);
      assert.strictEqual(data[0].response[0].data2.data3.data4.id, 1);
      assert.strictEqual(data[0].response[1].data2.id, 5);
      assert.strictEqual(data[0].response[1].data2.data3.id, 5);
      assert.strictEqual(data[0].response[1].data2.data3.data4.id, 5);
      assert.strictEqual(data[0].response[2].data2.id, 3);
      assert.strictEqual(data[0].response[2].data2.data3.id, 3);
      assert.strictEqual(data[0].response[2].data2.data3.data4.id, 3);
      done();
    });
  });

  it('query where + or', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          or: [
            {
              where: [
                ['name', '==', 'wawan']
              ]
            },
            {
              where: [
                ['name', '==', 'budi']
              ]
            }
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].user_id, 5);
      done();
    });
  });

  it('query select + where + or', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['name', 'age'],
          from: data1,
          or: [
            {
              where: [
                ['name', '==', 'wawan']
              ]
            },
            {
              where: [
                ['name', '==', 'budi']
              ]
            }
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].name, 'wawan');
      assert.strictEqual(data[0].response[1].name, 'budi');
      done();
    });
  });

  it('query select + where + distinct', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['id', 'name', 'created'],
          from: data6,
          distinct: 'name'
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 4);
      assert.strictEqual(data[0].response[0].name, 'AAA');
      assert.strictEqual(data[0].response[1].name, 'BBB');
      done();
    });
  });

  it('query select + where + distinct all', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['id', 'name', 'created'],
          from: data6,
          distinct: ''
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 4);
      assert.strictEqual(data[0].response[0].name, 'AAA');
      assert.strictEqual(data[0].response[1].name, 'BBB');
      done();
    });
  });

  it('query select + where + or + orderby', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['name', 'age'],
          from: data1,
          or: [
            {
              where: [
                ['name', '==', 'wawan']
              ]
            },
            {
              where: [
                ['name', '==', 'budi']
              ]
            }
          ],
          orderby: ['name', false]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].name, 'budi');
      assert.strictEqual(data[0].response[1].name, 'wawan');
      done();
    });
  });

  it('query select + where + or + orderby + skip', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['name', 'age'],
          from: data1,
          or: [
            {
              where: [
                ['name', '==', 'wawan']
              ]
            },
            {
              where: [
                ['name', '==', 'budi']
              ]
            }
          ],
          orderby: ['name', false],
          skip: 1
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 1);
      assert.strictEqual(data[0].response[0].name, 'wawan');
      done();
    });
  });

  it('query select + where + orderby + skip + take', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['name', 'age'],
          from: data1,
          orderby: ['name', false],
          skip: 1,
          take: 2
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].name, 'tono');
      assert.strictEqual(data[0].response[1].name, 'wawan');
      done();
    });
  });

  it('query select + orderby + paginate', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          fields: ['name', 'age'],
          from: data1,
          orderby: ['name', false],
          paginate: [1, 2]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 2);
      assert.strictEqual(data[0].response[0].name, 'budi');
      assert.strictEqual(data[0].response[1].name, 'tono');
      done();
    });
  });

  it('query groupby + orderby', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data5,
          groupby: ['brand'],
          orderby: ['brand', false]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 4);
      assert.strictEqual(data[0].response[0].brand, 'Audi');
      assert.strictEqual(data[0].response[1].brand, 'Ferarri');
      assert.strictEqual(data[0].response[2].brand, 'Ford');
      assert.strictEqual(data[0].response[3].brand, 'Peugot');
      done();
    });
  });

  it('query groupby + sum[stock] + orderby', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data5,
          groupby: ['brand', ['stock']],
          orderby: ['brand', false]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 4);
      assert.strictEqual(data[0].response[0].brand, 'Audi');
      assert.strictEqual(data[0].response[0].average_stock, 54);
      assert.strictEqual(data[0].response[1].brand, 'Ferarri');
      assert.strictEqual(data[0].response[1].average_stock, 8);
      assert.strictEqual(data[0].response[2].brand, 'Ford');
      assert.strictEqual(data[0].response[2].average_stock, 49);
      assert.strictEqual(data[0].response[3].brand, 'Peugot');
      assert.strictEqual(data[0].response[3].average_stock, 23);
      done();
    });
  });

  it('query groupdetail', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data5,
          groupdetail: ['brand']
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 1);
      assert.strictEqual(data[0].response[0].brand.Audi.length, 2);
      assert.strictEqual(data[0].response[0].brand.Ferarri.length, 1);
      assert.strictEqual(data[0].response[0].brand.Ford.length, 1);
      assert.strictEqual(data[0].response[0].brand.Peugot.length, 1);
      done();
    });
  });

  it('query merge', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          merge: [
            {
              name: 'data2',
              from: data2,
              on: ['user_id', 'id']
            }
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 3);
      assert.strictEqual(data[0].response[0].user_id, 1);
      assert.strictEqual(data[0].response[0].id, 1);
      assert.strictEqual(data[0].response[1].user_id, 5);
      assert.strictEqual(data[0].response[1].id, 5);
      assert.strictEqual(data[0].response[2].user_id, 3);
      assert.strictEqual(data[0].response[2].id, 3);
      done();
    });
  });

  it('query merge nested', function (done) {
    const jsonql = new FlyJsonQL();

    const q = [
      {
        select: {
          from: data1,
          merge: [
            {
              name: 'data2',
              from: data2,
              on: ['user_id', 'id'],
              merge: [
                {
                  name: 'data3',
                  from: data3,
                  on: ['user_id', 'id'],
                  merge: [
                    {
                      name: 'data4',
                      from: data4,
                      on: ['user_id', 'id']
                    }
                  ]
                }
              ]
            }
          ]
        }
      }
    ];

    jsonql.query(q).exec(function (err, data) {
      if (err) console.log(err);
      assert.strictEqual(data[0].status, true);
      assert.strictEqual(data[0].response.length, 3);
      assert.strictEqual(data[0].response[0].user_id, 1);
      assert.strictEqual(data[0].response[0].id, 1);
      assert.strictEqual(data[0].response[0].name, 'budi');
      assert.strictEqual(data[0].response[0].address, 'bandung');
      assert.strictEqual(data[0].response[0].bio, 'I was born in bandung');
      assert.strictEqual(data[0].response[0].about, 'I come from bandung');
      assert.strictEqual(data[0].response[1].user_id, 5);
      assert.strictEqual(data[0].response[1].id, 5);
      assert.strictEqual(data[0].response[1].name, 'wawan');
      assert.strictEqual(data[0].response[1].address, 'surabaya');
      assert.strictEqual(data[0].response[1].bio, 'I was born in surabaya');
      assert.strictEqual(data[0].response[1].about, 'I come from surabaya');
      assert.strictEqual(data[0].response[2].user_id, 3);
      assert.strictEqual(data[0].response[2].id, 3);
      assert.strictEqual(data[0].response[2].name, 'tono');
      assert.strictEqual(data[0].response[2].address, 'solo');
      assert.strictEqual(data[0].response[2].bio, 'I was born in solo');
      assert.strictEqual(data[0].response[2].about, 'I come from solo');
      done();
    });
  });
});
