require_relative '../lib/kamiflex'

json = Kamiflex.json(self) do
  alt_text "hello world!"
  bubble do
    body do
      url_button "hello world!", "https://www.kamigo.tw", style: :primary, desktop: "https://etrex.tw/"
    end
  end
end

puts json
