module Cryptodating
  module PDFHelpers
    X = 1102
    Y = 642
    BUSINESS_CARD_300PPI = [X, Y]

    def self.doit(name, pdf_params={})

      Prawn::Document.generate "./public/#{name}.pdf", :page_size => BUSINESS_CARD_300PPI do |pdf|

        pdf.image "./public/imgs/pdfimgs/front.jpg", :at => [-25, Y-25]

        unless pdf_params[:name].nil?
          size = 100
          if (1..5).include? pdf_params[:name].length
            size = 100
          elsif (6..8).include? pdf_params[:name].length
            size = 80
          elsif (9..10).include? pdf_params[:name].length
            size = 70
          end
          pdf.font "./public/fonts/HelveticaNeue-UltraLight.ttf", :size => size do
            pdf.fill_color "878787"
            pdf.draw_text "#{pdf_params[:name]}".upcase, :at => [55, Y-400]
          end
        end


        # pdf.draw_text "Hey!", :at => [50,Y-150], :size => 100
        # pdf.draw_text "My Name's", :at => [50,Y-350], :size => 72

        # pdf.draw_text pdf_params[:area_code].to_s, :at => [800, 120], :size => 32 unless pdf_params[:area_code].nil?

        if pdf_params[:area_code]
          x_diff = 315
          pdf_params[:area_code].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff, Y-100]
            x_diff += 150
          end
        end
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-75]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-75]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-75]

        if pdf_params[:first_three]
          x_diff = 315
          pdf_params[:first_three].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff, Y-275]
            x_diff+=150
          end
        end

        # pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-275]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-275]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-275]

        if pdf_params[:last_four]
          x_diff = 315
          pdf_params[:last_four].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff, Y-450]
            x_diff+=150
          end
        end
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-475]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-475]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-475]

        pdf.start_new_page

        pdf.image "./public/imgs/pdfimgs/back-3.1.jpg", :at => [-25, Y-50]
      end
    end
  end
end

