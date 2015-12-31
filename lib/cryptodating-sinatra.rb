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

      Dir.open("./public").each do |filename|
        next if File.directory? filename
          File.delete("./public/#{filename}")
      end
      pdf_name = PDFHelpers::define_file(params)
      new_params = EndpointHelpers::format_post_params(params)
      PDFHelpers::render_pdf(pdf_name, new_params)

      redirect "#{pdf_name}.pdf"
    end

    get '/test/:number' do

      number = params[:number].to_i

      _ = MathHelpers::doit(number)

      status 200

    end

  end
end

