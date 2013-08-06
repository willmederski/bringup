class PdfController < ApplicationController
	 require 'prawn'
  # 
  # 
def index
  pdf = Prawn::Document.new
  pdf.text "Hello World"
  pdf.render_file File.join(Rails.root, "public/pdfs", "test.pdf")
end
  end