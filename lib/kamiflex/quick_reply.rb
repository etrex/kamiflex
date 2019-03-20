module Kamiflex
  module QuickReply

    def quick_reply
      _attributes, contents = flex_scope{ yield }
      @flex_attributes[:quickReply] = {
        items: contents
      }
    end

    def action_item(action)
      @flex_contents << {
        type: "action",
        action: action
      }
    end

    def message_action_item(label, **params)
      action_item(message_action(label, **params))
    end

    def postback_action_item(label, **params)
      action_item(postback_action(label, **params))
    end

    def datetime_picker_action_item(label, **params)
      action_item(message_action(label, **params))
    end

    def camera_action_item(label, **params)
      action_item(camera_action(label, **params))
    end

    def camera_roll_action_item(label, **params)
      action_item(camera_roll_action(label, **params))
    end

    def location_action_item(label, **params)
      action_item(location_action(label, **params))
    end
  end
end