module Kamiflex
  module Core
    def flex
      attributes, _contents = flex_scope{ yield }
      {
        type: "flex",
        altText: "this is a flex message",
        contents: _contents.first
      }.merge(attributes.slice(:quickReply))
    end

    def bubble
      attributes, _contents = flex_scope{ yield }
      @flex_contents << {
        type: "bubble"
      }.merge(attributes.slice(:size, :direction, :header, :hero, :body, :footer, :style, :action))
    end

    def bubbles(resources)
      resources.each do |resource|
        attributes, _contents = flex_scope{ yield resource }
        @flex_contents << {
          type: "bubble",
        }.merge(attributes.slice(:size, :direction, :header, :hero, :body, :footer, :style, :action))
      end
    end

    def carousel
      attributes, _contents = flex_scope{ yield }
      @flex_contents << {
        type: "carousel",
        contents: _contents
      }
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
      @flex_attributes[:hero] = {
        "type": "image",
        "url": image_url
      }.merge(params)
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
end
