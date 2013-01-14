#!/usr/bin/lua
------------------------------------------------------
--- Pin18 Photocell Test
--- Date: 20130115
--- @author: Taka Wang <wang.chia.ming@gmail.com>
--- Usage: luajit photo
------------------------------------------------------

gpio = require("sgpio")

while (true) do
    print(gpio.rctime(18, 100))
end