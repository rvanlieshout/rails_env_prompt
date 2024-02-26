require 'irb'

if IRB::VERSION >= Gem::Version.new('1.9.0')
  module IRB
    class Irb
      original_format_prompt = instance_method(:format_prompt)

      define_method(:format_prompt) do |format, ltype, indent, line_no|
        original_format_prompt.bind(self).(
          "#{RailsEnvPrompt.to_s} #{format}", ltype, indent, line_no
        )
      end
    end
  end
end
