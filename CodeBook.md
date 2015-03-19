# Getting and Cleaning Data Course 
## Course Project Code Book

This file describes the details of:  
- what the data for the project consists of  
- step undertaken using the code to clean it and  
- the output and its contents  

In order to run the code you will need:  
- **R** installed in your computer. Although you may need the exact version mentioned in the sessionInfo section in README file, if issues exist installing the same version and packages may be helpful  
- appropriate packages used are shown in the sessionInfo section.  
- Connection to the internet, if you need to download any of the packages.  

### Data:  
The data used in the assessment is downloaded from the course project website. The folder/file structure of the just the files used is shown below.
 
```
UCI HAR Dataset
	README.txt  
	activity_labels.txt  
	features.txt  
	./test:  
		X_test.txt   
		subject_test.txt   
		y_test.txt   
	./train:
		X_train.txt   
		subject_train.txt   
		y_train.txt   
```

Please read the README file among the data files for detailed view on the input data.  

### Processing  

**run_analysis** program performs the following functions:  
- Reads and merges data from training and test data sets into an R data frame from X_train.txt and X_test.txt   
- Reads labels (activity performed by the subject for each observation) and subject data for each observation (row of data) into the data frame from y_train.txt, y_test.txt, subject_train.txt and subject_test.txt  
- Reads names of each feature (column of data) into the data frame from features.txt
- Reads Activity names (what activity does each of the labels mean) into the data frame from activity_labels.txt and adds them into each observation based on the labels
- Extracts only the mean and standard deviation features
- Renames the features with descreptive names
- Creates a new data set with the **mean** of each of the features extracted in the previous steps and writes it to a file called **tidyData.txt**  

#### Naming of features in the output  
The features are renamed using the following steps  
* all words are separated by '.'  
* all words except 'Gyro' and 'Acc' (and others mentioned later) are lower case  
* segments like 'tBody' and 'fBody' are expanded to 'time.body' and 'frequency.body'  
* 'std' for standard deviation is converted to 'stdev'  
* 'X', 'Y' and 'Z' are changed to 'Xaxis', 'Yaxis' and 'Zaxis' respectively  

###Output
The output file **tidyData.txt** contains 180 rows and 88 columns. The output as a data frame is also also stored in the R environment as **tidyOutput**  

Column names in the output file are:  
 [1] "activity.label"                             
 [2] "subject"                                    
 [3] "time.body.Acc.mean.Xaxis"                   
 [4] "time.body.Acc.mean.Yaxis"                   
 [5] "time.body.Acc.mean.Zaxis"                   
 [6] "time.body.Acc.stdev.Xaxis"                  
 [7] "time.body.Acc.stdev.Yaxis"                  
 [8] "time.body.Acc.stdev.Zaxis"                  
 [9] "time.gravity.Acc.mean.Xaxis"                
