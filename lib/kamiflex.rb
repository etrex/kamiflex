require "kamiflex/railtie"

module KamiflexModule
  def bubble
    attributes, _contents = flex_scope{ yield }
    {
      type: "flex",
      altText: "this is a flex message",
      contents: {
        type: "bubble"
      }.merge(attributes.slice(:header, :hero, :body, :footer, :style))
    }.merge(attributes.slice(:quickReply))
  end

  # bubble attributes
  def header(**params)
    _attributes, contents = flex_scope{ yield }
    @flex_attributes[:header] = {
      type: "box",
      layout: "vertical",
      contents: contents
    }.merge(params)
  end

  def hero(image_url, **params)
    _attributes, _contents = flex_scope{ yield }
    @flex_attributes[:hero] = {}
  end

  def body(**params)
    _attributes, contents = flex_scope{ yield }
    @flex_attributes[:body] = {
      type: "box",
      layout: "vertical",
      contents: contents
    }.merge(params)
  end

  def footer(**params)
    _attributes, contents = flex_scope{ yield }
    @flex_attributes[:footer] = {
      type: "box",
      layout: "vertical",
      contents: contents
    }.merge(params)
  end

  # container
  def horizontal_box(resources = [nil], **params)
    resources.each do |resource|
      _attributes, contents = flex_scope{ yield resource }
      @flex_contents << {
        type: "box",
        layout: "horizontal",
        contents: contents
      }.merge(params)
    end
  end

  def vertical_box(resources = [nil], **params, &block)
    horizontal_box(resources, layout: "vertical", **params, &block)
  end

  def baseline_box(resources = [nil], **params, &block)
    horizontal_box(resources, layout: "baseline", **params, &block)
  end

  # elements
  def text(message, **params)
    @flex_contents << {
      "type": "text",
      "text": message
    }.merge(params)
  end

  def image(url, **params)
    @flex_contents << {
      "type": "image",
      "url": url
    }.merge(params)
  end

  def icon(url, **params)
    @flex_contents << {
      "type": "image",
      "url": url
    }.merge(params)
  end

  def separator(**params)
    @flex_contents << {
      "type": "separator",
      "margin": "md",
      "color": "#000000",
    }.merge(params)
  end

  def spacer(**params)
    @flex_contents << {
      "type": "spacer",
      "size": "md",
    }.merge(params)
  end

  def url_button(label, url, **params)
    @flex_contents << {
      "type": "button",
      "action": {
        "type": "uri",
        "label": label,
        "uri": url
      }
    }.merge(params)
  end

  def message_button(label, message, **params)
    @flex_contents << {
      "type": "button",
      "action": {
        "type": "message",
        "label": label,
        "text": message
      }
    }.merge(params)
  end

  # actions
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

  # quick reply
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

  private

  def flex_scope
    parent_attributes, parent_contents = @flex_attributes, @flex_contents
    @flex_attributes, @flex_contents = {}, []
    yield self
    [@flex_attributes, @flex_contents]
  ensure
    @flex_attributes, @flex_contents = parent_attributes, parent_contents
  end
end

module Kamiflex
  def self.build(parent)
    parent.class.include KamiflexModule
    JSON.pretty_generate yield
  end
end