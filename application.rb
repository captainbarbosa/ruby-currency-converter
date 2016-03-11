require_relative './currency.rb'            # => true
require_relative './currency_converter.rb'  # => true

currency = Currency.new("$50.05").value  # => ["$", "50.05"]

symbol = currency[0]                                  # => "$"
amount = currency[1]                                  # => "50.05"
rate = {:USD => 1, :EUR => 1.11903, :YEN => 0.00879}  # => {:USD=>1, :EUR=>1.11903, :YEN=>0.00879}

conversion = Convert.new(symbol, amount, rate).value  # => ["$", "50.05", {:USD=>1, :EUR=>1.11903, :YEN=>0.00879}]
