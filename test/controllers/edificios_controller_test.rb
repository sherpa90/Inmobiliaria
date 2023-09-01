require "test_helper"

class EdificiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edificio = edificios(:one)
  end

  test "should get index" do
    get edificios_url
    assert_response :success
  end

  test "should get new" do
    get new_edificio_url
    assert_response :success
  end

  test "should create edificio" do
    assert_difference("Edificio.count") do
      post edificios_url, params: { edificio: { areas_verdes: @edificio.areas_verdes, comuna_id: @edificio.comuna_id, direccion: @edificio.direccion, estacionamiento: @edificio.estacionamiento, gimnasio: @edificio.gimnasio, juegos_infantiles: @edificio.juegos_infantiles, nombre: @edificio.nombre, pet_friendly: @edificio.pet_friendly, piscina: @edificio.piscina, quincho: @edificio.quincho } }
    end

    assert_redirected_to edificio_url(Edificio.last)
  end

  test "should show edificio" do
    get edificio_url(@edificio)
    assert_response :success
  end

  test "should get edit" do
    get edit_edificio_url(@edificio)
    assert_response :success
  end

  test "should update edificio" do
    patch edificio_url(@edificio), params: { edificio: { areas_verdes: @edificio.areas_verdes, comuna_id: @edificio.comuna_id, direccion: @edificio.direccion, estacionamiento: @edificio.estacionamiento, gimnasio: @edificio.gimnasio, juegos_infantiles: @edificio.juegos_infantiles, nombre: @edificio.nombre, pet_friendly: @edificio.pet_friendly, piscina: @edificio.piscina, quincho: @edificio.quincho } }
    assert_redirected_to edificio_url(@edificio)
  end

  test "should destroy edificio" do
    assert_difference("Edificio.count", -1) do
      delete edificio_url(@edificio)
    end

    assert_redirected_to edificios_url
  end
end
