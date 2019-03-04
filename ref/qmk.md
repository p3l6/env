
## TEENSY INSTALLING

use teensy loader while in bootloader mode (either with soft reset or button on teensy)


## PRO MICRO INSTALLING

run first command twice to find the tty that is added after shorting the pins
```
ls /dev/tty* | grep ACM0
sudo avrdude -p atmega32u4 -P /dev/ttyACM0  -c avr109  -U flash:w:gherkin_paulLayout.hex
avrdude -p atmega32u4 -P /dev/tty.usbmodem1411  -c avr109  -U flash:w:gherkin_ePipes.hex
```

## TADA INSTALLING

* `make tada68-layout-bin`
* hit reset key.
* replace flash.bin file on mounted storage, keep naming the same.
* remove any files that mac added.
* eject volume, replug keyboard. (use escape key on keyboard to force eject)

## Build with Docker

Run from inside your root qmk directory. Edit the keymap and keyboard as appropriate. 

docker run -e keymap=paulLayout -e keyboard=tada68 --rm -v $('pwd'):/qmk:rw edasque/qmk_firmware
