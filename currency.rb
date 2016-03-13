class Currency

    def initialize(money_string)
        split_money_string = money_string.chars
        symbol = split_money_string.shift
        value = split_money_string.join
        @symbol = symbol
        @value = value.to_f
    end


    def symbol
        @symbol
    end

    def value
        @value
    end

    def is_equal?(other)
        @symbol==other.symbol && value == other.value
    end

    def add(other)
        if @symbol == other.symbol
            @value + other.value
        else
            raise DifferentCurrencyCodeError, "Can't add different currencies"
        end
    end

    def subtract(other)
        if @symbol == other.symbol
            @value - other.value
        else
            raise DifferentCurrencyCodeError, "Can't subtract different currencies"
        end
    end

    def multiply(number)
        Currency.new("#{@symbol}#{@value * number}")
    end
end

class DifferentCurrencyCodeError < StandardError
end
