var should = require('should');

var Pool = require('../lib/pool');

describe('constructor', function () {
  it('new Pool()', function () {
    var pool = new Pool();
    pool.should.be.an.instanceof(Pool);
  });

  it('Pool()', function () {
    var pool = Pool();
    pool.should.be.an.instanceof(Pool);
  });
});

describe('pipe', function () {
  it('pipe', function () {
    var pool = new Pool();
    var dist = new Pool();
    pool.dists.should.have.length(0);
    pool.pipe(dist).should.be.equal(dist);
    pool.dists.should.have.length(1);
  });
});

describe('write', function () {
  it('write', function () {
    var pool = new Pool();
    pool.buffers.should.have.length(0);
    pool.write(new Buffer('hello world!'));
    pool.buffers.should.have.length(1);
    pool.end(new Buffer('pool'));
    pool.buffers.should.have.length(2);
  });

  it('write with pipe', function () {
    var pool = new Pool();
    var dist = new Pool();
    pool.pipe(dist);
    pool.buffers.should.have.length(0);
    dist.buffers.should.have.length(0);
    pool.write(new Buffer('hello world!\n'));
    pool.buffers.should.have.length(1);
    dist.buffers.should.have.length(0);
    pool.end(new Buffer('pool'));
    pool.buffers.should.have.length(0);
    dist.buffers.should.have.length(2);
  });
});



