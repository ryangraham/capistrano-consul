[![Gem Version](https://badge.fury.io/rb/capistrano-consul.svg)](http://badge.fury.io/rb/capistrano-consul)

# capistrano-consul
Capistrano plugin to populate roles with hosts from consul

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-consul'

And then execute:

    $ bundle

## Usage
```ruby
    # config/deploy/<development|stage|prod>.rb
    set :consul_url, 'http://192.168.22.30:8500'

    set :ssl_options, { ssl: {
                          client_cert:  OpenSSL::X509::Certificate.new(File.read('./cert.pem')),
                          client_key: OpenSSL::PKey::RSA.new(File.read('./key.pem'), '')
                        }
                      }
```

```ruby
    # Capfile or config/deploy.rb
    require 'capistrano-consul'

    # Give "cache" role to hosts publishing memcached service
    service 'memcached', :cache
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
