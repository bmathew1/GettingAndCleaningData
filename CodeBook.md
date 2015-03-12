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
UCI HAR Dataset
	README.txt  
	activity_labels.txt
	features.txt
	features_info.txt  
	./test:  
		Inertial Signals  
		X_test.txt
		subject_test.txt
		y_test.txt

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


