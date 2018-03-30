var moveFlag = true;
function wrapScroll(){
    var footHei = parseFloat(document.querySelector("#footer").style.height);
    var headerHei =  $(".headerNav").height();
    var cliHei = document.documentElement.clientHeight;
    if($(".headerNav").length > 0){
    	document.querySelector("#wrapBox").style.height = cliHei - headerHei - (footHei*20) + 'px';
    }else{
    	document.querySelector("#wrapBox").style.height = cliHei - (footHei*20) + 'px';
    }
    
    myScroll = new iScroll("wrapBox", {
        checkDOMChanges: true,
        vScrollbar:false,
        hScrollbar : false,

        onScrollMove:function(){
            moveFlag = false;
        },
        onScrollEnd:function(){
            moveFlag = true;
        }
    });
}
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
function piPeiIndex(){
    $(".comTabA input").each(function(i){
        if($(".comTabA input").eq(i).val() == $("#navFlag").val()){
            $(".comTabA").eq(i).addClass("aui-active")
        }
    });
}