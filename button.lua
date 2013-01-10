#!/usr/bin/lua
------------------------------------------------------
--- Pin27 Button Test
--- Date: 20130110
--- @author: Taka Wang <wang.chia.ming@gmail.com>
------------------------------------------------------

gpio = require("sgpio")

pin = 27
open(pin, "in")
while true do
    os.execute("sleep 0.5")
    if (get(pin) == 0) then
        -- light pin17 if press
        os.execute("luajit light.lua 3 &")
    end
end

close(pin)