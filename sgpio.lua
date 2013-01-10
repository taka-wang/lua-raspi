------------------------------------------------------
--- Simple GPIO Control (sysfs method)
--- @release Version: 0.1.1
--- Date: 20130110
--- @author: Taka Wang <wang.chia.ming@gmail.com>
---
--- Usage:
--- gpio = require("sgpio")
--- gpio.open(17, "in")
--- gpio.set(17, 1)
--- print(gpio.get(17))
--- gpio.close(17)
---
------------------------------------------------------

module(..., package.seeall)

------------------------------------------------------
-- export and set direction
-- @param: pin number
-- @param: direction (in, out)
function open(pin, direction)
    -- export
    os.execute(string.format([[echo "%d" > /sys/class/gpio/export]], pin))
    -- set direction
    if (direction == "in") then
        os.execute(string.format([[echo "in" > /sys/class/gpio/gpio%d/direction]], pin))
    else
        os.execute(string.format([[echo "out" > /sys/class/gpio/gpio%d/direction]], pin))
    end
end

-----------------------------------------------------
-- unexport gpio pin
-- @param: pin number
function close(pin)
    os.execute(string.format([[echo "%d" > /sys/class/gpio/unexport]], pin))
end

-----------------------------------------------------
-- set gpio value
-- @param: pin number
-- @param: value (0, 1)
function set(pin, value)
    os.execute(string.format([[echo "%d" > /sys/class/gpio/gpio%d/value]], value, pin))
end

-----------------------------------------------------
-- get gpio value
-- @param: pin number
-- @return gpio value (0, 1)
function get(pin)
    f = io.input(string.format("/sys/class/gpio/gpio%d/value", pin))
    s = f:read ("*l") -- read one line
    f:close ()  -- close that file now
    return tonumber(s)
end
