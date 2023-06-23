# frozen_string_literal: true

class Scarpe
  class Button < Scarpe::Widget
    include Scarpe::Log
    display_properties :text, :width, :height, :top, :left, :color, :padding_top, :padding_bottom, :text_color, :font_size

    def initialize(text, width: nil, height: nil, top: nil, left: nil, color: nil, padding_top: nil, padding_bottom: nil, text_color: nil,
      font_size: nil, & block)
      log_init("Button")

      # Properties passed as positional args, not keywords, don't get auto-set
      @text = text
      @color = color

      @block = block

      super

      # Bind to a handler named "click"
      bind_self_event("click") do
        @log.debug("Button clicked, calling handler") if @block
        @block&.call
      end

      create_display_widget
    end

    # Set the click handler
    def click(&block)
      @block = block
    end
  end
end
