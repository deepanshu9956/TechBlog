function doLike(pid,uid){
    const d={
        uid: uid,
        pid: pid,
        operation: 'like'
    }
    $.ajax({
        url: "likeservlet",
        data: d,
        success: function(data,textstatus,jqxhr){
            console.log("f");
            let c=$(".like-counter").html();
            console.log(c);
            c++;
            $('.like-counter').html(c);
            let i=$("#"+pid).html();
            i++;
            $('#'+pid).html(i);
        },
        error: function(data,textstatus,jqxhr){
            console.log(data);
        }
    })
}