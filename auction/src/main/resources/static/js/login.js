/**
 * 
 */

 $(function() {
    $("#log_btn").click(function() {
        var userID       = $("#login #user_ID");
        var passwd       = $("#login #user_Passwd");

        var userIDMsg           = "아이디를 입력하세요.";
        var passwdMsg           = "비밀번호를 입력하세요.";

        /* userID  */
        if( !$.trim( userID.val() ) ) {
            alert(userIDMsg);
            userID.focus();
            return false;
        }
        
        /* passwd  */
        if( !$.trim( passwd.val() ) ) {
            alert(passwdMsg);
            passwd.focus();
            return false;
        }
    });
});
 
 /* register */
 $(function() {
     $("#reg_btn").click(function() {
         var userID       = $("#register #user_ID");
         var passwd       = $("#register #user_Passwd");
         var repasswd     = $("#repasswd");
         var userName     = $("#user_Name");
         var userEmail    = $("#user_Email");
         var userDomain   = $("#user_Domain");
         var userAddr	  = $("#user_Addr");
         var userPhone    = $("#user_Phone");

         var userIDMsg           = "아이디이이를 입력하세요.";
         var passwdMsg           = "비밀번호를 입력하세요.";
         var repasswdMsg         = "비밀번호 확인을 입력하세요."
         var passwdConfirmMsg    = "비밀번호가 일치하지 않습니다.";
         var userNameMsg         = "이름을 입력하세요.";
         var userEmailMsg        = "이메일을 입력하세요";
         var userDomainMsg       = "도메인을 입력하세요";
         var userAddrMsg		 = "주소를 입력하세요";
         var userPhoneMsg        = "연락처를 입력하세요.";

     
         /* userName  */
         if( !$.trim( userName.val() ) ) {
             alert(userNameMsg);
             userName.focus();
             return false;
         }
         
         /* userID  */
         if( !$.trim(userID.val()) ) {
             alert(userIDMsg);
             userID.focus();
             return false;
         }

         // if( checkValue(!$.trim( userID.val())) == false ) {
         //     alert("아이디는 영어 + 숫자 + 7이상 14이하로 입력하셔야 합니다.");
         //     userID.val("");
         //     userID.focus();
         //     return false;
         // }

         /* passwd  */
         if( !$.trim( passwd.val() ) ) {
             alert(passwdMsg);
             passwd.focus();
             return false;
         }

         /* repasswd  */
         if( !$.trim( repasswd.val() ) ) {
             alert(repasswdMsg);
             repasswd.focus();
             return false;
         }

         /* passwd != repasswd  */
         if( $.trim( passwd.val() ) != $.trim( repasswd.val() ) ) {
             alert(passwdConfirmMsg);
             passwd.val("");
             repasswd.val("");
             passwd.focus();
             return false;
         }

         /* userEmail  */
         if( !$.trim( userEmail.val() ) ) {
             alert(userEmailMsg);
             userEmail.focus();
             return false;
         }

         /* userDomain  */
         if( !$.trim( userDomain.val() ) ) {
             alert(userDomainMsg);
             userDomain.focus();
             return false;
         }
         
         /* userDomain  */
         if( !$.trim( userAddr.val() ) ) {
        	 alert(userAddrMsg);
        	 userAddr.focus();
        	 return false;
         }

         /* userPhone  */
         if( !$.trim( userPhone.val() ) ) {
             alert(userPhoneMsg);
             userPhone.focus();
             return false;
         }

         /* 14자리 + 영어 + 숫자만 허용하는 함수 */
         function checkValue(data) { /* data = id */
             var exp1 = /^[a-z0-9]{7,14}$/;
             var exp2 = /[a-z]/g;
             var exp3 = /[0-9]/g;

             return ( exp1.test(data) && exp2.test(data) && exp3.test(data) );
         }
     });
 });

 /* url select */
 $(function() {
     $('#url').change(function() {
         var data = $(this).val();
         if( data == '1' ) {
             $('#user_Domain').val("");
             $('#user_Domain').attr('readonly', false);
             $('#user_Domain').focus();
         } else {
             $('#user_Domain').val( data );
             $('#user_Domain').attr('readonly', true);
         }
     });
 });

 /* language exception */
 $(function() {
 	$('#register #user_ID').blur(function() {
 		var userID = $.trim( $('#user_ID').val() );
 		var hangul = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
 		
 		if( hangul.test(userID) ) {
 			alert('아이디에 한글은 사용하실 수 없습니다.');
 			$('#user_ID').val('');
 			$('#user_ID').focus();
 			
 			return false;
 		}
 	});
 });

 $(function() {
 	$('#user_Name').blur(function() {
 		var userName = $.trim( $('#user_Name').val() );
 		var eng = /[a-zA-Z0-9]/; // 사용할 때 test
 		
 		if( eng.test(userName) ) {
 			alert('이름은 한글로 입력해주세요.');
 			$('#user_Name').val('');
 			$('#user_Name').focus();
 			return false;
 		}
 	});
 });


 /* ID exception */
 $(function() {
 	 $('#register #user_ID').blur(function() {
 		 $.ajax({
 			type: 'post',
 			url: '/users/idCheck',
 			data: { user_ID : $(this).val() },
 			success: function(data) {
 				if( $.trim(data) == "YES" ){
 					$('#checked').html(' 사용할 수 있는 아이디 입니다.');
// 					return false;
 				} else {
 					$('#checked').html(' 사용중인 아이디 입니다.');
 					$('#register #user_ID').val('');
 					$('#register #user_ID').focus();
// 					return false;
 				}
 			},
 			error : function() {
 				alert('시스템에러');
 			}
 		});	
 	});
 });