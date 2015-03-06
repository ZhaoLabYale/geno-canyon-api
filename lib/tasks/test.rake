namespace :test do
  desc "Import File Into DB"
  task :import_file, [:filepath] => :environment do |t, args|

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
