$(document).ready(function(){   
	    
	var scheduleArray = new Array();
	$('.sch').each(function(){
		scheduleArray.push($(this));
	});
	
	for(var i = 0; i < scheduleArray.length; i++){
		let memCd = scheduleArray[i].attr('memCd');
		let codeCd = Number(scheduleArray[i].attr('codeCd'));			
		let startNum = scheduleArray[i].attr('startNum');
		let start;
		if(startNum % 100 == 0){
			start = parseInt( startNum / 100 );
		}else{
			start = parseInt( startNum / 100 );
		}
		
		let endNum = scheduleArray[i].attr('endNum');
		let end; 
		if(endNum % 100 == 0){
			end = parseInt( endNum / 100 );
		}else{
			end = parseInt( endNum / 100 ) + 1;
		}
		
		let time = startNum.slice(0,-2) + ':' + startNum.slice(-2) + '~' + endNum.slice(0,-2) + ':' + endNum.slice(-2)
		
		if(codeCd == 26){
			$('.'+ memCd).attr('id', 'on');
			for(var j = 0; j < 24; j++){
				$('#'+ memCd + '-' + String(j+1)).attr('class', 'o teamList')
			}
		}
		
		switch (codeCd) {
		    case 15: // 수술 일정
				for(var j = start; j < end; j++){
					$('#'+ memCd + '-' + String(j+1)).attr('class', 'g teamList')
					$('#'+ memCd + '-' + String(j+1)).attr('time', time)
				};
		    break;
		    case 16: // 연차
		    	for(var j = 0; j < 24; j++){
					$('#'+ memCd + '-' + String(j+1)).attr('class', 'r teamList')
				}
			break;
			case 18: // 환자 진료 일정
		    	for(var j = start; j < end; j++){
					$('#'+ memCd + '-' + String(j+1)).attr('class', 'y teamList')
					$('#'+ memCd + '-' + String(j+1)).attr('time', time)
				};
			break;
			case 25: // 개인 일정
		    	for(var j = start; j < end; j++){
					$('#'+ memCd + '-' + String(j+1)).attr('class', 'p teamList')
					$('#'+ memCd + '-' + String(j+1)).attr('time', time)
				};
		    break;
		    
		}
	}
});

$('.filter-btn').click(function(){
	let depCd = Number($('.select').val());
	let date = $('#datepicker').val();
	
	if(date.length == 0){
		alert('날짜를 입력 해주세요.')
	}else{
		let url;
		if(depCd==0){
			url = 'teamList?paramDate='+date
		}else{
			url = 'teamList?depCd='+depCd+'&&paramDate='+date
		}
			
		$('#hidden-link').attr('href', url)
		$('#hidden-link').get(0).click();
	}
});

$('.bottom').hover(
	function() { 
		let time = $(this).attr('time');
    	$( this ).append($( "<span style=\"font-size: 9px;\">" + time + "</span>" ))
 	}, function() {
    	$( this ).find( "span" ).last().remove()
  }
);