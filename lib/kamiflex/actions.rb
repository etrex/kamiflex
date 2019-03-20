module Kamiflex
  module Actions
    def message_action(label, **params)
      {
        type: "message",
        label: label,
        text: label
      }.merge(params)
    end

    def uri_action(uri, **params)
      {
        type: "uri",
        label: uri[0...40],
        uri: uri,
        # altUri: {
        #   desktop: uri
        # }
      }
    end
  end
end
