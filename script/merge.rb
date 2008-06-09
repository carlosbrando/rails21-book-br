desc 'Merge all chapter files in a temporary full book'

task :merge do
  chapter = ENV['chapter'] || '*'
  File.open('output/book.markdown', 'w+') do |f|
    Dir["text/#{chapter}*/*.markdown"].sort.each do |path|
      f << File.new(path).read + "\r\n"
    end
  end
end
