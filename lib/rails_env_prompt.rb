require 'rails_env_prompt/irb'
require 'rails_env_prompt/pry'
require 'rails_env_prompt/version'

module RailsEnvPrompt
  def self.template
    [
      '[APP]',
      '[ENV]',
      tenant_prompt
    ].compact.join('/')
  end

  def self.parse(string)
    string.gsub('[APP]', Rails.application.class.module_parent_name)
          .gsub('[ENV]', colored(Rails.env, environment_color))
          .gsub('[TENANT]', defined?(Apartment) ? Apartment::Tenant.current : '')
  end

  def self.to_s
    parse(template)
  end

  def self.tenant_prompt
    return unless defined?(Apartment)

    '[TENANT]'
  end

  def self.colored(text, color)
    "\033[00;#{color}m#{text}\033[00m"
  end

  def self.environment_color
    case Rails.env
    when 'development' then 32 # green
    when 'staging' then 33 # yellow
    else 31 # red
    end
  end
end
