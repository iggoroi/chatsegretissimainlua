local socket=require("socket")
local host, port = "127.0.0.1", 59784
local tcp = assert(socket.tcp())
tcp:connect(host, port)
while true do
    local message = io.read()
    tcp:send(message.."\n")
    if (message == "chiudi tutto") then break end
end
tcp:close()