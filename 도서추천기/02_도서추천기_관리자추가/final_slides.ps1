function Placeholder($x,$y,$w,$h,$title,$sub){
 $z=Box $x $y $w $h (RGB 'FAFBFD');$z.Line.Visible=-1;$z.Line.ForeColor.RGB=$border;$z.Line.Weight=[single]1.2;$z.Line.DashStyle=4;$z.Name=$title
 Txt '실제 화면 삽입 영역' ($x+15) ($y+16) ($w-30) 23 12 $muted $false 2 | Out-Null
 Txt '+' ($x+$w/2-20) ($y+$h/2-47) 40 45 32 $border $false 2 | Out-Null
 Txt $title ($x+15) ($y+$h/2+2) ($w-30) 56 20 $muted $true 2 | Out-Null
 Txt $sub ($x+15) ($y+$h-34) ($w-30) 24 11 $muted $false 2 | Out-Null
}
NewSlide 13 '그럼, 없는 것도 만들어줄 수 있을까?' 'Vibe Coding'
Txt 'Codex로 작은 웹사이트 만들기' 48 137 864 37 23 $blue | Out-Null
Box 160 207 640 81 $gray | Out-Null
Txt '지금까지' 184 231 116 26 14 $muted $true | Out-Null
Txt '있는 파일을 처리하기' 320 228 442 37 26 $muted $true | Out-Null
Txt '↓' 453 297 54 43 29 $blue $true 2 | Out-Null
Box 96 352 768 105 $blue | Out-Null
Txt '이번에는' 122 389 139 29 16 $white $true | Out-Null
Txt '필요한 도구를 만들기' 296 381 537 52 35 $white $true | Out-Null
NewSlide 14 '바이브코딩(Vibe Coding)이란?' 'Vibe Coding'
$texts=@("“이런 페이지를`n만들어줘”",'AI가 제작','결과 확인',"“여기는 이렇게`n바꿔줘”",'다시 수정')
$symbols=@('대화','제작','확인','요청','수정')
for($i=0;$i -lt 5;$i++){$x=48+$i*176;Box $x 188 160 154 $pale | Out-Null;Txt $symbols[$i] ($x+16) 210 128 27 14 $blue $true 2 | Out-Null;Txt $texts[$i] ($x+9) 264 142 62 18 $navy $true 2 | Out-Null;if($i -lt 4){Txt '→' ($x+160) 258 16 25 14 $blue $false 2 | Out-Null}}
Txt '만들고 → 보고 → 다시 요청하고 → 고치기' 48 378 864 44 28 $blue $true 2 | Out-Null
Txt "완벽한 프롬프트 한 번보다,`n결과를 보며 계속 구체화합니다." 48 434 864 53 18 $muted $false 2 | Out-Null
NewSlide 15 '도서관에 이런 서비스가 있다면?' '아이디어'
$situations=@("“팀플할 공간이`n필요해요.”","“논문 자료를`n찾고 싶어요.”","“노트북을`n빌리고 싶어요.”")
for($i=0;$i -lt 3;$i++){$x=48+$i*296;Box $x 170 272 116 $gray | Out-Null;Txt $situations[$i] ($x+18) 195 236 68 23 $navy $true 2 | Out-Null;Line ($x+136) 287 ($x+136) 311 $border 2 | Out-Null}
Line 184 311 776 311 $border 2 | Out-Null
Txt '↓' 451 313 58 35 25 $blue $true 2 | Out-Null
Box 118 357 724 84 $blue | Out-Null
Txt '나에게 맞는 도서관 서비스 찾기' 138 378 684 45 30 $white $true 2 | Out-Null
Txt '몇 가지 질문에 답하면, 내 상황에 맞는 도서관 서비스를 추천' 48 459 864 29 18 $muted $false 2 | Out-Null
NewSlide 16 '말로 설명하면서 만들어보겠습니다' '실제 시연'
$titles=@('첫 번째 요청','결과를 보고 수정','기능 추가')
$prompts=@("“대학생에게 몇 가지 질문을 하고,`n답변에 따라 적합한`n도서관 서비스를 추천해주는`n웹페이지를 만들어줘.”","“대학도서관 서비스처럼`n보이도록 디자인과 내용을`n수정해줘.”","“추천 서비스를 관리할 수 있는`n관리자 페이지를 추가해줘.”")
for($i=0;$i -lt 3;$i++){$x=48+$i*296;$c=$navy;$fill=$pale;$accent=$blue;if($i -eq 2){$fill=$blue;$c=$white;$accent=$white};Box $x 171 272 238 $fill | Out-Null;Txt ('STEP 0'+($i+1)) ($x+19) 190 232 25 13 $accent $true | Out-Null;Txt $titles[$i] ($x+19) 230 235 35 22 $c $true | Out-Null;Txt $prompts[$i] ($x+19) 292 236 104 15 $c | Out-Null;if($i -lt 2){Txt '→' ($x+273) 279 23 29 20 $blue $false 2 | Out-Null}}
Txt "한 번에 완성하는 것이 아니라,`n결과를 보면서 발전시킵니다." 48 435 864 58 22 $blue $true 2 | Out-Null
NewSlide 17 '아이디어가 실제 도구가 되었습니다' '결과'
Placeholder 48 150 605 258 '나에게 맞는 도서관 서비스 찾기' '시연 후 완성된 웹페이지 스크린샷으로 교체'
Txt '이런 아이디어로도 확장' 680 151 232 23 12 $muted $true | Out-Null
$names=@('책 골라주는 도서관','교육 콘텐츠 모음','자료 기반 안내 도구')
$subs=@('관심 분야에 따른 도서 추천','교육자료와 영상 정리','제공한 자료를 기반으로 정보 안내')
for($i=0;$i -lt 3;$i++){$y=182+$i*76;Box 677 $y 235 65 $gray | Out-Null;Txt $names[$i] 690 ($y+10) 210 25 16 $blue $true | Out-Null;Txt $subs[$i] 690 ($y+38) 210 22 10 $muted | Out-Null}
Txt '아이디어 → 첫 결과 → 수정 요청 → 기능 추가 → 완성' 48 424 864 32 19 $navy $true 2 | Out-Null
Txt '완벽한 프롬프트 한 번보다, 결과를 보며 계속 수정하기' 48 465 864 31 22 $blue $true 2 | Out-Null
$section='OUTRO'
NewSlide 18 '그래서, 실제 업무에도 적용해봤습니다' '실제 업무 적용'
Txt '신간도서 선정 업무 × AI' 48 138 864 34 24 $blue $true | Out-Null
Txt '기존 방식' 48 183 450 22 11 $muted $true | Out-Null
Txt '신간 목록 확인 → 제외 기준 확인 → 도서별 검토 → 선정' 48 209 466 30 13 $muted | Out-Null
Box 48 253 466 96 $pale | Out-Null
Txt 'AI 활용 방식' 64 265 425 23 12 $blue $true | Out-Null
Txt '신간 목록 → AI 1차 분류 → 사람이 검토 → 최종 판단' 64 306 435 27 13 $blue $true | Out-Null
$labels=@('A : 제외','B : 추가 검토 필요','C : 현재 제공된 정보상 제외 사유 없음')
for($i=0;$i -lt 3;$i++){Txt $labels[$i] 63 (365+$i*25) 451 24 14 $navy ($i -eq 2) | Out-Null}
Placeholder 538 181 374 254 'AI 분류 결과 / Excel 화면' '실제 업무 결과 스크린샷 삽입'
Txt 'AI가 구입 여부를 결정하는 것이 아니라, 1차 검토를 보조합니다.' 48 460 864 35 21 $blue $true 2 | Out-Null
NewSlide 19 'AI에게 어디까지 맡길까?' '역할 구분'
Box 48 155 416 258 $pale | Out-Null
Box 496 155 416 258 $gray | Out-Null
Txt 'AI에게 맡기기 좋은 일' 72 176 368 36 25 $blue $true | Out-Null
Txt '사람이 확인해야 하는 일' 520 176 368 36 25 $navy $true | Out-Null
$a=@('반복','분류·정리','변환','초안');$b=@('여러 파일 취합·정리','내용 분류·요약','문서·표·파일 생성','문서·아이디어·간단한 도구 제작');$c=@('최종 판단','결과의 정확성','업무 기준 적용','중요한 의사결정')
for($i=0;$i -lt 4;$i++){$y=235+$i*42;Txt $a[$i] 72 $y 93 29 17 $blue $true | Out-Null;Txt $b[$i] 167 ($y+2) 279 28 14 $navy | Out-Null;Txt $c[$i] 530 $y 350 29 21 $navy | Out-Null}
Txt 'AI가 작업하고, 사람이 판단합니다.' 48 448 864 48 33 $blue $true 2 | Out-Null
NewSlide 20 '잠깐! 업무에 적용하기 전에' '사용 전 체크'
$titles=@('개인정보·민감정보','파일 접근 권한','결과 검토','기관 정책')
$qs=@('외부 AI에 입력해도 되는 자료인가?','AI가 어떤 폴더와 파일에 접근하는가?','생성된 내용과 수치가 정확한가?','우리 기관에서 허용되는 사용 방식인가?')
for($i=0;$i -lt 4;$i++){$x=48+($i%2)*448;$y=155+[math]::Floor($i/2)*122;Box $x $y 416 105 $pale | Out-Null;Txt ('0'+($i+1)) ($x+18) ($y+17) 43 28 15 $blue $true | Out-Null;Txt $titles[$i] ($x+68) ($y+14) 325 34 23 $blue $true | Out-Null;Txt $qs[$i] ($x+20) ($y+64) 379 28 15 $navy | Out-Null}
Txt '편리함보다 먼저,' 48 417 864 32 22 $muted $false 2 | Out-Null
Txt '이 자료를 AI에게 보여줘도 되는가?' 48 452 864 43 29 $blue $true 2 | Out-Null
NewSlide 21 '' 'Q&A'
Box 454 117 52 5 $blue $false | Out-Null
Txt "내 업무 중`nAI에게 맡겨볼 수 있는 일은`n무엇일까요?" 60 168 840 169 38 $navy $true 2 | Out-Null
Txt '작은 반복 작업 하나부터 시작해보세요.' 48 369 864 37 22 $muted $false 2 | Out-Null
Txt 'Q&A' 48 446 864 42 28 $blue $true 2 | Out-Null
