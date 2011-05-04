$(function() {
    $("textarea").autoGrow();
    $("#addcategory").click(function(element) {
        var target = $("#newcategory");
        var name = target.val();
        target.val("");
        $.getJSON(prefix+"/category/add", { name:name }, function(data) {
            $("#categories option").remove();
            var categories = $("#categories");
            $(data).each(function(key, value) {
                categories.append("<option value=\""+value.id+"\">"+value.name+"</option>");
            });
        });
        return false;
    });

    $("#addtag").click(function(element) {
        var target = $("#newtag");
        var name = target.val();
        target.val("");
        $.getJSON(prefix+"/tag/add", { name:name }, function(data) {
            $("#tags option").remove();
            var tags = $("#tags");
            $(data).each(function(key, value) {
                tags.append("<option value=\""+value.id+"\">"+value.name+"</option>");
            })
        });
        return false;
    });
});