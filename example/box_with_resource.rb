require_relative '../lib/kamiflex'

@resources = [
  {
    name: "ruby"
  },
  {
    name: "rails"
  },
  {
    name: "kamiflex"
  }
]

json = Kamiflex.json(self) do
  bubble do
    body do
      vertical_box @resources do |resource|
        text "#{resource[:name]}"
      end
    end
  end
end

puts json