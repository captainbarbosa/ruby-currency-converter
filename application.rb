require_relative './currency.rb'
require_relative './currency_converter.rb'


# ----- Currency Object Tests: -----
# Create new currency objects
c1 = Currency.new("$3.00")   # => #<Currency:0x007fc634880868 @symbol="$", @value=3.0>
c2 = Currency.new("$2.00")   # => #<Currency:0x007fc634880408 @symbol="$", @value=2.0>
c3 = Currency.new("€2.00")   # => #<Currency:0x007fc634880070 @symbol="€", @value=2.0>
c4 = Currency.new("¥10.00")  # => #<Currency:0x007fc63487bd68 @symbol="¥", @value=10.0>
c5 = Currency.new("$3.00")   # => #<Currency:0x007fc63487b890 @symbol="$", @value=3.0>

# Equals another Currency object with the same amount and currency code
c1.is_equal?(c5)  # => true

# Does not equal another Currency object with different amount or currency code
c1.is_equal?(c3)  # => false

# Like currencies can be added, regardless of value
c1.add(c2)  # => 5.0

# Like currencies can be subtracted, regardless of value
c1.subtract(c2)  # => 1.0

# Multiply a currency by a fixed number or float, returning a new currency object
c1.multiply(2.5)  # => #<Currency:0x007fc63487a850 @symbol="$", @value=7.5>

# Raise error if currencies can't be added or subtracted
c3.add(c4)       # ~> DifferentCurrencyCodeError: Can't add different currencies
c3.subtract(c4)  # ~> DifferentCurrencyCodeError: Can't add different currencies

# ----- Currency Converter Tests: -----

# Initialize converter with a hash consisting of {code => rate}
currency_convert = Convert.new({:USD => 1, :EUR => 1.11903, :YEN => 0.00879})  # => #<Convert:0x007fc63487a350 @rate={:USD=>1, :EUR=>1.11903, :YEN=>0.00879}>

# Create new currency object from previous currency object and return a new currency object
c6 = currency_convert.convert(c1, :YEN)  # => #<Currency:0x007fc634879d60 @symbol="¥", @value=341.2969283276451>

# Raise error if currency code not found
c6 = currency_convert.convert(Currency.new("$1.00"), :ISK)  # ~> Convert::UnknownCurrencyCodeError: Currency code not found
