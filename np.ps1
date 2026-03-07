param(
    [Parameter(Mandatory, Position=0)]
    [Alias("Name")]
    [string]$name,
    [Parameter(Mandatory, Position=1)]
    [Alias("Description")]
    [string]$description
)
$repoUrl = 'https://github.com/brotherbill/hello_d_windows'
$dest = $name
if (Test-Path $dest) {
    Write-Error "Directory '$dest' already exists."
    exit 1
}
git clone $repoUrl $dest
if (!(Test-Path $dest)) {
    Write-Error "Failed to clone repository."
    exit 1
}
# Replace all references in all files
$files = Get-ChildItem -Path $dest -Recurse -File -Include *.md,*.json,*.d,*.gitignore
foreach ($file in $files) {
    (Get-Content $file.PSPath) -replace 'c00_hello_d_windows', $name | Set-Content $file.PSPath
}
# Update description in dub.json
$dubFile = Join-Path $dest 'dub.json'
if (Test-Path $dubFile) {
    (Get-Content $dubFile) -replace '"description": ".*?"', '"description": "' + $description + '"' | Set-Content $dubFile
}
# Update description in launch.json if present
$launchFile = Join-Path $dest '.vscode/launch.json'
if (Test-Path $launchFile) {
    (Get-Content $launchFile) -replace '"description": ".*?"', '"description": "' + $description + '"' | Set-Content $launchFile
}
Write-Host "Project '$name' created and customized."

# Sample usage:
# np -name my_new_project -description "My new D project for Windows"
