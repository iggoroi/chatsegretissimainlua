-- load namespace
local socket = require("socket")
-- create a TCP socket and bind it to the local host, at any port
local server = assert(socket.bind("127.0.0.1", 59784))
-- find out which port the OS chose for us
local ip, port = server:getsockname()
-- print a message informing what's up
print("Please telnet to the ip "..ip.." on port " .. port)
-- wait for a connection from any client
local client = server:accept()
client:setoption("keepalive", true)
while true do
    local line, err = client:receive()
    if not err then
        if line ~= "chiudi tutto" then
            print(line)
        else
            break
        end
    else 
        print(err)
        break
    end
end
client:close()