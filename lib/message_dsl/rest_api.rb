require 'message_dsl/share'

module MessageDsl
  module RestApi
    include MessageDsl::Share::Layout

    def render_json_response(status, options={}, &block)
      unless [:ok, :bad_request, :unauthorized, :not_found, :internal_server_error, :accepted].include?(status)
        raise "Invalid status: #{status}"
      end
      @meta_data = MessageDsl::Share::Meta.new(self, status)
      @meta_data._status = Rack::Utils.status_code(status)
      @meta_data.instance_eval(&block) if block.present?
      default_options = {
        :status => status,
        :action => :none,
        :formats => [:json]
      }.merge(options)
      if @meta_data.valid?
        render default_options.merge(options)
      else
        raise "One of userMessage.i18n or userMessage.plain should be present"
      end
    end
  end
end
