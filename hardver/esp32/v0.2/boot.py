# This file is executed on every boot (including wake-boot from deepsleep)#import esp#esp.osdebug(None)val = 0try:    import usocket as socketexcept:    import socketimport networkimport espesp.osdebug(None)import gcgc.collect()ssid = 'Mike'password = 'Mike1234'station = network.WLAN(network.STA_IF)station.active(True)station.connect(ssid, password)while station.isconnected() == False:    passprint('Connection successful')print(station.ifconfig())def web_page(data):    html = """<html><head><meta name="viewport" content="width=device-width, initial-scale=1"></head>    <body><h1>"""+str(data)+"""</h1></body></html>"""    return html