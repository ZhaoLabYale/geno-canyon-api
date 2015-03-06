# usage: ruby format.rb FILEPATH CHROM_NUM START_LOC > DEST

require 'ruby-progressbar'

if ARGV.length != 3
  puts "Input Error: Usage: ruby format.rb FILEPATH CHROM_NUM START_LOC > DEST"
else
  path = ARGV.first
  chrom, start = ARGV[1..-1].map(&:to_i)
  nline = `wc -l #{path}`.match(/^\d*/)[0].to_i
  bar = ProgressBar.create format: "%a %e %P% Processed: %c from %C", 
                           total: nline, output: STDERR
  f1 = File.open(path, "r").each_line do |line|
    print "#{chrom}\t#{start}\t#{line}"
    start += 1
    bar.increment
  end
  bar.finish
end



