require_relative './currency.rb'            # => true
require_relative './currency_converter.rb'  # => true
require 'pry'                               # => true

currency = Currency.new("$50.05").value  # => ["$", "50.05"]

symbol = currency[0]  # => "$"
amount = currency[1]  # => "50.05"
