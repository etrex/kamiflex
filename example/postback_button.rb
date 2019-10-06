require_relative '../lib/kamiflex'

json = Kamiflex.build(self) do
  bubble do
    body do
      postback_text_button "press me", "message", "data"
    end
  end
end

puts json