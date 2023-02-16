protected void UploadButton_Click(object sender, EventArgs e)

{

    // Define a list of allowed file extensions

    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".pdf", ".doc", ".docx", ".xls", ".xlsx" };

    // Define the upload directory path

    string uploadFolder = Server.MapPath("~/uploads/");

    // Change permissions on the upload folder to prevent files from being executable

    System.IO.DirectoryInfo folder = new System.IO.DirectoryInfo(uploadFolder);

    folder.Attributes |= System.IO.FileAttributes.Directory | System.IO.FileAttributes.Hidden | System.IO.FileAttributes.System;

    // Check if a file was selected for upload

    if (FileUploadControl.HasFile)

    {

        // Get the file extension of the uploaded file

        string fileExtension = System.IO.Path.GetExtension(FileUploadControl.FileName).ToLower();

        // Check if the file extension is allowed

        if (allowedExtensions.Contains(fileExtension))

        {

            // Check for double extensions and files without filenames

            string[] invalidExtensions = { ".htaccess", ".config" };

            if (invalidExtensions.Contains(fileExtension))

            {

                UploadStatusLabel.Text = "Invalid file type.";

                return;

            }

            // Generate a random string of letters and digits for file renaming

            string randomString = Guid.NewGuid().ToString("N").Substring(0, 10);

            // Rename the uploaded file to prevent it from being executed

            string newFilename = randomString + fileExtension;

            string filePath = uploadFolder + newFilename;

            FileUploadControl.SaveAs(filePath);

            // File uploaded successfully

            UploadStatusLabel.Text = "File uploaded successfully.";

        }

        else

        {

            // Invalid file type

            UploadStatusLabel.Text = "Invalid file type. Only JPG, JPEG, PNG, GIF, PDF, DOC, DOCX, XLS, and XLSX files are allowed.";

        }

    }

    else

    {

        // No file selected for upload

        UploadStatusLabel.Text = "Please select a file to upload.";

    }

}

