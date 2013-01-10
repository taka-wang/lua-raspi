About
=====

Some lua script for rapsberry pi

License
=====
MIT

Usage
=====
    gpio = require("sgpio")
    gpio.open(17, "in")
    gpio.set(17, 1)
    print(gpio.get(17))
    gpio.close(17)