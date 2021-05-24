require_relative '../lib/kamiflex'

json = Kamiflex.json(self) do
  carousel do
    bubbles [1,2,3] do |i|
      body do
        text "#{i}"
      end
    end
  end
end

puts json