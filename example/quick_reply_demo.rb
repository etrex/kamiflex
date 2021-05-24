require_relative '../lib/kamiflex'

json = Kamiflex.json(self) do
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
  quick_reply do
    message_action_item "道具1"
    message_action_item "道具2"
    message_action_item "道具3"
    message_action_item "道具4"
    message_action_item "道具5"
    message_action_item "道具6"
  end
end

puts json
