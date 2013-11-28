
require 'spec_helper'

describe Usuario do

	before do
    @user = Usuario.new(:username  => "User",
              :email     => "user@example.com",
              :password  => "example01",
              :password_confirmation => "example01")
  
  end

 subject { @user }
  
  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

   describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

  describe "when name is not present" do
  	before { @user.username = " " }
    it { should_not be_valid }
  end
