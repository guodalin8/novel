function check(form){
   var ReaderName=loginform.ReaderName.value;
   var Password=loginform.Password.value;
   if(ReaderName.length==""){
  		alert("请输入昵称");
  		return false;
  		}
   var letters='*,#,$,&';
      for (var i = 0; i <ReaderName.length; i++) {
          var ch=ReaderName.charAt(i);
          if (letters.indexOf(ch)>-1) {
              alert('用户名包含非法字符');
              return false;
          }
      }
    if(ReaderName.length>12){
         alert("用户名必须小于十二位");
         return false;
             }
  if(Password.length==""){
  		alert("请输入密码");
  		return false;
  		}
  if(Password.length<3){
      alert("密码安全系数太低");
      return false;
          }
}