[10] "time.gravity.Acc.mean.Yaxis"                
[11] "time.gravity.Acc.mean.Zaxis"                
[12] "time.gravity.Acc.stdev.Xaxis"               
[13] "time.gravity.Acc.stdev.Yaxis"               
[14] "time.gravity.Acc.stdev.Zaxis"               
[15] "time.body.Acc.jerk.mean.Xaxis"              
[16] "time.body.Acc.jerk.mean.Yaxis"              
[17] "time.body.Acc.jerk.mean.Zaxis"              
[18] "time.body.Acc.jerk.stdev.Xaxis"             
[19] "time.body.Acc.jerk.stdev.Yaxis"             
[20] "time.body.Acc.jerk.stdev.Zaxis"             
[21] "time.body.Gyro.mean.Xaxis"                  
[22] "time.body.Gyro.mean.Yaxis"                  
[23] "time.body.Gyro.mean.Zaxis"                  
[24] "time.body.Gyro.stdev.Xaxis"                 
[25] "time.body.Gyro.stdev.Yaxis"                 
[26] "time.body.Gyro.stdev.Zaxis"                 
[27] "time.body.Gyro.jerk.mean.Xaxis"             
[28] "time.body.Gyro.jerk.mean.Yaxis"             
[29] "time.body.Gyro.jerk.mean.Zaxis"             
[30] "time.body.Gyro.jerk.stdev.Xaxis"            
[31] "time.body.Gyro.jerk.stdev.Yaxis"            
[32] "time.body.Gyro.jerk.stdev.Zaxis"            
[33] "time.body.Acc.mag.mean"                     
[34] "time.body.Acc.mag.stdev"                    
[35] "time.gravity.Acc.mag.mean"                  
[36] "time.gravity.Acc.mag.stdev"                 
[37] "time.body.Acc.jerk.mag.mean"                
[38] "time.body.Acc.jerk.mag.stdev"               
[39] "time.body.Gyro.mag.mean"                    
[40] "time.body.Gyro.mag.stdev"                   
[41] "time.body.Gyro.jerk.mag.mean"               
[42] "time.body.Gyro.jerk.mag.stdev"              
[43] "frequency.body.Acc.mean.Xaxis"              
[44] "frequency.body.Acc.mean.Yaxis"              
[45] "frequency.body.Acc.mean.Zaxis"              
[46] "frequency.body.Acc.stdev.Xaxis"             
[47] "frequency.body.Acc.stdev.Yaxis"             
[48] "frequency.body.Acc.stdev.Zaxis"             
[49] "frequency.body.Acc.mean.freq.Xaxis"         
[50] "frequency.body.Acc.mean.freq.Yaxis"         
[51] "frequency.body.Acc.mean.freq.Zaxis"         
[52] "frequency.body.Acc.jerk.mean.Xaxis"         
[53] "frequency.body.Acc.jerk.mean.Yaxis"         
[54] "frequency.body.Acc.jerk.mean.Zaxis"         
[55] "frequency.body.Acc.jerk.stdev.Xaxis"        
[56] "frequency.body.Acc.jerk.stdev.Yaxis"        
[57] "frequency.body.Acc.jerk.stdev.Zaxis"        
[58] "frequency.body.Acc.jerk.mean.freq.Xaxis"    
[59] "frequency.body.Acc.jerk.mean.freq.Yaxis"    
[60] "frequency.body.Acc.jerk.mean.freq.Zaxis"    
[61] "frequency.body.Gyro.mean.Xaxis"             
[62] "frequency.body.Gyro.mean.Yaxis"             
[63] "frequency.body.Gyro.mean.Zaxis"             
[64] "frequency.body.Gyro.stdev.Xaxis"            
[65] "frequency.body.Gyro.stdev.Yaxis"            
[66] "frequency.body.Gyro.stdev.Zaxis"            
[67] "frequency.body.Gyro.mean.freq.Xaxis"        
[68] "frequency.body.Gyro.mean.freq.Yaxis"        
[69] "frequency.body.Gyro.mean.freq.Zaxis"        
[70] "frequency.body.Acc.mag.mean"                
[71] "frequency.body.Acc.mag.stdev"               
[72] "frequency.body.Acc.mag.mean.freq"           
[73] "frequency.body.body.Acc.jerk.mag.mean"      
[74] "frequency.body.body.Acc.jerk.mag.stdev"     
[75] "frequency.body.body.Acc.jerk.mag.mean.freq"  
[76] "frequency.body.body.Gyro.mag.mean"          
[77] "frequency.body.body.Gyro.mag.stdev"         
[78] "frequency.body.body.Gyro.mag.mean.freq"     
[79] "frequency.body.body.Gyro.jerk.mag.mean"     
[80] "frequency.body.body.Gyro.jerk.mag.stdev"    
[81] "frequency.body.body.Gyro.jerk.mag.mean.freq"  
[82] "angle.time.body.Acc.mean.gravity"           
[83] "angle.time.body.Acc.jerk.mean.gravity.mean"  
[84] "angle.time.body.Gyro.mean.gravity.mean"     
[85] "angle.time.body.Gyro.jerk.mean.gravity.mean"  
[86] "angle.Xaxis.gravity.mean"                   
[87] "angle.Yaxis.gravity.mean"                   
[88] "angle.Zaxis.gravity.mean"  