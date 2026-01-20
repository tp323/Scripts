mkdir RAW, JPEG, Videos
Get-ChildItem *.cr3,*.arw,*.nef,*.dng,*.rw2 -File -ErrorAction SilentlyContinue | Move-Item -Destination RAW -Force
Get-ChildItem *.jpg,*.jpeg -File -ErrorAction SilentlyContinue | Move-Item -Destination JPEG -Force
Get-ChildItem *.mp4,*.mov,*.avi,*.mkv -File -ErrorAction SilentlyContinue | Move-Item -Destination Videos -Force
Write-Output "Done!"