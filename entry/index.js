const http = require('http');
const fs = require('fs');
const server = http.createServer((req, res) => {
  
  if (/^\/respotify/.test(req.url)) {
    let path = req.url.slice('/respotify'.length);
    let hostAddr;
    if (/^\/api/.test(path)) {
      hostAddr = 'http://127.0.0.1:3001';
      path = path.slice('/api'.length);
    } else {
      hostAddr = 'http://127.0.0.1:3000';
    }
    let _req = http.request(hostAddr + path, {
      method: req.method,
      headers: req.headers
    }, _res => {
      res.writeHead(_res.statusCode, _res.statusMessage, _res.headers);
      _res.pipe(res);
    });
    req.pipe(_req);
    return;
  }

  if (/^\/notube/.test(req.url)) {
    let path = req.url.slice('/notube'.length);
    let hostAddr;
    if (/^\/api/.test(path)) {
      hostAddr = 'http://127.0.0.1:3003';
      path = path.slice('/api'.length);
    } else {
      hostAddr = 'http://127.0.0.1:3002';
    }
    let _req = http.request(hostAddr + path, {
      method: req.method,
      headers: req.headers
    }, _res => {
      res.writeHead(_res.statusCode, _res.statusMessage, _res.headers);
      _res.pipe(res);
    });
    req.pipe(_req);
    return;
  }

  if (/^\/web-repl/.test(req.url)) {
    let path = req.url.slice('/web-repl'.length);
    let hostAddr = 'http://127.0.0.1:3004';
    let _req = http.request(hostAddr + path, {
      method: req.method,
      headers: req.headers
    }, _res => {
      res.writeHead(_res.statusCode, _res.statusMessage, _res.headers);
      _res.pipe(res);
    });
    req.pipe(_req);
    return;
  }

  if (/^\/marta/.test(req.url)) {
    let path = req.url.slice('/marta'.length);
    let hostAddr;
    if (/^\/api/.test(path)) {
      hostAddr = 'http://127.0.0.1:3006';
      path = path.slice('/api'.length);
    } else {
      hostAddr = 'http://127.0.0.1:3005';
    }
    let _req = http.request(hostAddr + path, {
      method: req.method,
      headers: req.headers
    }, _res => {
      res.writeHead(_res.statusCode, _res.statusMessage, _res.headers);
      _res.pipe(res);
    });
    req.pipe(_req);
    return;
  }

  let path = req.url.slice(1);
  if (fs.existsSync(path)) {
    fs.createReadStream(path).pipe(res);
  } else {
    res.statusCode = 404;
    res.end('Not Found');
  }
});

server.listen(process.env.PORT || 80, () => console.log('Listening on 80'));
