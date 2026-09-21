$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$out=Join-Path $PSScriptRoot '교육자료_PART1'
New-Item -ItemType Directory -Path $out -Force | Out-Null
$src=Join-Path $PSScriptRoot '교육자료_INTRO/AI_교학상장_INTRO_1-6_5번수정.pptx'
$dst=Join-Path $out 'AI_교학상장_INTRO_PART1_1-9.pptx'
function RGB($h){return [Convert]::ToInt32($h.Substring(0,2),16)+256*[Convert]::ToInt32($h.Substring(2,2),16)+65536*[Convert]::ToInt32($h.Substring(4,2),16)}
$blue=RGB '005BAC';$navy=RGB '142E4C';$muted=RGB '65758A';$pale=RGB 'EDF4FC';$white=RGB 'FFFFFF';$border=RGB 'DCE5EF';$gray=RGB 'F3F5F8'
$app=New-Object -ComObject PowerPoint.Application
$p=$app.Presentations.Open($src,0,0,0)
function Box($x,$y,$w,$h,$color,$round=$true){$type=1;if($round){$type=5};$z=$script:s.Shapes.AddShape($type,$x,$y,$w,$h);$z.Fill.ForeColor.RGB=$color;$z.Line.Visible=0;if($round){$z.Adjustments.Item(1)=0.13};return $z}
function Txt($t,$x,$y,$w,$h,$size=22,$color=$navy,$bold=$false,$align=1){
 $z=$script:s.Shapes.AddTextbox(1,$x,$y,$w,$h);$f=$z.TextFrame
 $f.MarginLeft=0;$f.MarginRight=0;$f.MarginTop=0;$f.MarginBottom=0;$f.WordWrap=-1
 $r=$f.TextRange;$r.Text=$t;$r.Font.Name='맑은 고딕';$r.Font.NameFarEast='맑은 고딕';$r.Font.Size=$size;$r.Font.Color.RGB=$color;$r.Font.Bold=[int]$bold*-1;$r.ParagraphFormat.Alignment=$align
 return $z
}
function Line($x1,$y1,$x2,$y2,$color=$border,$weight=1.5){$z=$script:s.Shapes.AddLine($x1,$y1,$x2,$y2);$z.Line.ForeColor.RGB=$color;$z.Line.Weight=[single]$weight;return $z}
function NewSlide($n,$title,$label){
 $script:s=$p.Slides.Add($n,12);$script:s.Background.Fill.ForeColor.RGB=$white
 Txt ('PART 1 / '+$label) 48 25 420 20 10 $muted | Out-Null
 Txt 'AI 교학상장' 665 25 247 20 10 $muted $false 3 | Out-Null
 Txt $title 48 72 870 60 30 $navy $true | Out-Null
 Line 48 500 912 500 | Out-Null
 Txt '새로워진 ChatGPT 활용법 · 데스크톱 앱과 Codex' 48 511 720 17 9 $muted | Out-Null
 Txt ('{0:00} / 09' -f $n) 830 509 82 20 10 $muted $false 3 | Out-Null
}
function FileIcon($x,$y){Box $x $y 15 20 $blue | Out-Null;Line ($x+4) ($y+7) ($x+11) ($y+7) $white 1 | Out-Null;Line ($x+4) ($y+12) ($x+11) ($y+12) $white 1 | Out-Null}
NewSlide 7 '파일 정리도 AI에게 맡길 수 있을까?' '파일 정리'
Box 48 151 520 261 $gray | Out-Null
Box 48 151 520 47 $pale | Out-Null
Box 69 164 14 7 $blue | Out-Null
Box 69 168 23 16 $blue | Out-Null
Txt '업무자료' 104 160 290 30 20 $blue $true | Out-Null
Txt '···' 521 157 32 28 21 $muted $false 2 | Out-Null
$files=@('회의내용_최종.txt','회의내용_진짜최종.txt','회의내용_진짜최종_수정.txt','해야할일_최종.txt','메모_이게뭐였지.txt')
for($i=0;$i -lt 5;$i++){
 $y=210+$i*37
 if($i -eq 2){Box 63 ($y-3) 488 32 (RGB 'DDEBFA') | Out-Null}
 FileIcon 74 ($y+2)
 $t=Txt $files[$i] 105 $y 435 29 18 $navy ($i -eq 2)
 if($i -lt 3){$start=$files[$i].IndexOf('_')+2;$len=$files[$i].Length-$start-3;$r=$t.TextFrame.TextRange.Characters($start,$len);$r.Font.Color.RGB=$blue;$r.Font.Bold=-1}
}
Txt '…뭐가 진짜' 605 223 300 44 27 $muted | Out-Null
Txt '최종이지?' 605 270 300 60 38 $blue $true | Out-Null
Txt '기존 작업 흐름' 48 431 180 20 11 $muted | Out-Null
$flow=@('파일 열기','내용 확인','필요한 내용 찾기','다시 정리','새 파일 저장')
for($i=0;$i -lt 5;$i++){$x=48+$i*176;Txt $flow[$i] $x 456 154 28 16 $muted $false 2 | Out-Null;if($i -lt 4){Txt '→' ($x+154) 455 22 28 17 $blue $false 2 | Out-Null}}
NewSlide 8 '그냥, 이렇게 부탁해보겠습니다' '작업 지시'
Box 48 152 864 231 $pale | Out-Null
Txt 'AI에게 보내는 업무 요청' 73 168 750 24 12 $blue $true | Out-Null
Box 68 203 824 161 $white | Out-Null
Txt "이 폴더에 있는 텍스트 파일을 모두 확인하고,`n중복된 내용은 정리한 뒤 필요한 내용만 하나의 파일로 정리해 주세요.`n`n정리한 결과는 새로운 파일로 만들어`n현재 폴더에 저장해 주세요." 88 218 784 140 20 $navy | Out-Null
$flow=@('① 파일 확인','② 내용 정리','③ 새 파일 생성','④ 폴더에 저장')
for($i=0;$i -lt 4;$i++){$x=48+$i*222;Txt $flow[$i] $x 409 198 32 19 $blue $true 2 | Out-Null;if($i -lt 3){Txt '→' ($x+198) 409 24 30 20 $muted $false 2 | Out-Null}}
Txt '특별한 명령어 없이, 원하는 작업을 자연어로 설명합니다.' 48 463 864 26 16 $muted $false 2 | Out-Null
NewSlide 9 '무엇이 달라졌을까요?' '시연 정리'
Box 48 151 416 236 $gray | Out-Null
Box 496 151 416 236 $pale | Out-Null
Txt '기존 ChatGPT 활용' 72 168 368 31 22 $muted $true 2 | Out-Null
Txt '이번 작업' 520 168 368 31 22 $blue $true 2 | Out-Null
Txt '파일 업로드' 75 220 362 30 21 $muted $false 2 | Out-Null
Txt '↓' 227 249 58 24 18 $muted $false 2 | Out-Null
Txt '“요약해줘”' 75 279 362 30 21 $muted $false 2 | Out-Null
Txt '↓' 227 309 58 24 18 $muted $false 2 | Out-Null
Txt '답변 확인' 75 339 362 30 21 $muted $false 2 | Out-Null
Txt '폴더 확인' 520 208 368 26 18 $navy $false 2 | Out-Null
Txt '↓' 680 231 48 21 15 $blue $false 2 | Out-Null
Txt '여러 파일 내용 확인' 520 253 368 26 18 $navy $false 2 | Out-Null
Txt '↓' 680 276 48 21 15 $blue $false 2 | Out-Null
Txt '내용 정리' 520 296 368 26 18 $navy $false 2 | Out-Null
Txt '↓' 680 318 48 21 15 $blue $false 2 | Out-Null
Box 521 340 366 36 $blue | Out-Null
Txt '새 파일 생성·저장' 530 342 348 31 22 $white $true 2 | Out-Null
Txt '답변을 받은 것이 아니라,' 48 400 864 31 22 $navy $false 2 | Out-Null
Txt '작업 결과물을 만들었습니다.' 48 431 864 39 28 $blue $true 2 | Out-Null
Txt '그런데 파일이 한두 개가 아니라, 매달 반복해서 쌓인다면?' 48 478 864 18 11 $muted $false 2 | Out-Null
$p.SaveAs($dst,24);$p.Close()
# Restore original package content, allowing only document-level slide registration to change.
$original=[IO.Compression.ZipFile]::OpenRead($src)
$result=[IO.Compression.ZipFile]::Open($dst,[IO.Compression.ZipArchiveMode]::Update)
$allowed=@('[Content_Types].xml','ppt/presentation.xml','ppt/_rels/presentation.xml.rels','docProps/app.xml')
foreach($e in $original.Entries){
 if($e.FullName -in $allowed){continue}
 $old=$result.GetEntry($e.FullName);if($old){$old.Delete()}
 $new=$result.CreateEntry($e.FullName);$a=$e.Open();$b=$new.Open();$a.CopyTo($b);$a.Close();$b.Close()
}
$result.Dispose();$original.Dispose()
function HashEntries($path){$z=[IO.Compression.ZipFile]::OpenRead($path);$map=@{};foreach($e in $z.Entries){$a=$e.Open();$h=[Security.Cryptography.SHA256]::Create();$map[$e.FullName]=[BitConverter]::ToString($h.ComputeHash($a));$a.Close();$h.Dispose()};$z.Dispose();return $map}
$before=HashEntries $src;$after=HashEntries $dst
$unexpected=@($before.Keys | Where-Object {$_ -notin $allowed -and $before[$_] -ne $after[$_]})
if($unexpected.Count){throw ('Original content changed: '+($unexpected -join ','))}
$p=$app.Presentations.Open($dst,-1,0,0)
if($p.Slides.Count -ne 9){throw 'Slide count must be 9'}
for($i=7;$i -le 9;$i++){$p.Slides.Item($i).Export((Join-Path $out ('slide-{0:00}.png' -f $i)),'PNG',1600,900)}
$p.SaveAs((Join-Path $out 'AI_교학상장_INTRO_PART1_1-9.pdf'),32)
$p.Close();$app.Quit()
Write-Output 'VERIFIED: 9 slides. All original slide content and supporting parts preserved byte-for-byte.'
Write-Output $dst
