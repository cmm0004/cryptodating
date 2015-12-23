module Cryptodating
  module PDFHelpers
    X = 1102
    Y = 642
    BUSINESS_CARD_300PPI = [X, Y]

    def self.doit(digits={})
      Prawn::Document.generate "./public/example.pdf", :page_size => BUSINESS_CARD_300PPI do |pdf|

        pdf.image "./public/imgs/pdfimgs/front.jpg", :at => [0, Y-25]
        pdf.font "Helvetica"
        # pdf.draw_text "Hey!", :at => [50,Y-150], :size => 100
        # pdf.draw_text "My Name's", :at => [50,Y-350], :size => 72
        if digits[:name]
          pdf.draw_text "#{digits[:name]}", :at => [50,Y-450], :size => 32
        else
          pdf.stroke do
            pdf.horizontal_line 50, 500, :at => 200
          end
        end



        # pdf.draw_text digits[:area_code].to_s, :at => [800, 120], :size => 32 unless digits[:area_code].nil?

        if digits[:area_code]
          x_diff = 300
          digits[:area_code].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff, Y-100]
            x_diff += 150
          end
        end
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-75]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-75]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-75]

        if digits[:first_three]
          x_diff = 300
          digits[:first_three].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff, Y-275]
            x_diff+=150
          end
        end

        # pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-275]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-275]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-275]

        if digits[:last_four]
          x_diff = 300
          digits[:last_four].reverse_each() do |digit|
            pdf.image "./public/imgs/pdfimgs/#{digit}.jpg", :at => [X-x_diff, Y-450]
            x_diff+=150
          end
        end
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-475]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-475]
        # pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-475]

        pdf.start_new_page

        pdf.image "./public/imgs/pdfimgs/back.jpg", :at => [-25, Y-50]
      end
    end


    private
      # def self.newpdf
      #   Prawn::Document.generate "example.pdf", :page_size => BUSINESS_CARD_300PPI do |pdf|
      #     pdf.font "Helvetica"
      #     pdf.draw_text "hello world", :at => [200,720], :size => 18
      #   end
      # end
  end
end

