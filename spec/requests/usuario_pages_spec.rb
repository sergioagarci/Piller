require 'spec_helper'

describe "Usuario pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Registrate') }
    it { should have_title(full_title('Registrate')) }
  end
  describe "edit" do
    let(:usuario) { FactoryGirl.create(:usuario) }
    before { visit edit_usuario_path(usuario) }

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit usuario") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: usuario.password
        fill_in "Confirm Password", with: usuario.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(usuario.reload.name).to  eq new_name }
      specify { expect(usuario.reload.email).to eq new_email }
    end
  end
end
