class Currency
    def initialize(money_string)
        split_money_string = money_string.chars
        symbol = split_money_string.shift
        value = split_money_string.join
        @symbol = symbol
        @value = value
    end

    def code
        money_hash = {"$" => :USD, "€" => :EUR , "¥" => :YEN }
        @code = money_hash[@symbol]
    end

    def symbol
        @symbol
    end

    def value
        @value
    end

    def add(other)
        if @symbol == other.symbol
            Currency.new(@value + other.value)
        else
            false
        end
    end
end
