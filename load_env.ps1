# This script loads environment variables from a .env file into the current PowerShell session
# Usage: .\load_env.ps1 path\to\.env

# Accept the path to the .env file as a parameter
param([String]$env_file) 

# Read the .env file line by line
Get-Content $env_file | foreach {
  # Split each line into name and value at the first '=' character
  $name, $value = $_ -split '=', 2
  
  # Skip empty lines and comment lines (starting with #)
  if ([string]::IsNullOrWhiteSpace($name) -or $name.Contains('#')) {
    continue
  }
  
  # Output what's being set for visibility
  Write-Output "Setting $name=$value"
  
  # Set the environment variable in the current session
  Set-Content env:\$name $value
}
