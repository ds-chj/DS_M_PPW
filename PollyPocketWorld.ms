?utility show_character "캐릭터를 구경하기"
(
	dropdownlist show "캐릭터 구경하기" items:#("전체보기","롯데 자이언츠","삼성 라이온즈","한화 이글스","기아 타이거즈","넥센 히어로즈","두산 베어스")
		on show selected i do
		(
			case i of
			(
				1:$maincamera.pos=[11,-1848.5,-11.5]
				2:$maincamera.pos=[-300.5,-696.6,261.4]
				3:$maincamera.pos=[-296.4,-696.6,-81.6]
				4:$maincamera.pos=[298.0,-696.6,268.5]
				5:$maincamera.pos=[301.0,-696.6,-81.6]
				6:$maincamera.pos=[0.0,-696.6,-256.5]
				7:$maincamera.pos=[-0.8,-696.6,88.6]
			)
		)
)
utility take_picture "사진찍기"
(
	button theButton "사진찍기"
	on theButton pressed do
	(
		render outputsize:[500,500]
	)
)
utility model_s "캐릭터 돌리기"
(
  
	dropdownlist show "캐릭터 돌리기" items:#("롯데 자이언츠","삼성 라이온즈","한화 이글스","기아 타이거즈","넥센 히어로즈","두산 베어스")
	 slider modelslider "rotation"  range:[-180,180,0]
	on show selected i do
		(
			case i of
			(
				1:(select $giants)
				2:(select $lions)
				3:(select $eagles)
				4:(select $tigers)
				5:(select $heros)
				6:(select $bears)
			)
		)
	 on modelslider changed val do(
               $.rotation.z_rotation = val
            )
   
   
)
utility change_character "캐릭터 위치 변경"
(
	dropdownlist first "charater1" items:#("롯데 자이언츠","삼성 라이온즈","한화 이글스","기아 타이거즈","넥센 히어로즈","두산 베어스")
	dropdownlist second "charater2" items:#("롯데 자이언츠","삼성 라이온즈","한화 이글스","기아 타이거즈","넥센 히어로즈","두산 베어스")
	button change "change" align:#center enabled:false
	
	local obj2
	local obj1
	
	
		on first selected l do
		(
			case l of
			(
				1:(select $giants)
				2:(select $lions)
				3:(select $eagles)
				4:(select $tigers)
				5:(select $heros)
				6:(select $bears)
			)
			obj1=$
		)
		on second selected k do
		(

			case k of
			(
				1:(select $giants)
				2:(select $lions)
				3:(select $eagles)
				4:(select $tigers)
				5:(select $heros)
				6:(select $bears)
			)
			obj2=$
			 change.enabled=true
			)
			
		
		
		on change pressed do
		(
			$swap.position=$obj2.position
			$obj2.position=$obj1.position
			$obj2.position=$swap.position
		)
		
)
utility change_shelve "선반바꾸기"
(
	button show_all "전체보기"
	button rect "사각형" width:45 across:3
	button hex "육각형" width:45
	button cir "원형" width:45
	
	checkbox select_all "전체선택" 
	local mat=standardmaterial()
	colorpicker theColor "color: " default:[201,162,42]
	
	on rect pressed do (
		
		hide $she*
		unhide $shelver*
		
	)
	on hex pressed do(
		hide $she*
		unhide $shelveh*
	)
	on cir pressed do(
		hide $she*
		unhide $shelvec*
	)
	on show_all pressed do (
		$maincamera.pos=[11,-1848.5,-11.5]
	)
	on select_all changed state do
	(
		if state then 
		(
			select $she*
			$.material=mat
		)
		else 
		(
			deselect $*
		)
	)
	
	on theColor changed val do
	(
		mat.diffusecolor=val
	)
)
utility light_animation "조명 애니메이션"
(
	slider light_brightness "조명 밝기" range:[0,0.8,0.4]
	button reset_brightness "reset"
	on reset_brightness pressed do
	(
		select $light*
			for i in 1 to selection.count do 
				selection[i].multiplier=0.4
	)
	on light_brightness changed val do
	(
			select $light*
			for i in 1 to selection.count do 
				selection[i].multiplier=val
	)
	
)
utility shelve_animation "선반애니메이션"
(
	button candy "CANDY" across:3
	button sky "SKY"
	button party "PARTY"
	button startanimation "Start" images:#("VCRControls_24i.bmp","VCRControls_24i.bmp",28,7,7,8,8) width:24 height:24 across:2
	button stopplayanimation "Start" images:#("VCRControls_24i.bmp","VCRControls_24i.bmp",28,9,9,10,10) width:24 height:24
	button resetanimation "Reset" width:32 height:24
	local mat=standardmaterial()
	on startanimation pressed do(
		select $she*
		playanimation()
	)
	on stopplayanimation pressed do(
		select $she*
		stopanimation()
	)
	on resetanimation pressed do(
		deleteKeys $she* #allKeys
	)
	on candy pressed do(		
		select $she*
		deleteKeys $she* #allKeys
		animate on
		(
			at time 0 mat.diffusecolor=[253,56,73]		
			$.material=mat
			at time 15 mat.diffusecolor=[254,143,36]			
			$.material=mat
			at time 30 mat.diffusecolor=[4,213,243]		
			$.material=mat
			at time 45 mat.diffusecolor=[253,253,253]		
			$.material=mat
			at time 60 mat.diffusecolor=[215,244,4]		
			$.material=mat
			at time 75 mat.diffusecolor=[253,211,3]		
			$.material=mat
		)
	)
	on sky pressed do(
		select $she*
		deleteKeys $she* #allKeys
		animate on
		(
			at time 0 mat.diffusecolor=[63,144,131]		
			$.material=mat
			at time 15 mat.diffusecolor=[140,186,210]			
			$.material=mat
			at time 30 mat.diffusecolor=[219,225,239]		
			$.material=mat
			at time 45 mat.diffusecolor=[12,31,73]		
			$.material=mat
			at time 60 mat.diffusecolor=[245,246,240]		
			$.material=mat
			at time 75 mat.diffusecolor=[12,75,172]		
			$.material=mat
			
		)
	)
	on party pressed do(
		select $she*
		deleteKeys $she* #allKeys
		animate on
		(
			at time 0 mat.diffusecolor=[255,0,0]		
			$.material=mat
			at time 8 mat.diffusecolor=[1,0,255]			
			$.material=mat
			at time 16 mat.diffusecolor=[255,187,0]		
			$.material=mat
			at time 24 mat.diffusecolor=[95,0,255]		
			$.material=mat
			at time 32 mat.diffusecolor=[29,219,22]		
			$.material=mat
			at time 40 mat.diffusecolor=[255,0,221]		
			$.material=mat
			at time 48 mat.diffusecolor=[255,228,0]		
			$.material=mat
			at time 56 mat.diffusecolor=[0,0,0]		
			$.material=mat
			at time 64 mat.diffusecolor=[0,216,255]		
			$.material=mat
			at time 72 mat.diffusecolor=[95,0,255]		
			$.material=mat
			at time 80 mat.diffusecolor=[29,219,22]		
			$.material=mat
			at time 88 mat.diffusecolor=[255,0,221]	
			$.material=mat
			at time 92 mat.diffusecolor=[255,0,0]		
			$.material=mat
			at time 100 mat.diffusecolor=[1,0,255]	
			
		)
	)
	
)
