# webservice

webservice gem - yet another HTTP JSON API (web service) builder

* home  :: [github.com/rubylibs/webservice](https://github.com/rubylibs/webservice)
* bugs  :: [github.com/rubylibs/webservice/issues](https://github.com/rubylibs/webservice/issues)
* gem   :: [rubygems.org/gems/webservice](https://rubygems.org/gems/webservice)
* rdoc  :: [rubydoc.info/gems/webservice](http://rubydoc.info/gems/webservice)


## Usage

[Dynamic Example](#dynamic-example) •
[Classic Example](#classic-example) •
[Rackup Example](#rackup-example)


### Dynamic Example

You can load services at-runtime from files using `Webservice.load_file`.
Example:

```ruby
# service.rb

get '/' do
  'Hello, world!'
end
```

and

```ruby
# server.rb

require 'webservice'

App = Webservice.load_file( './service.rb' )
App.run!
```

and to run type

```
$ ruby ./server.rb
```


### Classic Example

```ruby
# server.rb

require 'webservice'

class App < Webservice::Base
  get '/' do
    'Hello, world!'
  end
end

App.run!
```
and to run type

```
$ ruby ./server.rb
```


### Rackup Example

Use `config.ru` and `rackup`. Example:

```ruby
# config.ru

require `webservice`

class App < Webservice::Base
  get '/' do
    'Hello, world!'
  end
end

run App
```

and to run type

```
$ rackup      # will (auto-)load config.ru
```

Note: `config.ru` is a shortcut (inline)
version of `Rack::Builder.new do ... end`:

```ruby
# server.rb

require 'webservice'

class App < Webservice::Base
  get '/' do
    'Hello, world!'
  end
end

builder = Rack::Builder.new do
  run App
end

Rack::Server.start builder.to_app
```

and to run type

```
$ ruby ./server.rb
```



## "Real World" Examples

See

[**`beerkit / beer.db.service`**](https://github.com/beerkit/beer.db.service) -
beer.db HTTP JSON API (web service) scripts e.g.

```ruby
get '/beer/(r|rnd|rand|random)' do    # special keys for random beer
  Beer.rnd
end

get '/beer/:key'
  Beer.find_by! key: params[:key]
end

get '/brewery/(r|rnd|rand|random)' do    # special keys for random brewery
  Brewery.rnd
end

get '/brewery/:key'
  Brewery.find_by! key: params[:key]
end
```

[**`worlddb / world.db.service`**](https://github.com/worlddb/world.db.service) -
world.db HTTP JSON API (web service) scripts

[**`sportdb / sport.db.service`**](https://github.com/sportdb/sport.db.service) -
sport.db (football.db) HTTP JSON API (web service) scripts



## License

The `webservice` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
