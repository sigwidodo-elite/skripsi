var FormValidation = function () {
    var movement = function () {
        var e = $("#form_movement"),
            r = $(".alert-danger", e),
            i = $(".alert-success", e);
        e.validate({
            errorElement: "span",
            errorClass: "help-block help-block-error",
            focusInvalid: !1,
            ignore: "",
            rules: {
                movement: { required: !0 },
                effectivedate: { required: !0 }
            },
            invalidHandler: function (e, t) {
                i.hide(),
                r.show(),
                App.scrollTo(r, -200)
            },
            errorPlacement: function (e, r) {
                var i = $(r).parent(".input-icon").children("i");
                i.removeClass("fa-check").addClass("fa-warning"),
                i.attr("data-original-title", e.text()).tooltip({ container: "body" })
            },
            highlight: function (e) {
                $(e).closest(".form-group").removeClass("has-success").addClass("has-error")
            },
            unhighlight: function (e) { },
            success: function (e, r) {
                var i = $(r).parent(".input-icon").children("i");
                $(r).closest(".form-group").removeClass("has-error").addClass("has-success"),
                i.removeClass("fa-warning").addClass("fa-check")
            },
            submitHandler: function (e) {
                i.show(),
                r.hide(),
                e[0].submit()
            }
        }),
        $(".date-picker").datepicker({ rtl: App.isRTL(), autoclose: !0 }),
        $(".date-picker .form-control").change(function () { e.validate().element($(this)) })
    },

   
      t = function () {
          jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({
              stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
          })
      }; return {
          init: function () {
              movement()
          }
      }
}(); jQuery(document).ready(function () { FormValidation.init() });