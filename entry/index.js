const http = require('http');
const fs = require('fs');
const server = http.createServer((req, res) => {
  console.log(req.url, /^\/respotify/.test(req.url));
  if (/^\/respotify/.test(req.url)) {
    let path = req.url.slice('/respotify'.length);
    let hostAddr;
    if (/^\/api/.test(path)) {
      hostAddr = 'http://127.0.0.1:3001';
      path = path.slice('/api'.length);
    } else {
      hostAddr = 'http://127.0.0.1:3000';
    }
    http.get(hostAddr + path, response => {
      response.pipe(res);
    });
    return;
  }
  let path = req.url.slice(1);
  if (fs.existsSync(path)) {
    fs.createReadStream(path).pipe(res);
  } else {
    res.statusCode = 404;
    res.end('Not Found');
  }
  res.end('yo');
});

server.listen(80, () => console.log('Listening on 80'));
