<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <style type="text/css">
        body{background :url(img/6.jpg);}
        /* title start */
        #title{width: 100%;height: 80px;
              background :rgba(0,0,0,0.2);
                font-size: 24px;
                 color:black;
                text-align:center; 
                line-height:80px;
        }
        /* title end */
        /* center start */
        .center{
            width:800px;
            height:600px;
            border:1px solid red;
            margin:100px auto 0;
        }
        
        /* linear-gradient(-45deg,#f00,blue,pink) */
        .center .c_head{
              width: 100%;
              height:  60px;
              
              background:rgba(0,0,0,0.5);
        }
        .center .c_center{
            width: 780px;
            height: 440px;
            background:rgba(255,255,255,0.2)
          padding:10px;
          overflow: auto;
        }
        .center .c_footer{
           width: 100%;
            height: 60px;
            background:pink;
        }
        /* center end */
        .center .c_center .rot{
             width:100%;
             overflow: hidden;
        }
        .center .c_center .rot span{
          width:50px;
          height:50px;
          background :url(img/2.png);
          display: inline-block;
          float:left;
        }
        
        .center .c_center .rot p{
           max-width:220px;
           float:left; 
           padding:8px;
           background:pink;
           border-radius: 8px;
           margin-left: 10px;
           
        }
        .center .c_center .my{
             width:100%;
             overflow: hidden;
        }
        .center .c_center .my span{
          width:50px;
          height:50px;
          background :url(img/2.png);
          display: inline-block;
          float:right;
        }
        
        .center .c_center .my p{
           max-width:220px;
           float:right; 
           padding:8px;
           background:yellow;
           border-radius: 8px;
           margin-right: 10px;
           
        }
        #text{
           width:  640px;
           height: 50px;
           outline:no;
           text-indent:20px;
           font-size:18px;
           background:pink; 
           border:no;
        }
         #btn{
           width:  100px;
           height: 50px;
           background:pink;
           border:no;
        }
        #text{
           width:  640px;
           height: 50px;
           outline:no;
           text-indent:20px;
           font-size:18px;
           background:pink; 
           border:no;
        }
         #btn{
           width:  100px;
           height: 50px;
           background:pink;
           border:no;
        }
        
        
   </style>
</head>
<body>
   <!-- title start -->
    <div id="title">阿暖人工机器智障</div>
   <!-- title end -->
   <!-- center start -->
    <div class="center">
       <div class="c_head"></div>
       <div class="c_center">
           <div class="rot">
              <span></span>
              <p>你好</p>
           </div> 
          
      </div>
       <div class="c_footer">
           <input type="text" id="text">
            <input type="button" id="btn" value="发送">
       </div>
    </div>
    <!-- center end -->
   <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
       $("#btn").click(function(){
    	   //获取输入的内容  
          var text=$("#text").val();
           //传递给后台
          if(text==""||text==null){
        	  return;
        	  
          }else{
        	  
        	  var my="<div class='my'><span></span><p>"+text+"</p></div>";
              $(".c_center").append(my);  
        	  $("#text").val("");
        	  $("#text").focus();
        	  $(".c_center").scrollTop(9999999999999999);
        	  $.ajax({
           	   //传递的地址
           	   url:"chart",
           	   type:"post",
           	   data:{"text":text},
           	   success:function(result){
           		  
           		   var obj="<div class='rot'><span></span><p>"+result+"</p></div>";
                   $(".c_center").append(obj);                   
                   $(".c_center").scrollTop(9999999999999999);
           	   }
              });
        	  
          } 
           
       });
       
       $(document).keydown(function(event){
    	   if(event.keyCode==13){
    		   var text=$("#text").val();
               //传递给后台
              if(text==""||text==null){
            	  return;
            	  
              }else{
            	  
            	  var my="<div class='my'><span></span><p>"+text+"</p></div>";
                  $(".c_center").append(my);  
            	  $("#text").val("");
            	  $("#text").focus();
            	  $(".c_center").scrollTop(9999999999999999);
            	  $.ajax({
               	   //传递的地址
               	   url:"chart",
               	   type:"post",
               	   data:{"text":text},
               	   success:function(result){
               		  
               		   var obj="<div class='rot'><span></span><p>"+result+"</p></div>";
                       $(".c_center").append(obj);                   
                       $(".c_center").scrollTop(9999999999999999);
               	   }
                  });
            	  
              } 
    	   }
    	   
       });
    
    </script>
</body>
 
</html>