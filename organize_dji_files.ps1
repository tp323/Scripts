$baseDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$photosDir = Join-Path $baseDir "Photos"
$videosDir = Join-Path $baseDir "Videos"

New-Item -ItemType Directory -Path $photosDir -Force | Out-Null
New-Item -ItemType Directory -Path $videosDir -Force | Out-Null

# Extensões DJI
$photoExt = @(".JPG",".jpg", ".jpeg", ".dng", ".raw", ".tif", ".tiff")
$videoExt = @(".MP4", ".mp4", ".mov")

Get-ChildItem -Path $baseDir -Recurse -File | Where-Object {
    $_.FullName -notlike "$photosDir*" -and
    $_.FullName -notlike "$videosDir*"
} | ForEach-Object {

    $ext = $_.Extension.ToLower()

    if ($ext -eq ".lrf") {
        Remove-Item $_.FullName -Force
        return
    }

    if ($photoExt -contains $ext) {
        Move-Item $_.FullName $photosDir -Force
        return
    }

    if ($videoExt -contains $ext) {
        Move-Item $_.FullName $videosDir -Force
        return
    }
}
