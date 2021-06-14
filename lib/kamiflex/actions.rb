module Kamiflex
  module Actions
    def message_action(label, **params)
      {
        type: "message",
        label: label,
        text: params[:text] || label
      }.merge(params)
    end

    def uri_action(uri, **params)
      action = {
        type: "uri",
        label: uri[0...40],
        uri: uri
      }

      if params[:desktop].present?
        action[:altUri] = {
          desktop: params[:desktop]
        }
      end

      action
    end

    def postback_action(data, **params)
      {
        type: "postback",
        data: data
      }.merge(params)
    end
  end
end
