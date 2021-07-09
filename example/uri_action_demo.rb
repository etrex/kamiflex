require_relative '../lib/kamiflex'

json = Kamiflex.json(self) do
  alt_text "hello world!"
  bubble do
    body do
      text "這是文字方塊，但你點點看", action: uri_action("https://www.kamigo.tw/", desktop: "https://etrex.tw/")
    end
  end
end

puts json
