require 'message_dsl/share'

module MessageDsl
  module Worker
    
    include MessageDsl::Share::Layout

    def cache_json_response(status, options={}, &block)
      unless [:ok, :bad_request, :unauthorized, :not_found, :internal_server_error].include?(status)
        raise "Invalid status: #{status}"
      end
      key = options[:key] || self.class.job_id
      data = options[:data] || {}
      meta = MessageDsl::Share::Meta.new(self, status)
      meta._status = Rack::Utils.status_code(status)
      meta.instance_eval(&block) if block.present?
      if meta.valid?
        ex = options[:ex]
        ex_at = options[:ex_at]
        $redis.set key, render_with_layout(meta, data)
        $redis.expire key, ex if ex
        $redis.expireat key, ex_at if ex_at
      else
        raise "One of userMessage.i18n or userMessage.plain should be present"
      end
    end
  end
end