require_relative './currency.rb'            # => true
require_relative './currency_converter.rb'  # => true
require 'pry'                               # => true

currency = Currency.new("$1.00")  # => #<Currency:0x007fad29aafa68 @symbol="$", @value="1.00">

code = currency.code     # => :USD
amount = currency.value  # => "1.00"

# WORKING CURRENCY CONVERSION!
Convert.new(code, amount, :YEN)  # => #<Convert:0x007fad29aaf388 @code=:USD, @amount=1.0, @request=:YEN, @result=113.76564277588169>


# ----- Currency Object Tests: -----
# Equals another Currency object with the same amount and currency code
Currency.new("$5.00") == Currency.new("$5.00")  # => false

# Does not equal another Currency object with different amount or currency code
Currency.new("$5.00") == Currency.new("€5.00")  # => false

c1 = Currency.new("$0.99")  # => #<Currency:0x007fad29aadfb0 @symbol="$", @value="0.99">
c2 = Currency.new("$0.01")  # => #<Currency:0x007fad29aada10 @symbol="$", @value="0.01">

# Like currencies can be added, regardless of value
c1.add(c2)  # => #<Currency:0x007fad29aad4c0 @symbol="0", @value=".990.01">

# Like currencies can be subtracted, regardless of value
