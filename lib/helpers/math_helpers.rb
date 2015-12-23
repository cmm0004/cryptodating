module Cryptodating
  BASE = 25
  module MathHelpers

    def self.doit string

      array_of_number = []
      if leading_zero?(string)
        array_of_number.push(0)
      end
      number = string.to_i
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

      def self.leading_zero?(string)
        if string[0] == '0'
          return true
        end

        false
      end
  end
end