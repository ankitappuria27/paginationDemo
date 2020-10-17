
require('./server/server.js').init();


process.on('uncaughtException', (err) => {
  // Very Bad, Very very Bad. If this piece of code is being executed, then please go ahead and check your code
  // Do proper exception handling in your code.
  console.log(`Caught exception in process level: \n${err}`);
  if (err && err.code === 'EADDRINUSE') {
    process.exit(1);
  }
});