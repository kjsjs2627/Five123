var totalData = 100;    // 총 데이터 수
var dataPerPage = 14;    // 한 페이지에 나타낼 데이터 수
var pageCount = 5;        // 한 화면에 나타낼 페이지 수
function paging(totalData, dataPerPage, pageCount, currentPage){
	   
    
    var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
    var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
    
    
    var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
    if(last > totalPage)
        last = totalPage;
    var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
    var next = last+1;
    var prev = first-1;
 

    var $pingingView = $("#paging");
    
    var html = "";
    
    if(prev > 0)
        html += "<li><a href=# id='prev'><span>«</span></a></li> ";
    
    for(var i=first; i <= last; i++){
        html += "<li><a href='#'" +"id=" + i + ">" + i + "</a></li> ";
    }
    
    if(last < totalPage)
        html += "<li><a href=# id='next'><span>»</span></a></li>";
   	
	 
    $("#paging").html(html);    // 페이지 목록 생성
    $("#paging a").css("color", "black");
    $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                       "color":"#07031A", 
                                       "font-weight":"bold",
                                       "background-color":"#FFCB74"});    // 현재 페이지 표시
                                       
    $("#paging a").click(function(){
        
        var $item = $(this);
        var $id = $item.attr("id");
        var selectedPage = $item.text();
        
        if($id == "next")    selectedPage = next;
        if($id == "prev")    selectedPage = prev;
        
        paging(totalData, dataPerPage, pageCount, selectedPage);
       	console.log(selectedPage);
    });
                                       

}