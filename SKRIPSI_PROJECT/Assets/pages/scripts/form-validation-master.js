var FormValidation = function () {
    var  masterEducation = function () {
        var e = $("#form_master_education"),
            r = $(".alert-danger", e),
            i = $(".alert-success", e);
        e.validate({
            errorElement: "span",
            errorClass: "help-block help-block-error",
            focusInvalid: !1,
            ignore: "",
            rules: {
                educationlevel: { minlength: 3, required: !0 },
                educationcode: { minlength: 2, required: !0 },
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
        })
    },


     masterEmpStatus = function () {
         var e = $("#form_master_emp_status"),
             r = $(".alert-danger", e),
             i = $(".alert-success", e);
         e.validate({
             errorElement: "span",
             errorClass: "help-block help-block-error",
             focusInvalid: !1,
             ignore: "",
             rules: {
                 employeestatus: { minlength: 3, required: !0 },
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
         })
     },


     masterJobTitle = function () {
         var e = $("#form_master_job_title"),
             r = $(".alert-danger", e),
             i = $(".alert-success", e);
         e.validate({
             errorElement: "span",
             errorClass: "help-block help-block-error",
             focusInvalid: !1,
             ignore: "",
             rules: {
                 jobtitle: { minlength: 3, required: !0 },
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
         })
     },


     masterOrganization = function () {
         var e = $("#form_master_organization"),
             r = $(".alert-danger", e),
             i = $(".alert-success", e);
         e.validate({
             errorElement: "span",
             errorClass: "help-block help-block-error",
             focusInvalid: !1,
             ignore: "",
             rules: {
                 structure: { minlength: 3, required: !0 },
                 structuretype: { required: !0 },
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
         $(".select2me", e).change(function () { e.validate().element($(this)) })
     },


     masterEthnic = function () {
         var e = $("#form_master_ethnic"),
             r = $(".alert-danger", e),
             i = $(".alert-success", e);
         e.validate({
             errorElement: "span",
             errorClass: "help-block help-block-error",
             focusInvalid: !1,
             ignore: "",
             rules: {
                 ethnic: { minlength: 3, required: !0 },
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
         })
     },


      masterClearence = function () {
          var e = $("#form_master_clearence_item"),
              r = $(".alert-danger", e),
              i = $(".alert-success", e);
          e.validate({
              errorElement: "span",
              errorClass: "help-block help-block-error",
              focusInvalid: !1,
              ignore: "",
              rules: {
                  item: { minlength: 3, required: !0 },
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
          })
      },


      masterRelation = function () {
          var e = $("#form_master_fam_relation"),
              r = $(".alert-danger", e),
              i = $(".alert-success", e);
          e.validate({
              errorElement: "span",
              errorClass: "help-block help-block-error",
              focusInvalid: !1,
              ignore: "",
              rules: {
                  relationName: { minlength: 3, required: !0 },
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
          })
      },


      masterFunctional = function () {
          var e = $("#form_master_functional"),
              r = $(".alert-danger", e),
              i = $(".alert-success", e);
          e.validate({
              errorElement: "span",
              errorClass: "help-block help-block-error",
              focusInvalid: !1,
              ignore: "",
              rules: {
                  functional: { minlength: 3, required: !0 },
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
          })
      },


      masterStructure = function () {
          var e = $("#form_master_structure"),
              r = $(".alert-danger", e),
              i = $(".alert-success", e);
          e.validate({
              errorElement: "span",
              errorClass: "help-block help-block-error",
              focusInvalid: !1,
              ignore: "",
              rules: {
                  structure: { minlength: 3, required: !0 },
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
          })
      },


      masterLocation = function () {
          var e = $("#form_master_location"),
              r = $(".alert-danger", e),
              i = $(".alert-success", e);
          e.validate({
              errorElement: "span",
              errorClass: "help-block help-block-error",
              focusInvalid: !1,
              ignore: "",
              rules: {
                  location: { minlength: 3, required: !0 },
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
          })
      },

      movement = function () {
          var e = $("#form_movement"),
              r = $(".alert-danger", e),
              i = $(".alert-success", e);
          e.validate({
              errorElement: "span",
              errorClass: "help-block help-block-error",
              focusInvalid: !1,
              ignore: "",
              rules: {
                  location: { minlength: 3, required: !0 },
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
          })
      },

      t = function () {
          jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({
              stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
          })
      }; return {
          init: function () {
              masterEducation(),
              masterEmpStatus(),
              masterJobTitle(),
              masterOrganization(),
              masterEthnic(),
              masterClearence(),
              masterRelation(),
              masterFunctional(),
              masterStructure(),
              movement()

          }
      }
}(); jQuery(document).ready(function () { FormValidation.init() });