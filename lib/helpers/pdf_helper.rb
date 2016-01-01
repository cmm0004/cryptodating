module Cryptodating
  module PDFHelpers
    X = 1102
    Y = 642
    BUSINESS_CARD_300PPI = [X, Y]

    ## 45px on each side for standard bleed
    #string, {}:sym -> nil, side effects: creates file ./public/*.pdf
    def self.render_pdf(name, pdf_params={})
      bleed = pdf_params[:bleed].nil? ? 0 : 90
      Prawn::Document.generate "./public/#{name}.pdf", :page_size => [X + bleed, Y + bleed] do |pdf|

        pdf.image "./public/imgs/pdfimgs/front.jpg", :at => [-25 + ( bleed / 2), Y - 25 + ( bleed / 2 )]

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
            pdf.draw_text "#{pdf_params[:name]}".upcase, :at => [55 + ( bleed / 2), Y - 400 + ( bleed / 2)]
          end
        end


        if pdf_params[:area_code]
          x_diff = 315
          pdf_params[:area_code].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff + ( bleed / 2), Y-100 + ( bleed / 2)]
            x_diff += 150
          end
        end

        if pdf_params[:first_three]
          x_diff = 315
          pdf_params[:first_three].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff + ( bleed / 2), Y-275 + ( bleed / 2)]
            x_diff+=150
          end
        end

        if pdf_params[:last_four]
          x_diff = 315
          pdf_params[:last_four].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff + ( bleed / 2), Y-450 + ( bleed / 2)]
            x_diff+=150
          end
        end
        pdf.start_new_page

        pdf.image "./public/imgs/pdfimgs/back-3.1.jpg", :at => [-25 + ( bleed / 2), Y-40 + ( bleed / 2)]
      end
    end

    def self.define_file params
      params[:area_code] + params[:first_three] + params[:last_four]
    end

    ##45 px on each side for bleed
  end
end

