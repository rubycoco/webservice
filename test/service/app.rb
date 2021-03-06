
get '/' do
  "Hello World"
end


get '/hello/:name' do
  "Hello #{params['name']}"
end


## note: /halt/404 must be before /:message/:name !! otherwise no match!!!

get '/halt/404' do
  halt 404  # 404 - not found
end

get '/halt_error' do
  halt 500, "Error fatal"  # 500 - internal server error
end


get '/countries(.:format)?' do
  ## array of hash records
   [ { key: 'at', name: 'Austria' },
     { key: 'mx', name: 'Mexico'  } ]
end



get '/:message/:name' do
  message = params['message']
  name    = params['name']
  "#{message} #{name}"
end

get '/:key(.:format)?' do
  key = params['key']
  fmt = params['format']
  "#{key} #{fmt}"
end
