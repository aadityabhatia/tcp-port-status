# TCP Port Status
Checks the status of a TCP port

## Installation
```
npm install tcp-port-status
```

## Usage
```js
const portStatus = require("tcp-port-status");
portStatus('1.1.1.1', 80)
	.then(status => { console.log(status); })
	.catch(error => { console.error(error); });
```
