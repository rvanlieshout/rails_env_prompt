require 'irb'

module IRB
  class << self
    def _patch
      template = RailsEnvPrompt.template

      current_prompt = IRB.conf[:PROMPT_MODE]

      IRB.conf[:PROMPT][:RAILS_ENV_PROMPT] = IRB.conf[:PROMPT][:DEFAULT].map do |key, value|
        [
          key,
          (template + value)
        ]
      end.to_h

      IRB.conf[:PROMPT_MODE] = :RAILS_ENV_PROMPT
    end

    _setup = instance_method(:setup)

    if _setup.arity == -2
      define_method(:setup) do |ap_path, argv: ::ARGV|
        _setup.bind(self).call(ap_path, argv: argv)
        _patch
      end
    else
      define_method(:setup) do |ap_path|
        _setup.bind(self).call(ap_path)
        _patch
      end
    end
  end
end
