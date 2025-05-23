# 제외할 확장자 목록
$ExcludedExtensions = @("svg", "png", "jpg", "jpeg", "gif", "mp4", "mov", "webp", "ico", "mp3", "wav", "exe", "zip", "tar", "gz")

# 시작 디렉토리 (현재 디렉토리 기준)
$StartDir = Get-Location

$Output = ""

# 현재 디렉토리 기준 모든 파일 검색
Get-ChildItem -Recurse -File | ForEach-Object {
    $File = $_.FullName
    $RelativePath = $File.Replace($StartDir.Path, "").TrimStart('\')
    $Extension = $_.Extension.TrimStart('.').ToLower()

    if ($ExcludedExtensions -contains $Extension) {
        return
    }

    try {
        $Output += "// $RelativePath`r`n"
        $Output += "-----------------------`r`n"
        $Output += Get-Content $File -Raw
        $Output += "`r`n`r`n"
    } catch {
        $Output += "// $RelativePath (읽기 실패)`r`n`r`n"
    }
}

# 클립보드 복사
Set-Clipboard -Value $Output

Write-Host "📋 모든 텍스트 파일 내용이 클립보드에 복사되었습니다!"
