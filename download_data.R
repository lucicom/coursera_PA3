
#
# The script will download data from the URL above and unpack it in the data directory, creating this 
# directory if not already existing. If the data is already downloaded, the script will overwrite all 
# files (without any warning).
#
# It will also create a download_data.tstamp file (in data dir) that will record the date and time of 
# the last download.
#


# create a temp file name (eg tempfile())
temp <- tempfile()

# fetch the file into the temp file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

# extract the target file from temp file
unzip(temp, overwrite = TRUE)

# remove the temp file 
unlink(temp)

#
cat("Last download date: ", date(), file = "download_data.tstamp")
