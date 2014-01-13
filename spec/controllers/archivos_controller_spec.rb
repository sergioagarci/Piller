require 'spec_helper'

describe ArchivosController do

  describe "GET 'subir_archivos'" do
    it "returns http success" do
      get 'subir_archivos'
      response.should be_success
    end
  end

  describe "GET 'listar_archivos'" do
    it "returns http success" do
      get 'listar_archivos'
      response.should be_success
    end
  end

  describe "GET 'borrar_archivos'" do
    it "returns http success" do
      get 'borrar_archivos'
      response.should be_success
    end
  end

  describe "GET 'guardar_comentarios'" do
    it "returns http success" do
      get 'guardar_comentarios'
      response.should be_success
    end
  end

end
