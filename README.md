##A Web API for Genome-Canyon

`format.rb` is a formatter for the data, usage:
```
ruby format.rb FILEPATH CHROM_NUM START_LOC > DEST
```

##Rake Tasks

###Import Data
```
rake data:import_file["FILE_PATH"]
```
imports a well-formatted data file into the Database. It is quite slow and the SQL command
```
LOAD DATA INFILE 'file_path' INTO TABLE genomes (chrom, loc, value);
```
is preferred.





