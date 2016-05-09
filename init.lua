wifi.setmode(wifi.STATION)
wifi.sta.config("SSID", "Password")


--wifi.sta.setip({ip="192.168.2.100",netmask="255.255.255.0",gateway="192.168.2.1"}) 
--üstteki kod ip adresini sabitlemek içindir. Kendi ağınıza göre düzenleyip kullanın. "--"
-- kaldırmayı unutma

LED = 1
gpio.mode(LED,gpio.OUTPUT)

gpio.write(LED,1)

srv = net.createServer(net.TCP)
srv:listen(80, function(baglanti)
    baglanti:on("receive",function(baglanti,bilgi)
    URL = "sayfabilgisi"
        URL = string.sub(bilgi,string.find(bilgi,"GET /") +5,string.find(bilgi,"HTTP/") -2 )
    print(URL)

    if URL == "?LED=yak" then 
      gpio.write(LED,1)
      LedDurumu = 1
    elseif URL == "?LED=sondur" then
      gpio.write(LED,0)
      LedDurumu = 0
    end


  buf =" <h1>merhaba</h1>"
  buf = buf.. "<!DOCTYPE html>"
  buf = buf.."<html lang='en'>"
  buf = buf.."<head><meta charset='utf-8' />"
  buf = buf.."<title>Hello, World!</title></head>"
  buf = buf.."<body><h1>ESP8266 HTPP Server</h1>"
  -- Send the current status of the LED
  if gpio.read(LED) == gpio.HIGH then
    led = "ON"
  else
    led = "OFF"
  end
 
  buf = buf.."<p>Current LED status: " .. led .. "</p>"
  buf = buf.."<button onclick=window.location='?LED=yak'>LAMBA Yak</button>"
  buf = buf.."<button onclick=window.location='?LED=sondur'>LAMBA Sondur</button>"
  buf = buf.."<form method='post'>"
 
  buf = buf.."</form></body></html>"
            
    baglanti:send(buf)
      
      

     baglanti:close()
     end)
     end)    
    
        
