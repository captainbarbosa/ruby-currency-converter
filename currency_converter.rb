class Convert
    def initialize(code, amount, request)
        @code = code
        @amount = amount.to_f
        @request = request
        rate = {:USD => 1, :EUR => 1.11903, :YEN => 0.00879}
        @result = @amount/rate[@request]
    end

    def result
        @result
    end
end
