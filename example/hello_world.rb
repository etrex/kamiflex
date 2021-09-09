require_relative '../lib/kamiflex'
require 'clipboard'

json = Kamiflex.json(self) do
  alt_text "hello world!"
  bubble do
    body borderColor: "#FF0000", borderWidth: :light do
      text "hello world!"
    end
  end
end

puts json
Clipboard.copy json