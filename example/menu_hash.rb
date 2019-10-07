require_relative '../lib/kamiflex'

hash = Kamiflex.to_hash(self) do
  bubble do
    body do
      horizontal_box margin: "md" do
        message_button "道具1", "道具1", style: "primary", margin: "md"
        message_button "道具2", "道具2", style: "primary", margin: "md"
        message_button "道具3", "道具3", style: "primary", margin: "md"
      end
      horizontal_box margin: "md" do
        message_button "道具4", "道具4", style: "primary", margin: "md"
        message_button "道具5", "道具5", style: "primary", margin: "md"
        message_button "道具6", "道具6", style: "primary", margin: "md"
      end
    end
  end
end

puts hash
