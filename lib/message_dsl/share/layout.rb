module MessageDsl
  module Share
    module Layout
      def render_with_layout meta, data={}
        {
          status: meta._status,
          meta: {
            devMessage: meta._dev_message,
            errorKey: meta._error_key,
            userMessage: {
              i18n: {
                key: meta._user_message_i18n_key,
                interpolations: camelize_object_keys!(meta._user_message_i18n_interpolations)
              },
              plain: meta._user_message_plain
            }
          },
          data: camelize_object_keys!(data)
        }.to_json
      end

      private
      
      def camelize_object_keys!(object)
        if object.is_a? Hash
          object.keys.each { |k| object[(k.to_s.camelize(:lower) rescue k) || k] = camelize_object_keys!(object.delete(k)) }
        elsif object.is_a? Array
          object.each { |e| camelize_object_keys!(e) }
        end
        object
      end
    end
  end
end