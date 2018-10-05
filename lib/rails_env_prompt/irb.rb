require 'irb'

module IRB
  class << self
    def setup_with_prompt_override(ap_path)
      setup_without_prompt_override(ap_path)

      prompt = RailsEnvPrompt.template

      prompts = {
        normal: "#{prompt} %03n:%i> ",
        for_continuated_strings: "#{prompt} %03n:%i%l ",
        for_continuated_statements: "#{prompt} %03n:%i* "
      }

      # Some older versions store this value and call dup. We'll have to change it each time to have it include current
      # tenant and possible other dynamic variables
      %i[normal for_continuated_strings for_continuated_statements].each do |key|
        prompts[key] = prompts[key].tap do |string|
          def string.dup
            RailsEnvPrompt.parse(self)
          end
        end
      end

      IRB.conf[:PROMPT][:RAILS_ENV_PROMPT] = {
        PROMPT_I: prompts[:normal],
        PROMPT_N: prompts[:normal],
        PROMPT_S: prompts[:for_continuated_strings],
        PROMPT_C: prompts[:for_continuated_statements],
        RETURN: "=> %s\n"
      }

      IRB.conf[:PROMPT_MODE] = :RAILS_ENV_PROMPT
    end

    alias setup_without_prompt_override setup
    alias setup setup_with_prompt_override
  end
end
