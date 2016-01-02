require './lib/helpers/math_helpers'

module Cryptodating

  module EndpointHelpers
    include MathHelpers

    #{}:sym -> {}:sym
    def self.format_post_params params
      params[:name] = enforce_name_length(params[:name])
      params[:area_code] = MathHelpers::convert_base(params[:area_code])
      params[:first_three] = MathHelpers::convert_base(params[:first_three])
      params[:last_four] = MathHelpers::convert_base(params[:last_four])

      return params
    end

    #string -> string
    def self.enforce_name_length name
      name[0..9]
    end

  end
end

