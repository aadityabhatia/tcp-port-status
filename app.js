#!/usr/bin/env node
path = require('path');
main = require(path.join(__dirname, 'main'));
main(process.argv[2], process.argv[3]).then(console.log)
