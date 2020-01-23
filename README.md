# Padron

Gem to interact with ws_sr_padron_a4 web service from A.F.I.P. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'padron'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install padron

## Usage
Given a document type D.N.I. (length = 8) the get_data method will return all public info about the two posible persons for the given ID.
ex:
    Padron::Call.new(id: "36864268").get_data 
will return public info about document "20368642682" and "27368642687".

This's because a given D.N.I can be duplicated, for that reason the gem will build the two possible CUIL/CUIT for that DNI and will return the info.

The response has the following structure for each person returned:
    if the person wasn't registered in AFIP:
        {name: ..., cuit: ...}
    if the person was registered in AFIP:
        {name: ..., cuit: ..., cp: ..., address: ..., city_id: ..., city: ..., locality: ...}


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FacundoDiaMartinez/padron.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
