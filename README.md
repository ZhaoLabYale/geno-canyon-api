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

####Formatting Data:

`format.rb` is a formatter for the data, usage:

```
ruby format.rb FILEPATH CHROM_NUM START_LOC > DEST
```

It takes a text file with a single floating point value in each line, and labels them with the chromosome number and coordinate specified.

####Database:
Please do **NOT** use the rake commands to create the Database or do migrations. The Database containing the entire scores for hg19 genome has 3095677412 rows and the default structure used by Rails is very slow. The application uses MySQL with the MyISAM engine on the following structure:

| Field | Type             | Null | Key | Default | Extra |
|-------|------------------|------|-----|---------|-------|
| chrom | tinyint(4)       | NO   | PRI | 0       |       |
| loc   | int(11) unsigned | NO   | PRI | 0       |       |
| value | decimal(21,20)   | YES  |     | NULL    |       |





