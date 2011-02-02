require 'meta_on_rails/view_helpers'

module MetaOnRails
  class Railtie < Rails::Railtie
    initializer "meta_on_rails.action_view" do |app|
      ActiveSupport.on_load :action_view do
        include MetaOnRails::ViewHelpers
      end
    end
  end
end
