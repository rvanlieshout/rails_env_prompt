require 'rails_env_prompt/irb'
require 'rails_env_prompt/pry'
require 'rails_env_prompt/version'

module RailsEnvPrompt
  def self.template
    [
      app_name,
      environment_name,
      tenant_prompt
    ].compact.join('/') + ' '
  end

  def self.app_name
    @app_name ||= begin
      application_class = Rails.application.class

      case
      when application_class.method_defined?(:module_parent_name) then application_class.module_parent_name
      when application_class.method_defined?(:parent_name) then application_class.parent_name
      else application_class.name =~ /::[^:]+\z/ ? -$` : nil
      end
    end
  end

  def self.environment_name
    colored(Rails.env, environment_color)
  end

  def self.tenant_prompt
    return unless defined?(Apartment)

    Apartment::Tenant.current
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
