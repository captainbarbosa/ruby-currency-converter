class Currency
    def initialize(money_string)
        money_hash = {"$" => :USD, "€" => :EUR , "¥" => :YEN }  # => {"$"=>:USD, "€"=>:EUR, "¥"=>:YEN}
        split_money_string = money_string.chars                 # => ["$", "5", "0", ".", "0", "5"]
        amount = split_money_string.shift                       # => "$"
        value = split_money_string.join                         # => "50.05"
        @money_string = [amount, value]                         # => ["$", "50.05"]
    end                                                         # => :initialize

    def value
        @money_string  # => ["$", "50.05"]
    end                # => :value
end                    # => :value

currency = Currency.new("$50.05").value  # => ["$", "50.05"]
