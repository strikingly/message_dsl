class MessageLayoutGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  argument :namespace, :type => :string, :default => "rest_api"

  desc "Creates Rails layout files for restful controllers of certain namespace."

  def copy_message_layout_file
    path = namespace.underscore
    destination_file = "app/views/layouts/#{path}/application.json.erb"
    copy_file "application.json.erb", destination_file
  end

end
