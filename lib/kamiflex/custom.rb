module Kamiflex
  module Custom
    def nav(title, **params)
      horizontal_box do
        text 'nav'
        text title
      end
    end
  end
end
