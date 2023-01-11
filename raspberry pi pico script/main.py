from machine import I2C, Pin, PWM
import utime
from pico_i2c_lcd import I2cLcd

# PIN Arrangement
# 0 1
# 2 3

# LCD = SDA-0 SCL-1 Vcc-VBUS(40)
# PIN_1 = 2 3 4 5
# PIN_2 = 6 7 8 9
# PIN_3 = 10 11 12 13
# PIN_4 = 18 19 20 21

# setup lcd
i2c = I2C(0, sda=Pin(0), scl=Pin(1), freq=400000)
I2C_ADDR = i2c.scan()[0]
lcd = I2cLcd(i2c, I2C_ADDR, 2, 16)

# setup time

# return specified part in "00" format, return those two digits in array
def getHour():
    return utime.localtime()[3]
def getHourDigits():
    return [int(d) for d in str("{:02d}".format(getHour()))]

def getMinute():
    return utime.localtime()[4]
def getMinuteDigits():
    return [int(d) for d in str("{:02d}".format(getMinute()))]

def getSecond():
    return utime.localtime()[5]
def getSecondDigits():
    return [int(d) for d in str("{:02d}".format(getSecond()))]

# convert to binary

BRAILLE = [0x7, 0x8, 0xA, 0xC, 0xD, 0x9, 0xE, 0xF, 0xB, 0x6]

# convert int to bin in "0000" format
def convert(num):
    return '{:04b}'.format(BRAILLE[num])

# light led set coresponding to bin number
def light(pins, array):
    pins[0].value(int(array[0]))
    pins[1].value(int(array[1]))
    pins[2].value(int(array[2]))
    pins[3].value(int(array[3]))

# PINS - 10k Ohm to LEDs
pins_1 = [Pin(2, Pin.OUT),
             Pin(3, Pin.OUT),
             Pin(4, Pin.OUT),
             Pin(5, Pin.OUT)]

pins_2 = [Pin(6, Pin.OUT),
             Pin(7, Pin.OUT),
             Pin(8, Pin.OUT),
             Pin(9, Pin.OUT)]

pins_3 = [Pin(10, Pin.OUT),
             Pin(11, Pin.OUT),
             Pin(12, Pin.OUT),
             Pin(13, Pin.OUT)]

pins_4 = [Pin(18, Pin.OUT),
             Pin(19, Pin.OUT),
             Pin(20, Pin.OUT),
             Pin(21, Pin.OUT)]

for x in range(4):
    pins_1[x].value(0)
    pins_2[x].value(0)
    pins_3[x].value(0)
    pins_4[x].value(0)
    
    
# bufor
digits = [0, 0, 0, 0]
number = 0

while True:  
    # algorithm
    digits[0] = convert(getHourDigits()[0])
    digits[1] = convert(getHourDigits()[1])
    digits[2] = convert(getMinuteDigits()[0])
    digits[3] = convert(getMinuteDigits()[1])
    
    light(pins_1, digits[0])
    light(pins_2, digits[1])
    light(pins_3, digits[2])
    light(pins_4, digits[3])
        
     # lcd setting / update
    
    lcd.move_to(4,0)
    lcd.putstr(str("{:02d}".format(getHour())) + ":" +
               str("{:02d}".format(getMinute())) + ":" +
               str("{:02d}".format(getSecond())))
    
    lcd.move_to(0,1)
    lcd.putstr(str(digits[0]))
    
    lcd.move_to(4,1)
    lcd.putstr(str(digits[1]))
    
    lcd.move_to(8,1)
    lcd.putstr(str(digits[2]))
    
    lcd.move_to(12,1)
    lcd.putstr(str(digits[3]))
    


    


    