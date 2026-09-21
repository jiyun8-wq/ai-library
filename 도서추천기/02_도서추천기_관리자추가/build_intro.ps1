$ErrorActionPreference='Stop'
$out=Join-Path $PSScriptRoot '교육자료_INTRO'
New-Item -ItemType Directory -Path $out -Force | Out-Null
function RGB($h) { return [Convert]::ToInt32($h.Substring(0,2),16)+256*[Convert]::ToInt32($h.Substring(2,2),16)+65536*[Convert]::ToInt32($h.Substring(4,2),16) }
$blue=RGB '005BAC'; $navy=RGB '142E4C'; $muted=RGB '65758A'; $pale=RGB 'EDF4FC'; $white=RGB 'FFFFFF'; $line=RGB 'DCE5EF'; $green=RGB '16866B'
$app=New-Object -ComObject PowerPoint.Application
$pres=$app.Presentations.Add()
$pres.PageSetup.SlideWidth=960; $pres.PageSetup.SlideHeight=540
function Box($x,$y,$w,$h,$fill,$radius=$true) {
 $type=1; if($radius){$type=5}
 $z=$script:s.Shapes.AddShape($type,$x,$y,$w,$h); $z.Fill.ForeColor.RGB=$fill; $z.Line.Visible=0
 if($radius){$z.Adjustments.Item(1)=0.13}; return $z
}
function Txt($str,$x,$y,$w,$h,$size=22,$color=$navy,$bold=$false,$align=1) {
 $z=$script:s.Shapes.AddTextbox(1,$x,$y,$w,$h)
 $z.TextFrame.MarginLeft=0; $z.TextFrame.MarginRight=0; $z.TextFrame.MarginTop=0; $z.TextFrame.MarginBottom=0
 $z.TextFrame.WordWrap=-1
 $r=$z.TextFrame.TextRange; $r.Text=$str; $r.Font.Name='맑은 고딕'; $r.Font.NameFarEast='맑은 고딕'; $r.Font.Size=$size; $r.Font.Color.RGB=$color; $r.Font.Bold=[int]$bold*-1; $r.ParagraphFormat.Alignment=$align
 return $z
}
function Line($x1,$y1,$x2,$y2,$color=$line,$weight=1.5) { $z=$script:s.Shapes.AddLine($x1,$y1,$x2,$y2); $z.Line.ForeColor.RGB=$color; $z.Line.Weight=[single]$weight; return $z }
function NewSlide($n,$title,$label) {
 $script:s=$pres.Slides.Add($n,12); $script:s.Background.Fill.ForeColor.RGB=$white
 Txt 'AI 교학상장  /  INTRO' 48 25 350 20 10 $muted | Out-Null
 Txt $label 665 25 247 20 10 $muted $false 3 | Out-Null
 if($title){Txt $title 48 72 870 60 30 $navy $true | Out-Null}
 Line 48 500 912 500 | Out-Null
 Txt '새로워진 ChatGPT 활용법 · 데스크톱 앱과 Codex' 48 511 720 17 9 $muted | Out-Null
 Txt ('{0:00} / 06' -f $n) 830 509 82 20 10 $muted $false 3 | Out-Null
}
function Note($t) { $script:s.NotesPage.Shapes.Placeholders.Item(2).TextFrame.TextRange.Text=$t }
function FileIcon($x,$y,$c) {
 Box $x $y 38 48 $c | Out-Null
 Line ($x+9) ($y+17) ($x+28) ($y+17) $white 2 | Out-Null
 Line ($x+9) ($y+25) ($x+28) ($y+25) $white 2 | Out-Null
 Line ($x+9) ($y+33) ($x+22) ($y+33) $white 2 | Out-Null
}
NewSlide 1 '' '대학도서관 직원 대상 내부교육'
Box 48 124 48 5 $blue $false | Out-Null
Txt "새로워진`nChatGPT 활용법" 48 154 640 145 44 $navy $true | Out-Null
Txt '데스크톱 앱과 Codex' 50 318 570 52 27 $blue | Out-Null
Txt 'AI 교학상장 3차시 | 2026. 9.' 50 440 600 28 16 $muted | Out-Null
Box 682 145 230 253 $pale | Out-Null
Box 709 176 174 124 $white | Out-Null
Box 725 197 111 36 $blue | Out-Null
Txt 'ChatGPT' 733 202 95 24 17 $white $true 2 | Out-Null
Line 730 254 858 254 $line 3 | Out-Null
Line 730 267 824 267 $line 3 | Out-Null
Line 796 301 796 321 $blue 4 | Out-Null
Line 766 321 826 321 $blue 4 | Out-Null
FileIcon 839 341 $green
Box 709 342 112 34 $white | Out-Null
Txt '내 PC · 파일' 714 348 102 24 14 $blue $true 2 | Out-Null
Note '교육계획안 INTRO(약 10분)의 시작. 대학도서관 실무에서 AI에게 맡겨볼 수 있는 일을 탐색하는 교육임을 소개한다.'
NewSlide 2 '요즘 ChatGPT, 많이 달라졌습니다' '변화 살펴보기'
$cards=@(@('Astra',64,163),@('이미지 생성·편집',650,163),@('Codex',64,265),@('Desktop',650,265),@('Work',260,365),@('기타 새로운 기능',502,365))
foreach($c in $cards){Line 480 274 ($c[1]+111) ($c[2]+37) $line 2 | Out-Null}
foreach($c in $cards){Box $c[1] $c[2] 226 74 $pale | Out-Null; Txt $c[0] ($c[1]+12) ($c[2]+21) 202 34 21 $blue $true 2 | Out-Null}
Box 368 217 224 110 $blue | Out-Null
Txt 'ChatGPT' 381 251 198 48 32 $white $true 2 | Out-Null
Txt 'ChatGPT는 계속해서 새로운 작업 방식으로 확장되고 있습니다.' 48 456 864 30 19 $navy $true 2 | Out-Null
Note '요청된 기능명을 중심으로 구성한 검토용 슬라이드. Astra, Work 등의 구체적인 정의와 제공 조건은 본문에 추가하지 않았다. 발표 전 최신 공식 정보로 기능명 및 설명을 확인하여 수정할 예정.'
NewSlide 3 '다들 써보셨나요?' '함께 이야기하기'
$names=@('Astra','이미지','Codex','Desktop','Work')
for($i=0;$i -lt 5;$i++){ $x=48+$i*176; Box $x 158 160 62 $pale | Out-Null; Txt $names[$i] ($x+6) 175 148 30 21 $blue $true 2 | Out-Null }
$rx=@(48,344,640); $rt=@('써봤다','들어봤다','처음 본다'); $symbol=@('🙋','👀','?'); $colors=@($blue,$green,$muted)
for($i=0;$i -lt 3;$i++){
 Box $rx[$i] 260 272 178 (RGB 'F5F7FA') | Out-Null
 $q=Txt $symbol[$i] ($rx[$i]+76) 275 120 79 47 $colors[$i] $true 2
 if($i -lt 2){$q.TextFrame.TextRange.Font.Name='Segoe UI Emoji'}
 Txt $rt[$i] ($rx[$i]+20) 366 232 43 26 $navy $true 2 | Out-Null
}
Txt '손을 들어 함께 알려주세요' 48 459 864 26 16 $muted $false 2 | Out-Null
Note '앞 슬라이드의 기능을 하나씩 짚으며 사용 경험을 묻는다. 써봤다 / 들어봤다 / 처음 본다 중 해당하는 반응에 손을 들도록 유도한다.'
NewSlide 4 '그런데, 가장 큰 변화는?' '오늘의 핵심'
Txt '질문하는 AI' 48 157 310 68 39 $muted $true | Out-Null
Txt '→' 378 150 96 80 47 $blue $true 2 | Out-Null
Txt '일하는 AI' 505 157 400 68 45 $blue $true | Out-Null
Box 48 264 278 160 (RGB 'F3F5F8') | Out-Null
Txt '질문' 72 320 84 37 25 $muted $true 2 | Out-Null
Txt '→' 159 319 49 35 23 $muted $false 2 | Out-Null
Txt '답변' 213 320 86 37 25 $muted $true 2 | Out-Null
Txt '→' 337 316 48 40 26 $blue $true 2 | Out-Null
Box 399 264 513 160 $pale | Out-Null
$steps=@('작업 지시','파일 확인','작업','결과물 생성')
for($i=0;$i -lt 4;$i++){
 $x=415+$i*124
 Txt ('0'+($i+1)) $x 287 108 28 13 $blue $true 2 | Out-Null
 Box $x 322 108 58 $white | Out-Null
 Txt $steps[$i] ($x+3) 338 102 28 16 $blue $true 2 | Out-Null
 if($i -lt 3){Txt '›' ($x+108) 336 16 30 19 $blue $true 2 | Out-Null}
}
Note '핵심 메시지: 질문하는 AI → 일하는 AI. 답변을 받는 데서 나아가, 작업을 지시하고 파일을 확인하며 결과물을 만드는 흐름으로 활용 범위가 확장됨을 설명한다.'
NewSlide 5 '그걸 가능하게 하는 Desktop + Codex' '두 가지 작업 도구'
Box 48 155 416 235 $pale | Out-Null
Box 496 155 416 235 (RGB 'F0F7F4') | Out-Null
Txt 'ChatGPT Desktop' 73 178 363 39 27 $blue $true | Out-Null
Txt 'Codex' 521 178 363 39 27 $green $true | Out-Null
Txt "PC에서 ChatGPT 활용`n작업 환경과 더 가까운 활용`n파일을 활용한 작업" 74 239 361 132 22 $navy | Out-Null
Txt "자연어로 작업 지시`n파일과 코드 확인·수정`n여러 단계의 작업 수행" 522 239 362 132 22 $navy | Out-Null
Txt '“무엇을 물어볼까?”' 48 405 864 30 20 $muted $false 2 | Out-Null
Txt '↓' 448 431 64 24 20 $blue $true 2 | Out-Null
Txt '“무엇을 맡겨볼까?”' 48 459 864 37 26 $blue $true 2 | Out-Null
Note '비개발자가 자연어로 작업을 지시하는 관점에서 소개한다. Desktop과 Codex의 구체적인 제공 기능 및 환경은 실제 시연 화면에 맞춰 설명한다.'
NewSlide 6 '오늘 AI에게 세 가지 일을 맡겨보겠습니다' '실습 흐름'
$xs=@(48,344,640); $ys=@(261,218,175); $hs=@(162,205,248); $ts=@('파일 정리','Excel 처리','웹사이트 제작'); $ds=@('텍스트 확인 → 정리 → 새 파일','통합 → 집계 → 그래프','아이디어 → 제작 → 수정'); $fs=@((RGB 'EFF4FA'),(RGB 'DDEBFA'),$blue)
for($i=0;$i -lt 3;$i++){
 $x=$xs[$i]; $y=$ys[$i]; $c=$blue; if($i -eq 2){$c=$white}
 Box $x $y 272 $hs[$i] $fs[$i] | Out-Null
 Txt ('STEP 0'+($i+1)) ($x+22) ($y+20) 228 26 13 $c $true | Out-Null
 Txt $ts[$i] ($x+22) ($y+60) 240 44 28 $c $true | Out-Null
 Txt $ds[$i] ($x+22) 382 235 29 14 $c | Out-Null
 if($i -lt 2){Txt '→' ($x+273) 330 23 30 20 $blue $true 2 | Out-Null}
}
Txt '파일 하나에서 시작해서, 작은 웹서비스까지' 48 453 864 34 23 $navy $true 2 | Out-Null
Note '교육계획안의 실습 순서를 안내한다: 텍스트 파일 정리 → Excel 통합·집계·그래프 → 웹사이트 제작·수정. 이 6장으로 INTRO를 마치며, 다음부터 실제 화면 시연으로 전환한다. 이번 파일에는 PART 1 이후 슬라이드를 포함하지 않는다.'
$pptx=Join-Path $out 'AI_교학상장_INTRO_1-6.pptx'
$pres.SaveAs($pptx,24)
$pres.SaveAs((Join-Path $out 'AI_교학상장_INTRO_1-6.pdf'),32)
for($i=1;$i -le 6;$i++){ $pres.Slides.Item($i).Export((Join-Path $out ('slide-{0:00}.png' -f $i)),'PNG',1600,900) }
Write-Output ('SLIDES='+$pres.Slides.Count)
$pres.Close(); $app.Quit()
Write-Output $pptx
