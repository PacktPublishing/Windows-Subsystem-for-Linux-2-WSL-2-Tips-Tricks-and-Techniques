# Working with JSON

## jq

This section contains examples of working with [jq](https://stedolan.github.io/jq/download/) using the sample `wsl-book.json` file.

```bash
# Formatting JSON
echo '[1,2,"testing"]' | jq

# Extracting names
cat ./wsl-book.json | jq ".parts[].name"

# Extracting the title
cat ./wsl-book.json | jq ".title"

# Extracting the parts array
cat ./wsl-book.json | jq ".parts"

# Extracting the name of the first part
cat ./wsl-book.json | jq ".parts[0].name"

# Extracting the name of all parts
$ cat ./wsl-book.json | jq ".parts[].name"

# Extracting the name of all parts as an array
$ cat ./wsl-book.json | jq "[.parts[].name]"

# Extracting part names as JSON objects
cat ./wsl-book.json | jq '.parts[] | {name}'

# Extracting part name and chapter counts
cat ./wsl-book.json | jq '.parts[] | {name: .name, chapter_count: .chapters | length}'

# Extracting part name and chapter titles
cat ./wsl-book.json | jq '[.parts[] | {name: .name, chapters: [.chapters[] | .title]}]'
```

## PowerShell

This section contains examples of working with [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7) using the sample `wsl-book.json` file.

```powershell
# Get the content as PowerShell Objects
Get-Content ./wsl-book.json | ConvertFrom-Json

# Get the title
Get-Content ./wsl-book.json | ConvertFrom-Json | Select-Object -ExpandProperty title

# Save the converted content in a PowerShell variable
$data = Get-Content ./wsl-book.json | ConvertFrom-Json
$data.title

# Get the name of all parts
$data.parts | Select-Object -ExpandProperty name

# Get the name of all parts as a JSON array
$data.parts | select -ExpandProperty name | ConvertTo-Json

# Get the name of all parts as JSON objects
$data.parts | ForEach-Object { @{ "Name" = $_.name } } | ConvertTo-Json

# Get the part name and chapter count
$data.parts | ForEach-Object { @{ "Name" = $_.name; "ChapterCount"=$_.chapters.Count } } | ConvertTo-Json

# Get the part name and chapter titles
$data.parts | ForEach-Object { @{ "Name" = $_.name; "Chapters"=$_.chapters | Select-Object -ExpandProperty title } } | ConvertTo-Json

# Load via HTTP using Invoke-WebRequest
$SAMPLE_URL=https://raw.githubusercontent.com/PacktPublishing/WSL-2-Tips-Tricks-and-Techniques/main/chapter-11/02-working-with-json/wsl-book.json
Invoke-WebRequest $SAMPLE_URL

# Load via HTTP and convert from JSON (using `iwr` as shorthand for Invoke-WebRequest)
(iwr $SAMPLE_URL).Content | ConvertFrom-Json

# Load the JSON via HTTP using Invoke-RestMethod
Invoke-RestMethod $SAMPLE_URL
```