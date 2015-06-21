# tidy-data-set

The main directory contains data, script and documentation files for the tidy data set project. The script file run_analysis.R contains detailed comments as well to help guide through the structure of the program.
The main parts of the script are:

- Preparation - here the appropriate libraries are loaded.
- Step 1 - load data from physical file and combine them into a single data structure
- Step 2 (combined with Step 4) - in this case combined with step 4. The columns that contain mean and std are extracted and column names are given.
- Step 3 - activity codes in the data table are replaced with activity labels/descriptions.
- Step 4 - (see Step 2 above) has been combined with Step 2.
- Step 5 - tidy data set is created from data table in Step 4.
- tidy_data_set.txt - file is created with the tidy data from Step 5.
- Clean Up - the environment variables created and used during the program are removed.




