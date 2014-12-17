module MessageDsl::Share

class UserMessage < BasicObject
  def initialize(parent)
    @parent = parent
  end
  def root
    @parent.root
  end
  def plain(*args, &block)
    @parent._user_message_plain = if args.length > 0
      args[0]
    elsif block.present?
      root.instance_eval(&block)
    else
      nil
    end
  end
  def i18n key, &block
    @parent._user_message_i18n_key = key
    if block.present?
      interpolations = I18nInterpolation.new(@parent)
      interpolations.instance_eval(&block)
      @parent._user_message_i18n_interpolations = interpolations.to_hash
    end
  end
end

end