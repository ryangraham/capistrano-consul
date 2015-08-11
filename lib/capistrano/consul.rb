require 'capistrano'
require 'diplomat'

unless Capistrano::Configuration.respond_to?(:instance)
  abort 'capistrano-consul requires Capistrano >= 2'
end

module Capistrano
  module Consul
    def self.extend(configuration)
      configuration.load do
        Capistrano::Configuration.instance.load do

          def service(service_name, *roles)
            Diplomat.configure do |config|
              config.url = fetch(:consul_url, "http://localhost:8500")
              config.adapter = :net_http_persistent
              config.options = fetch(:ssl_options, {})
            end

            @nodes = Diplomat::Service.get(service_name, :all)
            @nodes.each do |node|
              server node.Address, *roles
            end 
          end 
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Consul.extend(Capistrano::Configuration.instance)
end
