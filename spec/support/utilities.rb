def full_title(page_title)
  base_title = "Piller"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def valid_signin(usuario)
  fill_in "Email",    with: usuario.email
  fill_in "Password", with: usuario.password
  click_button "Acceder"
end
