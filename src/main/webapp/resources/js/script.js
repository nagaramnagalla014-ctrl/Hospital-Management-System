$(document).ready(function () {

    // Confirm delete actions
    $('.btn-delete').on('click', function (e) {
        if (!confirm('Are you sure you want to delete this record? This action cannot be undone.')) {
            e.preventDefault();
        }
    });

    // Auto-dismiss alerts after 5 seconds
    setTimeout(function () {
        $('.alert-dismissible').fadeOut('slow');
    }, 5000);

    // Set today as minimum date for appointment booking
    var today = new Date().toISOString().split('T')[0];
    $('input[name="appointmentDate"]').attr('min', today);

    // Highlight table rows on hover for all tables
    $('.table-hover tbody tr').on('mouseenter', function () {
        $(this).addClass('info');
    }).on('mouseleave', function () {
        $(this).removeClass('info');
    });

    // Search input - trigger on Enter key
    $('input[name="search"]').on('keypress', function (e) {
        if (e.which === 13) {
            $(this).closest('form').submit();
        }
    });

    // Tooltip initialization
    $('[title]').tooltip({ placement: 'top', trigger: 'hover' });
});
