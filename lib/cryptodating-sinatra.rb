require 'sinatra'
require './lib/helpers/math_helpers'
require './lib/helpers/pdf_helper'
require './lib/helpers/endpoint_helpers'
require "prawn"

module Cryptodating
	class Application < Sinatra::Base
    include MathHelpers
    include PDFHelpers
    include EndpointHelpers
		set :public_folder, 'public'


		get '/' do
		  erb :landingpage
		end

    post '/' do
      params = EndpointHelpers::format_post_params params
      pdf_name = PDFHelpers::define_file params
      PDFHelpers::render_pdf(pdf_name, params)

      redirect "#{pdf_name}.pdf"
    end

    get '/test/:number' do

      number = params[:number].to_i

      _ = MathHelpers::doit(number)

      status 200

    end

  end
end

