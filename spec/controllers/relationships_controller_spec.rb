require 'spec_helper'

describe RelationshipsController do

  let(:usuario) { FactoryGirl.create(:usuario) }
  let(:other_usuario) { FactoryGirl.create(:usuario) }

  before { sign_in usuario, no_capybara: true }

  describe "creating a relationship with Ajax" do

    it "should increment the Relationship count" do
      expect do
        xhr :post, :create, relationship: { followed_id: other_usuario.id }
      end.to change(Relationship, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, relationship: { followed_id: other_usuario.id }
      expect(response).to be_success
    end
  end

  describe "destroying a relationship with Ajax" do

    before { usuario.follow!(other_usuario) }
    let(:relationship) { usuario.relationships.find_by(followed_id: other_usuario) }

    it "should decrement the Relationship count" do
      expect do
        xhr :delete, :destroy, id: relationship.id
      end.to change(Relationship, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: relationship.id
      expect(response).to be_success
    end
  end
end