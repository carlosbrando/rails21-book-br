desc 'Generates the PDF file from the book\' HTML'

task :pdf => :html do
  prince = Prince.new
  prince.add_style_sheets 'layout/second.css', 'layout/mac_classic.css'
  
  
  File.open("output/book#{ENV['chapter']}.pdf", 'w') do |f|
    f.puts prince.pdf_from_string(File.new("output/book.html").read)
  end
end