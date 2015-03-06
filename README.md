##A Web API for [GenoCanyon](http://genocanyon.med.yale.edu:7772/)

###Querying Data

As the query can be quite large (~ 1 million coordinates), the API uses POST:

```
POST /genome
```
with a JSON data formatted as follows
```
{
    "chrom": CHROMOSOME_NUMBER,
    "locs":[COORDINATES]
}
```
Each request requries only one chromosome, and the API returns an array of floating-point values corresponding to the coordinates

####Note:

1. COORDINATES are assumed to be ordered
2. The response is ordered in ascending order of the coordinates

###Importing Data

####Formatting:

`format.rb` is a formatter for the data, usage:

```
ruby format.rb FILEPATH CHROM_NUM START_LOC > DEST
```

It takes a text file with a single floating point value in each line, and labels them with the chromosome number and coordinate specified.

####Importing:

```
rake data:import_file["FILE_PATH"]
```
imports a well-formatted data file into the Database.




