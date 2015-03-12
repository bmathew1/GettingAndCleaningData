# Coursera - Getting and Cleaning Data Course 
## Course Project Code Book

This file describes the details of:  
- what the data for the project consists of  
- step undertaken using the code to clean it and  
- the output and its contents  

In order to run the code you may need:  
- **R** installed in your computer. Although you may need the exact version mentioned in the sessionInfo section in README file, if issues exist installing the same version may be helpful  
- appropriate packages shown in the sessionInfo section.  
- Connection to the internet, if you need to download any of the packages.  


### Data:  
The data used in the assessment is downloaded from the course project website. The file structure of the downloaded data is shown below.  
 
```
**UCI HAR Dataset**  
	README.txt  
	**activity_labels.txt**  
	**features.txt**  
	features_info.txt  
	./test:  
		Inertial Signals  
		**X_test.txt**  
		**subject_test.txt**  
		**y_test.txt**  

		./test/Inertial Signals:  
			body_acc_x_test.txt  
			body_acc_y_test.txt  
			body_acc_z_test.txt  
			body_gyro_x_test.txt  
			body_gyro_y_test.txt  
			body_gyro_z_test.txt  
			total_acc_x_test.txt  
			total_acc_y_test.txt  
			total_acc_z_test.txt  
	./train:  
		Inertial Signals  
		**X_train.txt**
		**subject_train.txt**
		**y_train.txt**
		./train/Inertial Signals:
			body_acc_x_train.txt
			body_acc_y_train.txt
			body_acc_z_train.txt
			body_gyro_x_train.txt
			body_gyro_y_train.txt
			body_gyro_z_train.txt
			total_acc_x_train.txt
			total_acc_y_train.txt
			total_acc_z_train.txt
```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz.  
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using
another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

The data sources used in this work originated from:

* [Human Activity Recognition Using Smartphones]

and can be downloaded at:

* <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

### The Data Sources Structure:

Directory Name         | File Name           |  File Description                | #Rows | #Columns
-----------------------|---------------------|----------------------------------|-------|----------|
UCI HAR Dataset/       | activity_labels.txt | **Activity** labels file             |     6 |   2
UCI HAR Dataset/       | features.txt        | **Features** file                    |   561 |   2
UCI HAR Dataset/test/  | subject_test.txt    | test **Subject** file                |  2947 |   1
UCI HAR Dataset/train/ | subject_train.txt   | train **Subject** file               |  7352 |   1
UCI HAR Dataset/test/  | X_test.txt          | test data **Measurements** set file  |  2947 | 561
UCI HAR Dataset/train/ | X_train.txt         | train data **Measurements** set file |  7352 | 561
UCI HAR Dataset/test/  | y_test.txt          | test **Label** activity file         |  2947 |   1
UCI HAR Dataset/train/ | y_train.txt         | train **Label** activity file        |  7352 |   1

### The Perfomed Transformations:

The **run_analysis.R** script performs all the necessary data transformations from **raw data** to **tidy data**.  
The following are the general steps executed by the mentioned script:

1) Get and Clean the **Subject** data into a data frame.
* Reads **"test/subject_test.txt"**.
* Reads **"train/subject_train.txt"**.
* Creates a data frame with both **test** and **train** appended.
* Result is returned as a data frame.  

2) Get and Clean the **Label** data into a data frame.
* Reads **"test/y_test.txt"**.
* Reads **"train/y_train.txt"**.
* Reads **"activity_labels.txt"**.
* Creates a data frame with both **test** and **train** appended.
* Creates a new column **ActivityName** via decoding **Activity Number**
* Result is returned as a data frame.  

3) Get and Clean the **Measurement** data into a data frame.
* Reads **"test/X_test.txt"**.
* Reads **"train/X_train.txt"**.
* Reads **"features.txt"** and normalizes its content.
* Creates a data frame with both **test** and **train** appended.
* Rename all the columns in the previous data frame.
* Create a new data frame with only the **mean** and **standard deviation** columns.
* Result is returned as a data frame.  

