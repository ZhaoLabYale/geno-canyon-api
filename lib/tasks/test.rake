namespace :test do
  desc "Import File Into DB"
  task import_file: :environment do
  end

  desc "Write a Random Big Data File"
  task create_file: :environment do
    File.open("test.data","w") do |f|
      10.times do |i| 
        f.puts "1\t#{i}\t#{rand}"
      end
    end
  end

end
