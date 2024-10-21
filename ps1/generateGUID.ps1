$num = 64
$outputFile = "$env:USERPROFILE/Desktop/guids.txt"

# GUIDを生成してファイルに書き出す
for ($i = 1; $i -le $num; $i++) {
    [guid]::NewGuid().ToString().ToUpper() | Out-File -Append -FilePath $outputFile
}
