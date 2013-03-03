# BigPanda

[![Build Status](https://travis-ci.org/gregory-m/big-panda.png?branch=master)](https://travis-ci.org/gregory-m/big-panda) [![Dependency Status](https://gemnasium.com/gregory-m/big-panda.png)](https://gemnasium.com/gregory-m/big-panda)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'big-panda'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install big-panda

## Usage

### Simple Usage:

```ruby
require 'big_panda'

panda = BigPanda::Client.new(access_token: 'my-access-token')
# => #<BigPanda::Client:0x007f8a39a07038 @target_url="https://api.bigpanda.io", @access_token="my-access-token">

panda.start_deployment({ component: 'html-editor', version: '123' })
# => {"status"=>"created", "id"=>"513382af21e4d3fc5800d01a"}

panda.finish_deployment({ component: 'html-editor', version: '123' })
# => {"status"=>"created", "id"=>"5133831091ad50246f00f089"}
```

### Advanced Usage:

```ruby
require 'big_panda'

panda = BigPanda::Client.new(access_token: 'my-access-token')
# => #<BigPanda::Client:0x007f8a39a07038 @target_url="https://api.bigpanda.io", @access_token="my-access-token">

panda.start_deployment({ component: 'html-editor', version: '123',
                         timestamp: Time.now.to_i, description: 'Deploying new version',
                         owner: 'Gregory Man', env: 'Production', source: 'chef',
                         hosts: ['a1.wix.com', 'a2.wix.com']
                       })
# => {"status"=>"created", "id"=>"51338369b4a7ea843100ceb3"}


panda.finish_deployment({ component: 'html-editor', version: '123',
                          timestamp: Time.now.to_i, status: 'failure', errorMessage: 'Ooops',
                          hosts: ['a1.wix.com', 'a2.wix.com']
                        })
# => {"status"=>"created", "id"=>"513383e021e4d3fc5800d02d"}
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
