begin
  require 'pry'
rescue LoadError => _e
end

if defined?(Pry)
  Pry::Prompt.add(:rails_env_prompt) do |context, nesting, _instance, sep|
    "#{RailsEnvPrompt} #{context}:#{nesting}#{sep}"
  end

  Pry.config.prompt = Pry::Prompt[:rails_env_prompt]
end
