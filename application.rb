require_relative './currency.rb'            # => true
require_relative './currency_converter.rb'  # => true
require 'pry'                               # => true

currency = Currency.new("$1.00")  # => #<Currency:0x007fbca22c0950 @symbol="$", @value=1.0>

code = currency.code     # => :USD
amount = currency.value  # => 1.0

# WORKING CURRENCY CONVERSION!
Convert.new(code, amount, :YEN)  # => #<Convert:0x007fbca22c0220 @code=:USD, @amount=1.0, @request=:YEN, @result=113.76564277588169>


# ----- Currency Object Tests: -----
# Equals another Currency object with the same amount and currency code
Currency.new("$5.00").is_equal?(Currency.new("$5.00"))  # => true

# Does not equal another Currency object with different amount or currency code
Currency.new("$5.00") == Currency.new("€5.00")  # => false

c1 = Currency.new("$3.00")   # => #<Currency:0x007fbca22bb590 @symbol="$", @value=3.0>
c2 = Currency.new("$2.00")   # => #<Currency:0x007fbca22baf28 @symbol="$", @value=2.0>
c3 = Currency.new("€2.00")   # => #<Currency:0x007fbca22ba938 @symbol="€", @value=2.0>
c4 = Currency.new("¥10.00")  # => #<Currency:0x007fbca22ba3e8 @symbol="¥", @value=10.0>

# Like currencies can be added, regardless of value
c1.add(c2)  # => 5.0

# Like currencies can be subtracted, regardless of value
c1.subtract(c2)  # => 1.0

# Raise error if currencies can't be added or subtracted
# c3.add(c4)       # ~> DifferentCurrencyCodeError: Can't add different currencies
# c3.subtract(c4)

# Multiply a currency by a fixed number or float, returning a new currency object
c1.multiply(2)

# ~> DifferentCurrencyCodeError
# ~> Can't add different currencies
# ~>
# ~> /Users/nadiabarbosa/Repos/tiy-currency-converter/currency.rb:35:in `add'
# ~> /Users/nadiabarbosa/Repos/tiy-currency-converter/application.rb:33:in `<main>'
