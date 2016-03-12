require_relative './currency.rb'            # => true
require_relative './currency_converter.rb'  # => true
require 'pry'                               # => true

currency = Currency.new("$1.00")  # => #<Currency:0x007fa26aa67840 @symbol="$", @value="50.05">

code = currency.code     # => :USD
amount = currency.value  # => "50.05"

Convert.new(code, amount, :YEN)  # => #<Convert:0x007fa26aa67138 @code=:USD, @amount=50.05, @request=:YEN, @result=5693.970420932878>
