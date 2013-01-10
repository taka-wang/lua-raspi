#!/usr/bin/lua
------------------------------------------------------
--- Pin17 LED Test
--- Date: 20130110
--- @author: Taka Wang <wang.chia.ming@gmail.com>
--- Usage: luajit light.lua 3
------------------------------------------------------
if (#arg == 0) then
    print("Plese input period secs") 
    os.exit(1)
end

gpio = require("sgpio")

pin = 17
gpio.open(pin, "out")
for i = 1, tonumber(arg[1]) do
    gpio.set(pin, 1)
    os.execute("sleep 1")
    gpio.set(pin, 0)
    os.execute("sleep 0.1")
end
gpio.close(17)