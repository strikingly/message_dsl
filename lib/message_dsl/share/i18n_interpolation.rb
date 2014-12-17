module MessageDsl::Share

class I18nInterpolation < BasicObject
  def initialize(parent)
    @interpolations = {}
    @parent = parent
  end
  def root
    @parent.root
  end
  def method_missing(name, *args, &block)
    @interpolations[name.to_s] = if args.length > 0
      args[0]
    elsif block.present?
      root.instance_eval(&block)
    else
      nil
    end
  end
  def to_hash
    @interpolations
  end
end

end