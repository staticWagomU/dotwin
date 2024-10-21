param(
    [string]$xlsmRelativePath
)


$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 相対パスを絶対パスに変換
$xlsmPath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($scriptDir, $xlsmRelativePath))

if ([System.IO.Path]::GetExtension($xlsmPath).ToLower() -ne ".xlsm") {
    Write-Host "エラー: 指定されたファイルは .xlsm ファイルではありません。"
    exit
}

function Get-VBComponentTypeExtension {
    param(
        [int]$Type
    )

    switch ($Type) {
        1 { return "bas" }
        2 { return "cls" }
        3 { return "frm" }
        default { return "unk" }
    }
}

try {
    $xl = New-Object -ComObject Excel.Application
    $xl.Visible = $false
    $xl.DisplayAlerts = $false

    $wb = $xl.Workbooks.Open($xlsmPath)
    
    $wb.VBProject.VBComponents | ForEach-Object {
        $extension = Get-VBComponentTypeExtension $_.Type
        if ($extension -ne "unk") {
            $path = Join-Path (Split-Path $xlsmPath) "src" "$($_.Name).$extension"
            Write-Host "エクスポート中: $path"
            $_.Export($path)
        }
    }
}
catch {
    Write-Host "エラーが発生しました: $_"
}
finally {
    if ($wb) {
        $wb.Close($false)
    }
    if ($xl) {
        $xl.Quit()
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl) | Out-Null
    }
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
}
