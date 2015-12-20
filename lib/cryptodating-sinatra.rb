require 'sinatra'
require './lib/helpers/math_helpers'

module Cryptodating
	class Application < Sinatra::Base
    include MathHelpers
		set :public_folder, 'public'

#feffff super light
#98dafc blue
#daad86 brown
#312c32 dark brown

		get '/' do
		  erb :landingpage
		end

    post '/' do
      area_code = params[:area_code]
      first_three = params[:first_three]
      last_four = params[:last_four]

      MathHelpers::doit(area_code)


    end

    get '/test/:number' do
      number = params[:number].to_i

      _ = MathHelpers::doit(number)

      status 200

    end
  end
end

