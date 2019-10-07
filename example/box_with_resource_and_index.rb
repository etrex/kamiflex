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

json = Kamiflex.build(self) do
  bubble do
    body do
      vertical_box @resources do |resource, index|
        text "#{index}: #{resource[:name]}"
      end
    end
  end
end

puts json