## Coursera - Getting and Cleaning Data Course

### Overview:

This file explains how the **run_analysis.R** script can be used. You will need:  
  - **R** and **[RStudio]** already installed in your computer, and
  - Connection to the internet, as it may need to download some packages.

### Version:

1.0

### Execution Steps:

1) Open **R**.  
2) Set the working directory to where the code (run_analysis.R) and the data folder is located.

* Use **getwd()** to verify the current working directory.   
* Use **setwd("...")** to set up the current working directory.   

3) In the working directory you should have the following:  
* **UCI HAR Dataset** - Directory  
* **run_analysis.R** - A ".R" script that will be executed to generate the **tidy data**. 

4) Source the code into the **R** environment - **source("run_analysis.R")**.

5) Execute the script - *run_analysis()*. Alternatively you can pass in the locaction of the data folder location; example *run_analysis("/User/name/project/UCI HAR Dataset")  

5) You should see an output similar to the following:  

```
<any warning or other meeeages as packages are being loaded>

[1] "Setting up..."
[1] "Getting test data..."
[1] "Getting train data..."
[1] "Getting label data..."
[1] "Getting subject data..."
[1] "Getting activity data..."
[1] "Getting and cleaning feature names..."
[1] "Binding up the data..."
[1] "Extracting mean and stdev features..."
[1] "Tidying up data..."
[1] "Creating tidy output..."
[1] "Writing tidy data output to <your working directory>/tidyData.txt"

```

5) Now you should have a data frame called **tidyOutput** in your R environment. You can get some summary information using:
```
   dim(tidyOutput)
   str(tidyOutput)
   summary(tidyOutput)
``` 

6) A flatfile in the current working directory called **tidyData.txt** will be created. to load and verify it execute:  

```
   df <- read.table( "tidyData.txt" , header = TRUE , sep = " " )
   dim( df )
   str( df )
   summary( df )
```
###sessionInfo()
R version 3.1.2 (2014-10-31)  
Platform: i386-w64-mingw32/i386 (32-bit)  
  
locale:  
 [1] LC_COLLATE=English_Australia.1252  LC_CTYPE=English_Australia.1252   
 [3] LC_MONETARY=English_Australia.1252 LC_NUMERIC=C                      
 [5] LC_TIME=English_Australia.1252    
  
 attached base packages:  
 [1] stats     graphics  grDevices utils     datasets  methods   base     
  
 loaded via a namespace (and not attached):  
 [1] tools_3.1.2  
