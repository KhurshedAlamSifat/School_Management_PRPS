$(document).ready(function () {
    load();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args) {
        load();
    }
});
function load() {
    $("#btnSave,#btnEdit,#btnSchoolInfo").on('click', function () {
        $(".message").slideDown('slow');
        $(".message").delay(5000).fadeOut(2000);
    });
    var lan;
    var cookie = getCookieValue("CurrentLanguage");
    if (cookie == 'bn-BD')
    {
        lan = "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Bangla.json";
    }
    else
    {
        lan = "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/English.json";
    }
    var table = $('#example1').DataTable().destroy();
    table = $('#example1').DataTable({
        "language": {
            "url": lan
        },
        //"lengthMenu": [[ -1,10, 25, 50,100], [ "All",10, 25, 50,100]],
        "paging": false,
        "lengthChange": false,
        "searching": true,
        "ordering": true,
        "info": true,
        "scrollY": "300px",
        "scrollX": "auto",
        "scrollCollapse": false,
        "autoWidth": true
    });
    var table1 = $('#dtprint').DataTable().destroy();
    table1 = $('#dtprint').DataTable({
        "language": {
            "url": lan
        },
       "lengthMenu": [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]],
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });

    var tablePayment = $('#dtPayment').DataTable().destroy();
    tablePayment = $('#dtPayment').DataTable({
        "language": {
            "url": lan
        },
        //"lengthMenu": [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]],
        "paging": false,
        "lengthChange": false,
        "searching": true,
        "ordering": true,
        "info": true,
        "scrollY": "300px",
        "scrollX": "auto",
        "scrollCollapse": false,
        "autoWidth": true,
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "footerCallback": function (row, data, start, end, display) {
            var api = this.api(), data;
            var intVal = function (i) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '') * 1 :
                    typeof i === 'number' ?
                    i : 0;
            };
           
            // Total over all pages
            total = api
                .column(8)
                .data()
                .reduce(function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0);

            // Total over this page
            pageTotal = api
                .column(8, { page: 'current' })
                .data()
                .reduce(function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0);

            // Update footer
            $(api.column(8).footer()).html(pageTotal + '(' + total + ')'
            );
        }
    });
    var tablePayment = $('#dtPaymentSummery').DataTable().destroy();
    tablePayment = $('#dtPaymentSummery').DataTable({
        "language": {
            "url": lan
        },
        "lengthMenu": [[-1, 10, 25, 50, 100], ["All", 10, 25, 50, 100]],
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "footerCallback": function (row, data, start, end, display) {
            var api = this.api(), data;
            var intVal = function (i) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '') * 1 :
                    typeof i === 'number' ?
                    i : 0;
            };

            // Total over all pages
            total = api
                .column(6)
                .data()
                .reduce(function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0);

            // Total over this page
            pageTotal = api
                .column(6, { page: 'current' })
                .data()
                .reduce(function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0);

            // Update footer
            $(api.column(6).footer()).html(pageTotal + '(' + total + ')'
            );
        }
    });
}

function getCookieValue(name) {
    cookieList = document.cookie.split('; ');
    cookies = {};
    for (i = cookieList.length - 1; i >= 0; i--) {
        cookie = cookieList[i].split('=');
        cookies[cookie[0]] = cookie[1];
    }
    return cookies[name];
}

$('li a').each(function () {
    if ($($(this))[0].href == String(window.location)) {
        $(this).parent().addClass('active');
    }
});
$('li ul li a').each(function () {
    if ($($(this))[0].href == String(window.location)) {
        $(this).parent().addClass('active');
        $(this).parent().parent().show();
    }
});

