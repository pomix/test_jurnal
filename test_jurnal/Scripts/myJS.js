$(document).ready(function(){
    var dData;
    $.ajax({
        type: "GET",
        url: 'Home/GetRaspisanie',
        dataType: "json",
        success: function (data) {
            dData = data;
            console.log(data.length);
            for (var i = 0; i < data.length; i++) {
                if (data[i].Нижняя_неделя == true)
                {
                    var d = "." + data[i].День_недели + data[i].Номер_пары + "R";
                    $(d).append(
                        "<td>" +
                        data[i].Название + " (ауд." + data[i].Номер_аудитории + ") " + data[i].Тип_занятия.substring(0, 3)+
                        "/td"
                        )
                }
                else if(data[i].Верхняя_неделя == true)
                {
                    var d = "." + data[i].День_недели + data[i].Номер_пары + "R";
                    $(d).append(
                        "<td></td>")
                }
                else
                {
                    var d = "." + data[i].День_недели + data[i].Номер_пары;
                    $(d).text(data[i].Название + " (ауд." + data[i].Номер_аудитории + ") " + data[i].Тип_занятия.substring(0, 3));
                }
                
                
            }
        }
    });
    $('.zagruzka-grup').on('click', function () {
        $.post('Home/PostGrup', {str:$('[name="Группа1"]').val()}, function (response) {
             $('.zagruzka-contenta').append(response);
        });
        //$.ajax({
        //    type: "POST",
        //    url: 'Home/PostGrup',
        //    data:{str:$('[name="Группа1"]').val()},
        //    dataType: "xml",
        //    success: function (data) {
        //        $('zagruzka-contenta').append(data);
        //    }
        //})
    })
    $('#addForm').submit(function (event) {
        event.preventDefault();
        var data = $(this).serialize();
        $.post('Home/AddStudi', data, function (response) {
            $('#comments').append(response);
        });
    });
    $('td.zapis').on('click', function () {
        $(this).removeClass('zapis');
        var val = $(this).attr('class');
        $(this).addClass('zapis');
        var day = String(val).substring(0, 1);
        var num = String(val).substring(1, 2);
        $('[name = "Название"]').val(null);
         $('[name = "Номер_аудитории"]').val(null);
         $('[name = "Верхняя_неделя"]').val(null);
         $('[name = "Нижняя_неделя"]').val(null);
         $('[name = "Группа1"]').val(null);
         $('[name = "Группа2"]').val(null);
         $('[name = "Группа3"]').val(null);
         $('[name = "Подгруппа"]').val(null);
         $('[name = "id_расписания"]').val(null);
         $('[name = "День_недели"]').val(Number(day));
         $('[name = "Номер_пары"]').val(Number(num));
        for (var i = 0; i < dData.length; i++) {
            if(Number(dData[i].День_недели)==Number(day))
            {
                if(Number(dData[i].Номер_пары)==Number(num))
                {
                    $('[name = "Название"]').val(dData[i].Название);
                    $('[name = "Номер_аудитории"]').val(dData[i].Номер_аудитории);
                    $('[name = "Тип_занятия"]').val(dData[i].Тип_занятия);
                    $('[name = "Верхняя_неделя"]').val(dData[i].Верхняя_неделя);
                    $('[name = "Нижняя_неделя"]').val(dData[i].Нижняя_неделя);
                    $('[name = "Группа1"]').val(dData[i].Группа1);
                    $('[name = "Группа2"]').val(dData[i].Группа2);
                    $('[name = "Группа3"]').val(dData[i].Группа3);
                    $('[name = "Подгруппа"]').val(dData[i].Подгруппа);
                    $('[name = "id_расписания"]').val(dData[i].id_расписания);

                    break;
                }
            }
        }

        
        console.log(dData)
    })

    var divs = $('.block-day');
    var as = $('div.panel-heading a');
    console.log("asdf",as);
    var dateValue = new Date();
    var now = new Date();
    now.setDate(now.getDate()-now.getDay())
    for(var i=1;i<=divs.length;i++)
    {
       
        if (i == 1)
        {
            $(as[i-1]).text((now.getDate() + 1) + "." + (now.getMonth() + 1) + "." + now.getFullYear());
        }
        if (i == dateValue.getDay()) {
            $(divs[i-1]).removeClass("panel-default");
            $(divs[i-1]).addClass("panel-success");
        }
        $(as[i]).text((now.getDate()+2) + "." + (now.getMonth() + 1) + "." + now.getFullYear());
        now.setUTCDate(now.getDate() +1)
    }
    $('#back-day').click(function () {
        console.log(now.getDate())
        now.setUTCDate(now.getDate() - 14)

        for (var i = 1; i <= divs.length; i++) {
            if (i == 1) {
                $(as[i - 1]).text((now.getDate() + 1) + "." + (now.getMonth() + 1) + "." + now.getFullYear());
            }
            $(as[i]).text((now.getDate()+2) + "." + (now.getMonth() + 1) + "." + now.getFullYear());
            now.setUTCDate(now.getDate() + 1)
        }
        $('[class="panel-collapse collapse in"]').removeClass("in");
    })
    $('#next-day').click(function () {
        for (var i = 1; i <= divs.length; i++)
        {
            if (i == 1) {
                $(as[i - 1]).text((now.getDate() + 1) + "." + (now.getMonth() + 1) + "." + now.getFullYear());
            }
            $(as[i]).text((now.getDate()+2) + "." + (now.getMonth() + 1) + "." + now.getFullYear());
            now.setUTCDate(now.getDate() + 1)
        }
        $('[class="panel-collapse collapse in"]').removeClass("in");
    })
    $('#sub').submit(function (event) {    

        event.preventDefault();
        var url = '/Home/FileXL';
        var data = $(this).serialize();
    
        $.post(url, { str: $('#textGrup').val(), file: $('#textGrup').file}, function (response) { })

        
    })
    $("input.ac").autocomplete({
        source: '/Home/AutocompleteSearchGrup',
        minLength: 2
    })
    $("input#namePredmet").autocomplete({
        source: '/Home/AutocompleteSearchPredmet',
        minLength: 2
    })

        var autocompleteUrl = '/Home/AutocompleteSearch';
        $("input#tokenfield").autocomplete({
            source: autocompleteUrl,
            minLength: 2,
            select: function (event, ui) {
                $('[name = Код_предмета]').val(ui.label);
            }
        })

    $(as).click(function () {
        console.log($(" div.panel-body"));
        var now1 = $(this).text()
        var url = '/Home/AddComment';
        $.post(url, { Comment: now1 }, function (response) {
            $("div.panel-body").text(response);
        });
    })
    //$('#commentForm').submit(function (event) {
    //    event.preventDefault();
    //    var data = $(this).serialize();
    //    var url = $(this).attr('action');
    //    $.post(url, data, function (response) {
            
    //    });
    //});

})
