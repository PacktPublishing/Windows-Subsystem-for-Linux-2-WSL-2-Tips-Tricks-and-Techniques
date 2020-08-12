param (
    [Parameter(Mandatory=$true)]
    [string]
    $UserName,
    [Parameter(Mandatory=$true)]
    [string]
    $Password,
    [Parameter(Mandatory=$true)]
    [string]
    $ExportTarPath
)
docker build -t image-builder -f Dockerfile --build-arg USERNAME=$UserName --build-arg PASSWORD=$Password  .
docker run --name image-builder-temp image-builder
docker export -o $ExportTarPath image-builder-temp
docker rm image-builder-temp
