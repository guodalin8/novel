function check(form){
   var authorName=loginform.AuthorName.value;
   var authorPassword=loginform.Password.value;
   if(authorName.length==""){
  		alert("请输入昵称");
  		return false;
  		}
   var letters='*,#,$,&';
      for (var i = 0; i <authorName.length; i++) {
          var ch=authorName.charAt(i);
          if (letters.indexOf(ch)>-1) {
              alert('用户名包含非法字符');
              return false;
          }
      }
    if(authorName.length>12){
         alert("用户名必须小于十二位");
         return false;
             }
  if(authorPassword.length==""){
  		alert("请输入密码");
  		return false;
  		}
  if(authorPassword.length<3){
      alert("密码安全系数太低");
      return false;
          }
}