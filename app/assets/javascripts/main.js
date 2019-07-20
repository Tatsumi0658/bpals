$(function(){
  $('input[name="images"]').change(function(){
    var result = $(this).val();
    console.log(result);
    if(result == "0"){
      document.getElementById("post-image__0").style.display="block";
    }else{
      document.getElementById("post-image__0").style.display="none";
    };

    if(result == "1"){
      document.getElementById("post-image__1").style.display="block";
    }else{
      document.getElementById("post-image__1").style.display="none";
    };

    if(result == "2"){
      document.getElementById("post-image__2").style.display="block";
    }else{
      document.getElementById("post-image__2").style.display="none";
    };
  });
});
