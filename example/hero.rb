require_relative '../lib/kamiflex'

json = Kamiflex.build(self) do
  bubble do
    hero 'https://via.placeholder.com/1024x400.png', "aspectRatio": "1024:400", "size": "full", "aspectMode": "cover"
    body do
      text "123"
    end
  end
end

puts json
