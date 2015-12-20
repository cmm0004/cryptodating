module Cryptodating
  BASE = 25
  module MathHelpers

    def self.doit number
      array_of_number = []
      digit = determine_digits(number)
      until digit < 0
        base25numb = number / (BASE ** digit)
        array_of_number.push(base25numb)
        number -= (base25numb * (BASE ** digit))
        digit -= 1
      end
      puts "#{array_of_number.inspect}"
      array_of_number

    end

    private

      def self.determine_digits(number)
        digit = 0
        remainder = -1
        until number == remainder
          remainder = number % (BASE ** digit)
          digit += 1
        end
        return (digit - 2)
      end
  end
end