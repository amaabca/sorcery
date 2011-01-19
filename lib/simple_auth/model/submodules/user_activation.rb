module SimpleAuth
  module Model
    module Submodules
      # This submodule adds the ability to make the user activate his account via email
      # or any other way in which he can recieve an activation code.
      # with the activation code the user may activate his account.
      module UserActivation
        def self.included(base)
          base.simple_auth_config.class_eval do
            attr_accessor :activation_state_attribute_name,
                          :activation_code_attribute_name,
                          :simple_auth_mailer,
                          :activation_needed_email_method_name,
                          :activation_success_email_method_name
          end
          
          base.simple_auth_config.instance_eval do
            @defaults.merge!(:@activation_state_attribute_name => :activation_state,
                             :@activation_code_attribute_name  => :activation_code,
                             :@simple_auth_mailer              => nil,
                             :@activation_needed_email_method_name  => :activation_needed_email,
                             :@activation_success_email_method_name => :activation_success_email)
            reset!
          end
        end
        
      end
    end
  end
end