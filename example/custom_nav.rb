require_relative '../lib/kamiflex'

json = Kamiflex.json(self) do
  bubble do
    body do
      nav "kamiflex"
    end
  end
end

puts json