4) Join in one data frame **subject**, **label** and **measure** data frames, removing unnecessary columns and calculate the **mean**.

5) Write the contents of the final data frame **tidy.df**, into the filesystem file **tidyData.txt**.

6) Housekeepping the environment, removing all leftover of the previous operations, leaving only **tidy.df** in the current session.

*Note:* use the commands below if you want to read the output file generated by the last step

```
        df <- read.table( "tidyData.txt" , header = TRUE , sep = " " )
        dim( df )
        str( df )
        summary( df )
``` 

### Data Structure of the Output file:

File Name         | Number of Columns | Number of Rows 
------------------|-------------------|----------------
tidyData.txt      |                88 |            180 

All these variables had their **mean** calculated per **subject** and per **activity** in order to generate this output.


Column Index | Name Index | Meaning
-------------|------------|---------
 [1]  | "ActivityName" | Name of the **Activity** performed during the measurement such as: **Walking**, **Walking upstairs**, **Walking downstairs**, **Sitting**, **Standing** or **Laying**.
 [2]  | "SubjectCode" | Code number of the **Subject** who the measurements belong to.
 [3]  | "Time.BodyAcc.Mean.X" | Average of Time of **BodyAcc** on X axis
 [4]  | "Time.BodyAcc.Mean.Y" | Average of Time of **BodyAcc** on Y axis
 [5]  | "Time.BodyAcc.Mean.Z" | Average of Time of **BodyAcc** on Z axis
 [6]  | "Time.GravityAcc.Mean.X" | Average of Time of **GravityAcc** on X axis
 [7]  | "Time.GravityAcc.Mean.Y" | Average of Time of **GravityAcc** on Y axis
 [8]  | "Time.GravityAcc.Mean.Z" | Average of Time of **GravityAcc** on Z axis
 [9]  | "Time.BodyAccJerk.Mean.X" | Average of Time of **BodyAccJerk** on X axis
