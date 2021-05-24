require_relative '../lib/kamiflex'

json = Kamiflex.json(self) do
  carousel do
    bubbles ['a','b','c'] do |name, index|
      body do
        text "#{index}: #{name}"
      end
    end
  end
end

puts json