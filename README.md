# ZaragozaMap
Zaragoza local information iOS app: buses, bizi, monuments,...

Made with SwiftUI

[![download](/images/Download_on_the_App_Store_Badge_ES_135x40.png)](https://itunes.apple.com/app/zgzmap/id439631199)

## Sources
This app scrapes data from the following sources:
- [Bizi zaragoza](https://www.bizizaragoza.com)
- [Zaragoza avanza grupo](https://zaragoza.avanzagrupo.com/tarifas-y-titulos/)
- [UTM -> Longitud, latitude]
(http://www.rcn.montana.edu/resources/tools/coordinates.aspx?nav=11&c=UTM&md=83&mdt=NAD83/WGS84&z=30&e=677113&n=4614370&h=N)
- [Incidenciaas de tráfico](http://www.zaragoza.es/georss/feed?id=2)
- [Archivos municipales NO SIRVE](http://www.zaragoza.es/ciudad/rdf/hilo/ver_Centro?georss_id=34)
- [FARMACIAS](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Farmacias&srsname=4326)
- [PARKINGS PUBLICOS](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Aparcamientos&srsname=4326)
- [ESTACIONES AUTOBUSES](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Transporte%20Urbano&srsname=4326)
- [Parking bizi](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=AparcaBicis&srsname=4326)
- [Paradas TAXI](http://idezar.zaragoza.es/clientesIDEZarOL/visualizadorTematico/index.html?tema=taxis)
- [Estaciones de servicio](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Estaciones%20de%20Servicio&srsname=4326)
- [Centro de congresos](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Palacios%20de%20Congresos&srsname=4326)
- [Centro de salud](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Centros%20de%20Salud&srsname=4326)
- [Monumentos](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Monumentos&srsname=4326)
- [Oficinas de turismo](http://idezar.zaragoza.es/wfss/wfss?request=GetFeature&featureType=PuntosDeInteres&propertyNames=posicion,url,nombre,icono_grande&subtema=Oficinas%20de%20Turismo&srsname=4326)
- [Recarga tarjeta bus](http://www.tuzsa.es/tuzsa_frm_recarga.php)
- [WiFi](http://www.zaragoza.es/georref/json/hilo/ver_Wifi?srsname=wgs84)
- [WiFi](http://www.zaragoza.es/ciudad/sectores/tecnologia/tecno/wifipuntos.htm)
