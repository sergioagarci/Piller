
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