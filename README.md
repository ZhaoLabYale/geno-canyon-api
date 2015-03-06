##A Web API for [GenoCanyon](http://genocanyon.med.yale.edu:7772/)


###Formatting Data

`format.rb` is a formatter for the data, usage:

```
ruby format.rb FILEPATH CHROM_NUM START_LOC > DEST
```

It takes a text file with a single floating point value in each line, and labels them with the chromosome number and coordinate specified.

###Import Data

```
rake data:import_file["FILE_PATH"]
```
imports a well-formatted data file into the Database.




