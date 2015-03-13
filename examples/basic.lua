-- Include aREST module
local rest = require "aREST"

-- Set module ID & name
rest.set_id("1")
rest.set_name("esp8266")

-- Create server
srv=net.createServer(net.TCP) 
print("Server started")

-- Start server
srv:listen(80,function(conn)
  conn:on("receive",function(conn,request)

    -- Handle requests
    rest.handle(conn, request)
  
  end)

  conn:on("sent",function(conn) conn:close() end)
end)