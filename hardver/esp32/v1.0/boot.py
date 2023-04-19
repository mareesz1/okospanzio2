# This file is executed on every boot (including wake-boot from deepsleep)

#import esp

#esp.osdebug(None)
val = 0
import machine
try:
    import usocket as socket
except:
    import socket
import network
import esp
esp.osdebug(None)

import gc
gc.collect()

ssid = 'Mike'
password = 'Mike1234'

ledS = machine.Pin(22, machine.Pin.OUT)

#station = network.WLAN(network.STA_IF)
#station.active(True)
#station.connect(ssid, password)
import network
station = network.WLAN(network.STA_IF)

def do_connect():
    if not station.isconnected():
        print('connecting to network...')
        station.active(True)
        station.connect(ssid, password)
        while not station.isconnected():
            pass
    print('Connection successful')
    print('network config:', station.ifconfig())
    ledS.value(1)
    
    
do_connect()

def web_page(data):
    html = """<html><head><meta name="viewport" content="width=device-width, initial-scale=1"></head>
    <body><h1>"""+str(data)+"""</h1></body></html>"""
    return html