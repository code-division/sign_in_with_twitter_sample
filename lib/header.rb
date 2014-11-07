module SimpleOAuth
  class Header
    def attributes
      matching_keys, extra_keys = options.keys.partition { |key| ATTRIBUTE_KEYS.include?(key) }
      if options[:ignore_extra_keys] || extra_keys.empty?
        Hash[options.select { |key, _value| matching_keys.include?(key) }.collect { |key, value| [:"oauth_#{key}", value] }]
      else
        Hash[options.select { |key, _value| matching_keys.include?(key) }.collect { |key, value| [:"oauth_#{key}", value] }]
        # fail "SimpleOAuth: Found extra option keys not matching ATTRIBUTE_KEYS:\n  [#{extra_keys.collect(&:inspect).join(', ')}]"
      end
    end
  end
end