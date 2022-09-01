var FormExcess = function () {

    //// basic validation
    var handleValidationExcess = function () {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var myform = $('#myform');
        var error1 = $('.alert-danger', myform);
        var success1 = $('.alert-success', myform);

        myform.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",  // validate all fields including form hidden input
            messages: {
                select_multi: {
                    maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                    minlength: jQuery.validator.format("At least {0} items must be selected")
                }
            },
            rules: {
                exc_dnno: {
                    minlength: 4,
                    required: true
                },
                exc_rcv_date: {
                    required: true
                },
                ei_name: {
                    required: true
                },
                rs_name: {
                    required: true
                },
                ip_id: {
                    required: true
                },
                exc_hosp_in: {
                    required: true
                },
                exc_hosp_out: {
                    required: true
                },
                exc_bill: {
                    required: true
                },
                exc_paid: {
                    required: true
                },
                exc_paid_hosp: {
                    required: true
                },
                exc_excess: {
                    required: true
                },
                efi_id: {
                    required: true
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit              
                success1.hide();
                error1.show();
                App.scrollTo(error1, -200);
            },

            errorPlacement: function (error, element) { // render error placement for each input type
                var icon = $(element).parent('.input-icon').children('i');
                icon.removeClass('fa-check').addClass("fa-warning");
                icon.attr("data-original-title", error.text()).tooltip({ 'container': 'body' });
            },

            highlight: function (element) { // hightlight error inputs

                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label, element) {
                var icon = $(element).parent('.input-icon').children('i');
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                icon.removeClass("fa-warning").addClass("fa-check");
            }
        });


    };

    return {
        //main function to initiate the module
        init: function () {
            handleValidationExcess();
        }

    };

}();

jQuery(document).ready(function () {
    FormExcess.init();
});