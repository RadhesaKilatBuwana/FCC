import http from 'http';
import fs from 'fs';
import { WebSocketServer } from 'ws';

const PORT = 3001;

//1. Creating HTTP Server
const server = http.createServer((req, res) => {
  fs.readFile("./public/index.html", (err, html) => {
    if (err) {
      res.writeHead(500);
      res.end("Could not read index.html");
      return;
    }

    res.writeHead(200, { "Content-Type": "text/html" });
    res.end(html);
  });
});

//2. Creating WebSocket Server
const wss = new WebSocketServer({ server });

//5. Registering a message listener
function broadcast(message) {
  const data = JSON.stringify(message);

  for (const client of wss.clients) {
    if (client.readyState === client.OPEN) {
      client.send(data);
    }
  }
}

//3. Register Connectiion to listener on wss
wss.on("connection", (socket, req) => {
  const username = new URL(req.url, "http://localhost").searchParams.get(
    "username",
  );

  broadcast({ type: "system", text: `${username} joined` });

  socket.on("message", (message) => {
    //4. Parse client username upon connection
    const { username, text } = JSON.parse(message.toString());
    broadcast({ type: "chat", username, text });
  });

  //6. Register close socket
  socket.on("close", () => {
    broadcast({ type: "system", text: `${username} left` });
  });
});

//7. Listening when start
server.listen(PORT, () => {
  console.log("Chat server running at http://localhost:3001");
});