# Prompt the user for a file name
$fileName = Read-Host "Enter the name for the output text file (e.g., folder_list.txt)"

# Get all folders in the current directory
$folders = Get-ChildItem -Directory

# Extract just the folder names
$folderNames = $folders.Name

# Write the folder names to the specified text file
$folderNames | Set-Content -Path $fileName

# Optional: Display a confirmation message
Write-Host "Folder list saved to $fileName"
