begin
  require 'pry'
rescue LoadError => _e
end

if defined?(Pry)
  Pry.config.prompt = proc do |obj, nest_level, _|
    "#{RailsEnvPrompt.template} #{obj}:#{nest_level}> "
  end
end
