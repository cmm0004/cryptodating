require 'sinatra'
require './lib/helpers/math_helpers'
require './lib/helpers/pdf_helper'
require "prawn"

module Cryptodating
	class Application < Sinatra::Base
    include MathHelpers
    include PDFHelpers
		set :public_folder, 'public'

#feffff super light
#98dafc blue
#daad86 brown
#312c32 dark brown

		get '/' do
		  erb :landingpage
		end

    post '/' do
      # area_code = params[:area_code]
      # first_three = params[:first_three]
      # last_four = params[:last_four]

      # area_code = params[:area_code].to_i
      params[:area_code] = MathHelpers::doit(params[:area_code])

       # first_three = params[:first_three].to_i
      params[:first_three] = MathHelpers::doit(params[:first_three])

      # last_four = params[:last_four].to_i
      params[:last_four] = MathHelpers::doit(params[:last_four])
      PDFHelpers::doit(params)

      # erb :test, locals: {area_code: area_code, first_three: first_three, last_four: last_four}
      #MathHelpers::doit(area_code)

      redirect 'example.pdf'


    end

    get '/test/:number' do
      number = params[:number].to_i

      _ = MathHelpers::doit(number)

      status 200

    end

    get '/pdf/?' do


      Prawn::Document.generate("./public/hello.pdf") do
        text "Hello World!"
      end

      redirect 'hello.pdf'




    end
  end
end

