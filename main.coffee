{Socket} = require 'net'

module.exports = (host, port) =>
	new Promise (resolve, reject) =>
		socket = new Socket

		socket.on 'connect', =>
			resolve 'open'
			socket.destroy()

		socket.on 'timeout', =>
			reject 'timeout'
			socket.destroy()

		socket.on 'error', (error) =>
			switch error.code
				when 'ECONNREFUSED'
					reject 'closed'
				when 'ENOTFOUND'
					reject 'not found'
				when 'EHOSTUNREACH', 'ENETUNREACH'
					reject 'unreachable'
				else
					reject error

		socket.on 'close', (errorOccurred) =>
			reject 'closed' if errorOccurred

		socket.setTimeout(3000)
		socket.connect port, host
