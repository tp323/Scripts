$baseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
# keep only name of song convert from "Band_name - 01 Song_name" to "Song_name"
Get-ChildItem -Path $baseDir -Directory | ForEach-Object {
    $dir = $_

    Get-ChildItem -Path $dir.FullName -Filter *.flac | ForEach-Object {
        $file = $_
        $name = $file.BaseName

        # Remove tudo até ao último " - "
        $name = $name -replace '^.* - ', ''

        # Remove número da faixa no início (ex: "01 ", "02 ")
        $name = $name -replace '^\d+\s+', ''

        $newName = $name + $file.Extension

        if ($newName -ne $file.Name) {
            Rename-Item -Path $file.FullName -NewName $newName
        }
    }
}
