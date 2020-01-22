module Padron
  URLS =  {
    :test => {
    	:wsaa => 'https://wsaahomo.afip.gov.ar/ws/services/LoginCms',
      :padron => "https://awshomo.afip.gov.ar/sr-padron/webservices/personaServiceA5?WSDL"
    },
    :production => {
    	:wsaa => 'https://wsaa.afip.gov.ar/ws/services/LoginCms',
      :padron => "https://aws.afip.gov.ar/sr-padron/webservices/personaServiceA5?WSDL"
    }
  }

  PROVINCIAS = {
    "0" => 'CIUDAD AUTONOMA BUENOS AIRES',
    "1" => 'BUENOS AIRES',
    "2" => 'CATAMARCA',
    "3" => 'CORDOBA',
    "4" => 'CORRIENTES',
    "5" => 'ENTRE RIOS',
    "6" => 'JUJUY',
    "7" => 'MENDOZA',
    "8" => 'LA RIOJA',
    "9" => 'SALTA',
    "10" => 'SAN JUAN',
    "11" => 'SAN LUIS',
    "12" => 'SANTA FE',
    "13" => 'SANTIAGO DEL ESTERO',
    "14" => 'TUCUMAN',
    "16" => 'CHACO', 
    "17" => 'CHUBUT',
    "18" => 'FORMOSA',
    "19" => 'MISIONES',
    "20" => 'NEUQUEN',
    "21" => 'LA PAMPA',
    "22" => 'RIO NEGRO',
    "23" => 'SANTA CRUZ',
    "24" => 'TIERRA DEL FUEGO'
  }
end