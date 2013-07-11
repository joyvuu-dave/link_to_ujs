require 'link_to_ujs/version'
require 'active_support'

module LinkToUjs
  module Rails
    class Engine < ::Rails::Engine
      ActiveSupport.on_load(:action_view) do
        require 'link_to_ujs/action_view/helpers/javascript_helper'
        include LinkToUjs::ActionView::Helpers::JavaScriptHelper
      end
    end
  end
end
