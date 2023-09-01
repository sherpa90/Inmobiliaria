json.extract! edificio, :id, :nombre, :direccion, :comuna_id, :piscina, :quincho, :gimnasio, :areas_verdes, :juegos_infantiles, :estacionamiento, :pet_friendly, :created_at, :updated_at
json.url edificio_url(edificio, format: :json)
