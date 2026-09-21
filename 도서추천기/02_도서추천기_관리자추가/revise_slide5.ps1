$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$out=Join-Path $PSScriptRoot '교육자료_INTRO'
$src=Join-Path $out 'AI_교학상장_INTRO_1-6.pptx'
$dst=Join-Path $out 'AI_교학상장_INTRO_1-6_5번수정.pptx'
$temp=Join-Path $out '_slide5_edit.pptx'
function RGB($h){return [Convert]::ToInt32($h.Substring(0,2),16)+256*[Convert]::ToInt32($h.Substring(2,2),16)+65536*[Convert]::ToInt32($h.Substring(4,2),16)}
$blue=RGB '005BAC'; $navy=RGB '142E4C'; $muted=RGB '65758A'; $pale=RGB 'EDF4FC'; $white=RGB 'FFFFFF'
$app=New-Object -ComObject PowerPoint.Application
$p=$app.Presentations.Open($src,0,0,0)
$s=$p.Slides.Item(5)
$s.Shapes.Item(3).TextFrame.TextRange.Text='새로운 ChatGPT 데스크톱 앱에서는?'
for($i=12;$i -ge 7;$i--){$s.Shapes.Item($i).Delete()}
function Box($x,$y,$w,$h,$color){$z=$s.Shapes.AddShape(5,$x,$y,$w,$h);$z.Fill.ForeColor.RGB=$color;$z.Line.Visible=0;$z.Adjustments.Item(1)=0.13;return $z}
function Txt($t,$x,$y,$w,$h,$size,$color,$bold=$false,$align=1){
 $z=$s.Shapes.AddTextbox(1,$x,$y,$w,$h);$f=$z.TextFrame
 $f.MarginLeft=0;$f.MarginRight=0;$f.MarginTop=0;$f.MarginBottom=0;$f.WordWrap=-1
 $r=$f.TextRange;$r.Text=$t;$r.Font.Name='맑은 고딕';$r.Font.NameFarEast='맑은 고딕';$r.Font.Size=$size;$r.Font.Color.RGB=$color;$r.Font.Bold=[int]$bold*-1;$r.ParagraphFormat.Alignment=$align
 return $z
}
Box 48 147 864 247 $pale | Out-Null
Txt 'ChatGPT 데스크톱 앱' 70 162 820 32 23 $blue $true 2 | Out-Null
Txt 'PC에서 사용하는 새로운 ChatGPT 작업 환경' 70 197 820 26 15 $muted $false 2 | Out-Null
$names=@('Chat','Work','Codex')
$roles=@('질문하고 대화하기','작업을 맡기기','파일과 도구로 작업하기')
$body=@("익숙한 대화 방식`n질문 · 요약 · 아이디어", "조사·분석 등 여러 단계 작업`n문서 · 스프레드시트 · 발표자료", "자연어 지시 · 로컬 폴더와 파일`n파일 생성·수정 · 웹사이트 제작")
for($i=0;$i -lt 3;$i++){
 $x=64+$i*288
 Box $x 234 256 144 $white | Out-Null
 Txt $names[$i] ($x+17) 246 222 29 22 $blue $true | Out-Null
 Txt $roles[$i] ($x+17) 280 225 27 17 $navy $true | Out-Null
 Txt $body[$i] ($x+17) 320 229 48 13 $muted | Out-Null
}
$p.SaveAs($temp,24);$p.Close()
# Preserve all original package entries except slide 5 itself.
Copy-Item -LiteralPath $src -Destination $dst -Force
$edited=[IO.Compression.ZipFile]::OpenRead($temp)
$entry=$edited.GetEntry('ppt/slides/slide5.xml')
$mem=New-Object IO.MemoryStream
$stream=$entry.Open();$stream.CopyTo($mem);$stream.Close();$edited.Dispose()
$zip=[IO.Compression.ZipFile]::Open($dst,[IO.Compression.ZipArchiveMode]::Update)
$zip.GetEntry('ppt/slides/slide5.xml').Delete()
$target=$zip.CreateEntry('ppt/slides/slide5.xml');$stream=$target.Open();$mem.Position=0;$mem.CopyTo($stream);$stream.Close();$mem.Dispose();$zip.Dispose()
function HashEntries($path){
 $z=[IO.Compression.ZipFile]::OpenRead($path);$map=@{}
 foreach($e in $z.Entries){$stream=$e.Open();$sha=[Security.Cryptography.SHA256]::Create();$map[$e.FullName]=[BitConverter]::ToString($sha.ComputeHash($stream));$stream.Close();$sha.Dispose()}
 $z.Dispose();return $map
}
$before=HashEntries $src;$after=HashEntries $dst
$changed=@($before.Keys | Where-Object {$before[$_] -ne $after[$_]})
if($before.Count -ne $after.Count -or $changed.Count -ne 1 -or $changed[0] -ne 'ppt/slides/slide5.xml'){throw 'Unexpected package change'}
Write-Output ('CHANGED_ENTRIES='+($changed -join ','))
$p=$app.Presentations.Open($dst,-1,0,0)
if($p.Slides.Count -ne 6){throw 'Unexpected slide count'}
$p.Slides.Item(5).Export((Join-Path $out 'slide-05_수정.png'),'PNG',1600,900)
$p.SaveAs((Join-Path $out 'AI_교학상장_INTRO_1-6_5번수정.pdf'),32)
$p.Close();$app.Quit()
Remove-Item -LiteralPath $temp
Write-Output 'VERIFIED: 6 slides; all other package entries unchanged.'
