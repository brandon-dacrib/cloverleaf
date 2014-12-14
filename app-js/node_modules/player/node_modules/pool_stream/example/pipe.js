var fs = require('fs');
var path = require('path');
var PoolStream = require('../');

var writable = fs.createWriteStream(path.join(__dirname, 'a.mp3'));
writable.on('finish', function () {
  var readable = fs.createReadStream(path.join(__dirname, 'a.mp3'));
  var pool = new PoolStream();
  var writable = fs.createWriteStream(path.join(__dirname, 'b.mp3'));

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
});
for (var i = 0; i < 10240; i++) {
  writable.write(new Buffer(1024 * 1024));
}
writable.end();
