class Currency
    def initialize(money_string)
        split_money_string = money_string.chars
        symbol = split_money_string.shift
        value = split_money_string.join
        @symbol = symbol
        @value = value
    end                                          # => :initialize

    def code
        money_hash = {"$" => :USD, "€" => :EUR , "¥" => :YEN }
        @code = money_hash[@symbol]
    end                                                         # => :symbol

    def value
        @value
    end         # => :value
end             # => :value
