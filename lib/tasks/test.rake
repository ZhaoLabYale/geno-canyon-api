namespace :data do
  desc "Import File Into DB"
  task :import_file, [:filepath] => :environment do |t, args|
    file_path = args.filepath ? args.filepath : "test.data"
    nline = `wc -l #{file_path}`.match(/^\d*/)[0].to_i
    bar = ProgressBar.create format: "%a %e %P% Processed: %c from %C", 
                             total: nline
    batch = Array.new
    File.open(file_path,"r").each_line do |line|
      data = line.split(/\t/)
      chr = data[0].to_i
      loc = data[1].to_i
      value = BigDecimal.new(data[2])
      batch << Canyon.new(chrom: chr, loc: loc, value: value)
      if batch.length > 500_000
        Canyon.import batch
        batch = Array.new
      end
      bar.increment
    end
    if !batch.empty?
      Canyon.import batch
    end
    bar.finish
  end

  desc "Write a Random Big Data File"
  task :create_file, [:filepath] => :environment do |t, args|
    file_path = args.filepath ? args.filepath : "test.data"
    File.open(file_path,"w") do |f|
      n = 10**6
      bar = ProgressBar.create format: "%a %e %P% Processed: %c from %C", 
                               total: n
      n.times do |i| 
        f.puts "1\t#{i}\t#{rand}"
        bar.increment
      end
      bar.finish
    end
  end
end
