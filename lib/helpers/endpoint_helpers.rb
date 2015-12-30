require './lib/helpers/math_helpers'


module Cryptodating

  module EndpointHelpers
    include MathHelpers

    def self.format_post_params params
      params[:name] = enforce_name_length params[:name]
      params[:area_code] = MathHelpers::doit(params[:area_code])
      params[:first_three] = MathHelpers::doit(params[:first_three])
      params[:last_four] = MathHelpers::doit(params[:last_four])

      return params
    end

    def self.enforce_name_length name
      name[0..10]
    end
  end
end

