$(document).ready(function(){
    $('#scrollToTop').hide();

    if (window.location.hash === '#openModal') {
        $('#addUserModal').modal('show');;
    }

    $(window).scroll(function(){
        if ($(this).scrollTop() > 75) {
            $('#scrollToTop').fadeIn();
        } else {
            $('#scrollToTop').fadeOut();
        }
    });

    $('#scrollToTop').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });

    $('#addUseratTable').click(function(){
        $('#addUserModal').modal('show');
    });

    var $userName = $('#inputFirstName');
    var $userLastName = $('#inputLastName');
    var $userRole = $('#inputRole');
    var $team = $('#inputTeamRole');
    var $email = $('#inputEmail');
    var $active = $('#inputActive');
    var $password = $('#inputPassword');

    $("#submitButtonForForm").click(function(){
        event.preventDefault();
        var userName = $userName.val();
        var userLastName = $userLastName.val();
        var userRole = $userRole.val();
        var teamMember = $team.val();
        var email = $email.val();
        var active = $active.val();
        var password = $password.val();

        $.ajax({
            type: 'POST',
            url: '/user/saveAjaxJson',
            contentType: 'application/json',
            data: JSON.stringify({
                userName:userName,
                userLastName:userLastName,
                userRole:userRole,
                teamMember:teamMember,
                email: email,
                active:active,
                password:password
            }),
            success: function (response) {
                if (response === false){
                    alert("Email daha önce kullanılmış !")
                }else {
                    alert('Başarılı :)')
                    $('#addUserModal').modal('hide');
                }
            },
            error: function () {
                alert('Kullanıcı eklerken beklenmedik hata :(');
            }
        })
    });

    $("#showUserListAjax").click(function () {
        $.ajax({
            type: "post",
            url: "/returnUserList",
            cache: false,
            success: function(response){
                alert('User listesi gösterimi başarılı')
                console.log(response)
                $("#content").html("");
                $("#content").append(response);
            },
            error: function(){
                alert('Error while request..');
            }
        });
    })


    $("#User_Name").autocomplete({
        source: function (request, response) {
            $.getJSON("${pageContext.request.contextPath}/user/userNamesAutoComplete", {
                term: request.term
            }, response);
        },
        minLength:2
    });
});
