# aREST-ESP8266

aREST API for the ESP8266 WiFi chip using the NodeMCU firmware

Version 0.1

## Overview

A simple module that implements a REST API for the ESP8266 chip.

If you want to know more about aREST, go over to [http://arest.io/](http://arest.io/).

## Contents

- aREST.lua: the library file.
- examples: several examples using the aREST module

## Supported Hardware

The library is in theory working with all the modules based on the ESP8266 chip. It was tested with the ElectroDragon ESP8266 module & the Olimex ESP8266 development board.

## Requirements

Using this library requires an ESP8266 board with the NodeMCU firmware running on it, and connected to your local WiFi network. You can learn more about the NodeMCU firmware on the NodeMCU GitHub repository ([https://github.com/nodemcu/nodemcu-firmware](https://github.com/nodemcu/nodemcu-firmware)). 

You can also find a complete guide on how to setup an ESP8266 board with the NodeMCU firmware on:

[https://www.openhomeautomation.net/getting-started-esp8266/](https://www.openhomeautomation.net/getting-started-esp8266/)

## Setup

To install the module, simply place the aREST.lua file at the root of your ESP8266 board. To do so you can use tools like ESPlorer ([https://github.com/4refr0nt/ESPlorer](https://github.com/4refr0nt/ESPlorer)) or LuaTool ([https://github.com/4refr0nt/luatool](https://github.com/4refr0nt/luatool)).

## GPIO Pins

This module follows the GPIO pins mapping as defined in the official [NodeMCU firmware documentation](https://github.com/nodemcu/nodemcu-firmware/wiki/nodemcu_api_en#new_gpio_map).

## Quick Test

1. Connect a LED & resistor to pin number 1 of your ESP8266 board
2. Start your ESP8266 module and get the IP address of the module. Let's assume here it is 192.168.1.103
3. Put the basic.lua example at the root of your ESP8266 chip
4. Execute the file via the dofile("basic.lua") command
5. Go to a web browser and type `192.168.1.103/mode/1/o` to set the pin as an output
6. Now type `192.168.1.103/digital/1/1` and the LED should turn on

## API documentation

The API currently supports five type of commands: digital, analog, and mode.

### Digital

Digital is to write or read on digital pins of the ESP8266. For example:
  * `/digital/1/0` sets pin number 1 to a low state
  * `/digital/1/1` sets pin number 1 to a high state
  * `/digital/1` reads value from pin number 1 in JSON format (note that for compatibility reasons, `/digital/1/r` produces the same result)

### Analog

Analog is to write or read analog values on the ESP8266. Note that you can only read analog values from analog pin 0. For example:
  * `/analog/1/123` sets pin number 1 to 123 using PWM
  * `/analog/0` returns analog value from pin number 0 in JSON format (note that for compatibility reasons, `/analog/0/r` produces the same result)

### Mode

Mode is to change the mode on a pin. For example:
  * `/mode/1/o` sets pin number 1 as a digital output
  * `/mode/1/i` sets pin number 1 as a digital input
  * `/mode/1/p` sets pin number 1 as a PWM output

### Get data about the board

You can also access a description of all the variables that were declared on the board with a single command. This is useful to automatically build graphical interfaces based on the variables exposed to the API. This can be done via the following calls:
  * `/` or `/id`
  * The names & types of the variables will then be stored in the variables field of the returned JSON object