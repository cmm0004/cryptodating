module Cryptodating
  BASE = 25
  module MathHelpers

    #String -> []int
    def self.convert_base string
      array_of_number = []
      leading_zeros = count_leading_zeros string
      until leading_zeros == 0
        array_of_number.push('_')
        leading_zeros -= 1
      end
      number = string.to_i
      digit = determine_digits(number)
      until digit < 0
        base25numb = number / (BASE ** digit)
        array_of_number.push(base25numb)
        number -= (base25numb * (BASE ** digit))
        digit -= 1
      end
      array_of_number

    end

    private

      #int -> int
      def self.determine_digits(number)
        digit = 0
        remainder = -1
        until number == remainder
          remainder = number % (BASE ** digit)
          digit += 1
        end
        return (digit - 2)
      end

      #string -> bool
      def self.leading_zero?(string)
        if string[0] == '0'
          return true
        end

        false
      end

      #string => int
      def self.count_leading_zeros string
        leading_zeros = 0
        until string[0] != '0'
            leading_zeros += 1
            string = string[1..-1]
        end
        leading_zeros
      end
  end
end