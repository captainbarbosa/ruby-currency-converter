class Convert
    def initialize(hash)
        @rate = hash
    end

    def convert(currency_obj, request_code)
        if @rate.has_key?(request_code)
            result = currency_obj.value/@rate[request_code]
            symbol_hash = {:USD => "$", :EUR => "€" , :YEN => "¥"}
            symbol = symbol_hash[request_code]
            Currency.new("#{symbol}#{result}")
        else
            raise UnknownCurrencyCodeError, "Currency code not found"
        end
    end

    class UnknownCurrencyCodeError < StandardError
    end
end
