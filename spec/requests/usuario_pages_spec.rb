require 'spec_helper'

describe "Usuario pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Registrate') }
    it { should have_title(full_title('Registrate')) }
  end
end
