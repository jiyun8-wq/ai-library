$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$out=Join-Path $PSScriptRoot '교육자료_PART2'
New-Item -ItemType Directory -Path $out -Force | Out-Null
$src=Join-Path $PSScriptRoot '교육자료_PART1/AI_교학상장_INTRO_PART1_1-9.pptx'
$dst=Join-Path $out 'AI_교학상장_INTRO_PART2_1-12.pptx'
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
 Txt ('PART 2 / '+$label) 48 25 420 20 10 $muted | Out-Null
 Txt 'AI 교학상장' 665 25 247 20 10 $muted $false 3 | Out-Null
 Txt $title 48 72 870 60 30 $navy $true | Out-Null
 Line 48 500 912 500 | Out-Null
 Txt '새로워진 ChatGPT 활용법 · 데스크톱 앱과 Codex' 48 511 720 17 9 $muted | Out-Null
 Txt ('{0:00} / 12' -f $n) 830 509 82 20 10 $muted $false 3 | Out-Null
}
function FileIcon($x,$y){Box $x $y 15 20 $blue | Out-Null;Line ($x+4) ($y+7) ($x+11) ($y+7) $white 1 | Out-Null;Line ($x+4) ($y+12) ($x+11) ($y+12) $white 1 | Out-Null}
NewSlide 10 '엑셀 파일이 여러 개라면?' 'Excel 통합'
Box 48 151 520 267 $gray | Out-Null
Box 48 151 520 46 $pale | Out-Null
Box 68 163 14 7 $blue | Out-Null
Box 68 168 23 16 $blue | Out-Null
Txt '이용통계_2026' 103 160 320 30 20 $blue $true | Out-Null
Txt '8개 파일' 457 166 91 22 12 $muted $false 3 | Out-Null
for($i=1;$i -le 8;$i++){
 $col=[math]::Floor(($i-1)/4);$row=($i-1)%4;$x=70+$col*248;$y=213+$row*45
 Box $x $y 19 23 $blue | Out-Null
 Line ($x+5) ($y+6) ($x+5) ($y+18) $white 1 | Out-Null
 Line ($x+10) ($y+6) ($x+10) ($y+18) $white 1 | Out-Null
 Line ($x+4) ($y+11) ($x+15) ($y+11) $white 1 | Out-Null
 Line ($x+4) ($y+17) ($x+15) ($y+17) $white 1 | Out-Null
 Txt ('이용통계_'+$i+'월.xlsx') ($x+29) ($y-1) 209 29 17 $navy | Out-Null
}
Txt '8개 파일을' 602 214 310 43 29 $navy $true | Out-Null
Txt '하나로 합쳐서' 602 258 310 43 29 $navy $true | Out-Null
Txt '통계까지 내야 한다면?' 602 310 312 44 24 $blue $true | Out-Null
Txt 'Ctrl+C, Ctrl+V의 시간…' 602 372 310 25 15 $muted | Out-Null
Txt '기존 수작업 흐름' 48 432 200 20 11 $muted | Out-Null
$flow=@('파일 열기','복사·붙여넣기','데이터 정리','집계','그래프 작성')
for($i=0;$i -lt 5;$i++){$x=48+$i*176;Txt $flow[$i] $x 456 154 28 16 $muted $false 2 | Out-Null;if($i -lt 4){Txt '→' ($x+154) 455 22 28 17 $blue $false 2 | Out-Null}}
Txt '시연 자료: 가상의 도서관 이용통계' 630 486 282 14 8 $muted $false 3 | Out-Null
NewSlide 11 '이번에는 어디까지 부탁해볼까요?' '작업 지시'
Txt '오늘의 업무 요청' 48 147 390 28 17 $blue $true | Out-Null
$jobs=@("여러 Excel 파일을`n하나로 통합하기","월별 대출·반납`n건수 집계하기","요약 시트`n만들기","월별 변화`n그래프 만들기","완성된 Excel`n파일로 저장하기")
for($i=0;$i -lt 5;$i++){
 $x=48+$i*176;$fill=$pale;$c=$navy;$num=$blue
 if($i -eq 4){$fill=$blue;$c=$white;$num=$white}
 Box $x 190 160 120 $fill | Out-Null
 Txt ('0'+($i+1)) ($x+15) 204 130 25 15 $num $true | Out-Null
 Txt $jobs[$i] ($x+11) 245 140 55 15 $c $true 2 | Out-Null
 if($i -lt 4){Txt '→' ($x+160) 237 16 25 14 $blue $false 2 | Out-Null}
}
Box 48 329 864 138 $gray | Out-Null
Txt '한 번의 자연어 요청' 68 344 207 24 12 $blue $true | Out-Null
Txt "폴더에 있는 월별 이용통계 Excel 파일을 모두 확인해서`n하나의 파일로 통합하고, 월별 대출·반납 현황을 집계해 주세요.`n요약 시트와 월별 변화 그래프를 만들고`n완성된 Excel 파일로 저장해 주세요." 68 372 824 88 16 $navy | Out-Null
Txt '하나의 요청으로, 통합부터 완성 파일 저장까지' 48 477 864 21 12 $muted $false 2 | Out-Null
NewSlide 12 '반복될수록, 차이는 커집니다' '시연 정리'
Box 48 148 184 245 $gray | Out-Null
Box 248 148 250 245 $pale | Out-Null
Txt 'Before' 62 161 156 29 20 $muted $true 2 | Out-Null
Txt 'After' 263 161 220 29 20 $blue $true 2 | Out-Null
$before=@('여러 파일 열기','복사·붙여넣기','데이터 정리','직접 집계','그래프 작성','파일 저장')
for($i=0;$i -lt 6;$i++){$y=202+$i*30;Txt $before[$i] 59 $y 162 21 14 $muted $false 2 | Out-Null;if($i -lt 5){Txt '↓' 125 ($y+18) 30 15 10 $muted $false 2 | Out-Null}}
Txt "원하는 결과를`n자연어로 설명" 263 208 220 48 17 $navy $true 2 | Out-Null
Txt '↓' 353 259 40 25 18 $blue $false 2 | Out-Null
Txt "AI가 여러 단계의`n작업 수행" 263 286 220 49 17 $navy $true 2 | Out-Null
Txt '↓' 353 330 40 23 17 $blue $false 2 | Out-Null
Box 262 353 222 31 $blue | Out-Null
Txt '통합 Excel 완성' 266 354 214 29 21 $white $true 2 | Out-Null
$z=Box 516 148 396 245 (RGB 'FAFBFD');$z.Line.Visible=-1;$z.Line.ForeColor.RGB=$border;$z.Line.Weight=[single]1.2;$z.Line.DashStyle=4
$z.Name='실제 시연 결과 스크린샷 삽입 영역'
Txt '실제 시연 결과 삽입 영역' 536 171 356 24 12 $muted $false 2 | Out-Null
Line 698 230 730 230 $border 2 | Out-Null
Line 714 214 714 246 $border 2 | Out-Null
Txt "월별 단행본 대출·반납 건수`n변화 그래프와 요약표" 533 269 362 55 18 $muted $false 2 | Out-Null
Txt '시연 후 실제 스크린샷으로 교체' 534 355 360 20 11 $muted $false 2 | Out-Null
Txt '한 번 하는 작업보다, 매주·매월 반복하는 작업에서 더 유용합니다.' 48 405 864 31 20 $blue $true 2 | Out-Null
$tags=@('월별 통계','정기 보고자료','여러 파일 취합','반복적인 데이터 정리');$widths=@(117,146,150,206);$x=146
for($i=0;$i -lt 4;$i++){Box $x 445 $widths[$i] 25 $gray | Out-Null;Txt $tags[$i] ($x+5) 447 ($widths[$i]-10) 22 11 $muted $false 2 | Out-Null;$x+=$widths[$i]+12}
Txt '지금까지는 이미 있는 파일을 처리했습니다. 그런데 필요한 도구가 아예 없다면?' 48 479 864 19 11 $muted $false 2 | Out-Null

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
if($p.Slides.Count -ne 12){throw 'Slide count must be 12'}
for($i=10;$i -le 12;$i++){$p.Slides.Item($i).Export((Join-Path $out ('slide-{0:00}.png' -f $i)),'PNG',1600,900)}
$p.SaveAs((Join-Path $out 'AI_교학상장_INTRO_PART2_1-12.pdf'),32)
$p.Close();$app.Quit()
Write-Output 'VERIFIED: 12 slides. All original slide content and supporting parts preserved byte-for-byte.'
Write-Output $dst