[10]  | "Time.BodyAccJerk.Mean.Y" | Average of Time of **BodyAccJerk** on Y axis
[11]  | "Time.BodyAccJerk.Mean.Z" | Average of Time of **BodyAccJerk** on Z axis
[12]  | "Time.BodyGyro.Mean.X" | Average of Time of **BodyGyro** on X axis
[13]  | "Time.BodyGyro.Mean.Y" | Average of Time of **BodyGyro** on Y axis
[14]  | "Time.BodyGyro.Mean.Z" | Average of Time of **BodyGyro** on Z axis
[15]  | "Time.BodyGyroJerk.Mean.X" | Average of Time of **BodyGyroJerk** on X axis
[16]  | "Time.BodyGyroJerk.Mean.Y" | Average of Time of **BodyGyroJerk** on Y axis
[17]  | "Time.BodyGyroJerk.Mean.Z" | Average of Time of **BodyGyroJerk** on Z axis
[18]  | "Time.BodyAccMag.Mean" | Average of Time of **BodyAccMag**
[19]  | "Time.GravityAccMag.Mean" | Average of Time of **GravityAccMag**
[20]  | "Time.BodyAccJerkMag.Mean" | Average of Time of **BodyAccJerkMag**
[21]  | "Time.BodyGyroMag.Mean" | Average of Time of **BodyGyroMag**
[22]  | "Time.BodyGyroJerkMag.Mean" | Average of Time of **BodyGyroJerkMag**
[23]  | "Freq.BodyAcc.Mean.X" | Average of Frequence of **BodyAcc** on X axis
[24]  | "Freq.BodyAcc.Mean.Y" | Average of Frequence of **BodyAcc** on Y axis
[25]  | "Freq.BodyAcc.Mean.Z" | Average of Frequence of **BodyAcc** on Z axis
[26]  | "Freq.BodyAcc.Mean.Freq.X" | Average of Frequence of **BodyAcc** on X axis
[27]  | "Freq.BodyAcc.Mean.Freq.Y" | Average of Frequence of **BodyAcc** on Y axis
[28]  | "Freq.BodyAcc.Mean.Freq.Z" | Average of Frequence of **BodyAcc** on Z axis
[29]  | "Freq.BodyAccJerk.Mean.X" | Average of Frequence of **BodyAccJerk** on X axis
[30]  | "Freq.BodyAccJerk.Mean.Y" | Average of Frequence of **BodyAccJerk** on Y axis
[31]  | "Freq.BodyAccJerk.Mean.Z" | Average of Frequence of **BodyAccJerk** on Z axis
[32]  | "Freq.BodyAccJerk.Mean.Freq.X" | Average of Frequence of **BodyAccJerk** on X axis
[33]  | "Freq.BodyAccJerk.Mean.Freq.Y" | Average of Frequence of **BodyAccJerk** on Y axis
[34]  | "Freq.BodyAccJerk.Mean.Freq.Z" | Average of Frequence of **BodyAccJerk** on Z axis
[35]  | "Freq.BodyGyro.Mean.X" | Average of Frequence of **BodyGyro** on X axis
[36]  | "Freq.BodyGyro.Mean.Y" | Average of Frequence of **BodyGyro** on Y axis
[37]  | "Freq.BodyGyro.Mean.Z" | Average of Frequence of **BodyGyro** on Z axis
[38]  | "Freq.BodyGyro.Mean.Freq.X" | Average of Frequence of **BodyGyro** on X axis
[39]  | "Freq.BodyGyro.Mean.Freq.Y" | Average of Frequence of **BodyGyro** on Y axis
[40]  | "Freq.BodyGyro.Mean.Freq.Z" | Average of Frequence of **BodyGyro** on Z axis
[41]  | "Freq.BodyAccMag.Mean" | Average of Frequence of **BodyAccMag**
[42]  | "Freq.BodyAccMag.Mean.Freq" | Average of Frequence of **BodyAccMag**
[43]  | "Freq.BodyBodyAccJerkMag.Mean" | Average of Frequence of **BodyBodyAccJerkMag**
[44]  | "Freq.BodyBodyAccJerkMag.Mean.Freq" | Average of Frequence of **BodyBodyAccJerkMag**
[45]  | "Freq.BodyBodyGyroMag.Mean" | Average of Frequence of **BodyBodyGyroMag**
[46]  | "Freq.BodyBodyGyroMag.Mean.Freq" | Average of Frequence of **BodyBodyGyroMag**
[47]  | "Freq.BodyBodyGyroJerkMag.Mean" | Average of Frequence of **BodyBodyGyroJerkMag**
[48]  | "Freq.BodyBodyGyroJerkMag.Mean.Freq" | Average of Frequence of **BodyBodyGyroJerkMag**
[49]  | "Angle.TimeBodyAcc.Mean.Gravity" | Average of the Time of **BodyAcc** of the angle gravity
[50]  | "Angle.TimeBodyAccJerk.Mean.Gravity.Mean" | Average of the Time of **BodyAccJerkMean** of the angle **Gravity**
[51]  | "Angle.TimeBodyGyro.Mean.Gravity.Mean" | Average of the Time of **BodyGyroMean** of the angle **Gravity**
[52]  | "Angle.TimeBodyGyroJerk.Mean.Gravity.Mean" | Average of the Time of **BodyGyroJerkMean** of the angle **Gravity**
[53]  | "Angle.X.Gravity.Mean" | Average of the angle **Gravity** on axis X
[54]  | "Angle.Y.Gravity.Mean" | Average of the angle **Gravity** on axis Y
[55]  | "Angle.Z.Gravity.Mean" | Average of the angle **Gravity** on axis Z
[56]  | "Time.BodyAcc.Std.X" | Standard Deviation of Time of **BodyAcc** on X axis
[57]  | "Time.BodyAcc.Std.Y" | Standard Deviation of Time of **BodyAcc** on Y axis
[58]  | "Time.BodyAcc.Std.Z" | Standard Deviation of Time of **BodyAcc** on Z axis
[59]  | "Time.GravityAcc.Std.X" | Standard Deviation of Time of **GravityAcc** on X axis
[60]  | "Time.GravityAcc.Std.Y" | Standard Deviation of Time of **GravityAcc** on Y axis
[61]  | "Time.GravityAcc.Std.Z" | Standard Deviation of Time of **GravityAcc** on Z axis
[62]  | "Time.BodyAccJerk.Std.X" | Standard Deviation of Time of **BodyAccJerk** on X axis
[63]  | "Time.BodyAccJerk.Std.Y" | Standard Deviation of Time of **BodyAccJerk** on Y axis
[64]  | "Time.BodyAccJerk.Std.Z" | Standard Deviation of Time of **BodyAccJerk** on Z axis
[65]  | "Time.BodyGyro.Std.X" | Standard Deviation of Time of **BodyGyro** on X axis
[66]  | "Time.BodyGyro.Std.Y" | Standard Deviation of Time of **BodyGyro** on Y axis
[67]  | "Time.BodyGyro.Std.Z" | Standard Deviation of Time of **BodyGyro** on Z axis
[68]  | "Time.BodyGyroJerk.Std.X" | Standard Deviation of Time of **BodyGyroJerk** on X axis
[69]  | "Time.BodyGyroJerk.Std.Y" | Standard Deviation of Time of **BodyGyroJerk** on Y axis
[70]  | "Time.BodyGyroJerk.Std.Z" | Standard Deviation of Time of **BodyGyroJerk** on Z axis
[71]  | "Time.BodyAccMag.Std" | Standard Deviation of Time of **BodyAccMag**
[72]  | "Time.GravityAccMag.Std" | Standard Deviation of Time of **GravityAccMag** 
[73]  | "Time.BodyAccJerkMag.Std" | Standard Deviation of Time of **BodyAccJerkMag**
[74]  | "Time.BodyGyroMag.Std" | Standard Deviation of Time of **BodyGyroMag**
[75]  | "Time.BodyGyroJerkMag.Std" | Standard Deviation of Time of **BodyGyroJerkMag**
[76]  | "Freq.BodyAcc.Std.X" | Standard Deviation of Frequence of **BodyAcc** on X axis
[77]  | "Freq.BodyAcc.Std.Y" | Standard Deviation of Frequence of **BodyAcc** on Y axis
[78]  | "Freq.BodyAcc.Std.Z" | Standard Deviation of Frequence of **BodyAcc** on Z axis
[79]  | "Freq.BodyAccJerk.Std.X" | Standard Deviation of Frequence of **BodyAccJerk** on X axis
[80]  | "Freq.BodyAccJerk.Std.Y" | Standard Deviation of Frequence of **BodyAccJerk** on Y axis
[81]  | "Freq.BodyAccJerk.Std.Z" | Standard Deviation of Frequence of **BodyAccJerk** on Z axis
[82]  | "Freq.BodyGyro.Std.X" | Standard Deviation of Frequence of **BodyGyro** on X axis
[83]  | "Freq.BodyGyro.Std.Y" | Standard Deviation of Frequence of **BodyGyro** on Y axis
[84]  | "Freq.BodyGyro.Std.Z" | Standard Deviation of Frequence of **BodyGyro** on Z axis
[85]  | "Freq.BodyAccMag.Std" | Standard Deviation of Frequence of **BodyAccMag**
[86]  | "Freq.BodyBodyAccJerkMag.Std" | Standard Deviation of Frequence of **BodyBodyAccJerkMag**
[87]  | "Freq.BodyBodyGyroMag.Std" | Standard Deviation of Frequence of **BodyBodyGyroMag**
[88]  | "Freq.BodyBodyGyroJerkMag.Std" | Standard Deviation of Frequence of **BodyBodyGyroJerkMag**


[R]:http://www.r-project.org/
[RStudio]:http://www.rstudio.com/
[dplyr]:http://cran.r-project.org/web/packages/dplyr/index.html
[Human Activity Recognition Using Smartphones]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
