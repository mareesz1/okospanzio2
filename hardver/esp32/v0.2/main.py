import machinefrom mfrc522 import MFRC522import utimeimport urequestsimport ujsonprint("main")ledS = machine.Pin(22, machine.Pin.OUT)ledP = machine.Pin(16, machine.Pin.OUT)ledZ = machine.Pin(17, machine.Pin.OUT)ledP.value(0)ledZ.value(0)ledS.value(0)s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)s.bind(('', 80))s.listen(5)reader = MFRC522(spi_id=0, sck=18, miso=19, mosi=23, cs=5, rst=21)url = 'http://bgs.jedlik.eu/mm/szakdoga_api/api/reader'def read():    reader.init()    stat, tag_type = reader.request(reader.REQIDL)    if stat == reader.OK:        ledS.value(1)        (stat, uid) = reader.SelectTagSN()        if stat == reader.OK:            card = int.from_bytes(bytes(uid),"little",False)#            print("CARD ID: "+str(card))#            ledS.value(1)#            utime.sleep_ms(500)#            try:            print('asd')#                response = urequests.post(url, headers = {'content-type': 'application/json'}, data = data)#            post_data = ujson.dumps({'id': 'int(str(card))'})#            post_data = {'id': int(str(card))}#            post_data2 = ujson.dumps(post_data)            post_data = {'id': int(str(card))}            post_data_json = ujson.dumps(post_data)            print(post_data_json)            res = urequests.post(url, headers={'content-type': 'application/json'}, data=post_data_json).json()#            res = urequests.post(url, headers = {'content-type': 'application/json'}, data = post_data).json()#                response = urequests.get(url)#                response = response.json()            print(res['data'])            ledS.value(0)#                if response['success']:#                    ledZ.value(1)#                else:#                    pedP.value(1)            utime.sleep_ms(500)#            except:#                print('No response from ' + url)#                ledS.value(0)#                ledP.value(1)#                utime.sleep_ms(500)print("Reader operational")#try:#    response = urequests.get(url)#    print(response.json())#except:#    print('No response from' + url)while True:  read()  utime.sleep_ms(100)  ledS.value(0)  ledZ.value(0)  ledP.value(0)