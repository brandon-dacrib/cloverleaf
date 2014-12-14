Pool Stream
============
It's like a pool. Upstream can fast pipe into it, and don't depend on the downstream.

## Installation

```bash
$ npm install pool_stream
```

## Usage
You can pipe it like other streams.

```js
var PoolStream = require('pool_stream');

var readable = fs.createReadStream('a_file');
var pool = new PoolStream();
var writable = fs.createWriteStream('b_file');

readable.pipe(pool).pipe(writable);

// following events will tell you why need pool.
readable.on('end', function () {
  console.log('readable end time is: %s', new Date());
});
pool.on('end', function () {
  console.log('pool end time is: %s', new Date());
});
pool.on('finish', function () {
  console.log('pool finish time is: %s', new Date());
});
writable.on('finish', function () {
  console.log('writable finish time is: %s', new Date());
});
```

## License
The MIT license.
