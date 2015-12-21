module Cryptodating
  module PDFHelpers
    X = 1102
    Y = 642
    BUSINESS_CARD_300PPI = [X, Y]

    def self.doit(digits={})
      Prawn::Document.generate "./public/example.pdf", :page_size => BUSINESS_CARD_300PPI do |pdf|
        pdf.font "Helvetica"
        pdf.draw_text "hello world", :at => [200,120], :size => 18
        # pdf.draw_text digits[:area_code].to_s, :at => [800, 120], :size => 32 unless digits[:area_code].nil?
        pdf.stroke do
          pdf.vertical_line 0+100, Y-100, :at => X/2
        end
        pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-75]
        pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-75]
        pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-75]

        pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-275]
        pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-275]
        pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-275]

        pdf.image "./public/imgs/150x150.jpg", :at => [X-600, Y-475]
        pdf.image "./public/imgs/150x150.jpg", :at => [X-450, Y-475]
        pdf.image "./public/imgs/150x150.jpg", :at => [X-300, Y-475]


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

