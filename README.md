# FileUpload
Implementation Of FileUpload Control In Asp.Net
*Fileupload: This implementation uses the FileUpload control in ASP.NET to allow the user to select a file for upload. It checks the file extension of the uploaded file against a list of allowed extensions and checks for double extensions and files without filenames. It generates a random string of letters and digits to rename the uploaded file and saves it to the specified upload directory. It also changes the permissions on the upload folder to prevent uploaded files from being executed.

Note that the  Server.MapPath method is used to get the physical path of the upload folder, and the DirectoryInfo class is used to set the folder attributes for permission changes. Additional checks may need to be added to ensure that other configuration files are not uploaded.

* FileuploadScan: This  implementation includes a new ClamScan class that scans the uploaded file for its file type and for any viruses or other malicious content using the ClamAV antivirus scanner. The ScanFile method scans the specified file and returns true if the file is clean or false if it is infected. If the file is infected, the implementation deletes the file and displays an error message.
