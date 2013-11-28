
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

  describe "when email is not present" do
  	before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid }
  end

    describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  
  end
