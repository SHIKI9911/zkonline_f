$(function(){
    //个人资料修改密码
    $('#jsUserResetPwd').on('click', function(){
        Dml.fun.showDialog('#jsResetDialog', '#jsResetPwdTips');
    });
    $('#jsResetPwdBtn').click(function(){
        $.ajax({
            cache: false,
            type: "POST",
            dataType:'json',
            url:"/users/update/pwd/",
            data:$('#jsResetPwdForm').serialize(),
            async: true,
            success: function(data) {
                if(data.password1){
                    Dml.fun.showValidateError($("#pwd"), data.password1);
                }else if(data.password2){
                    Dml.fun.showValidateError($("#repwd"), data.password2);
                }else if(data.__all__){
                    Dml.fun.showValidateError($("#repwd"), data.__all__);
                }else if(data.status == "success"){
                    Dml.fun.showTipsDialog({
                        title:'提交成功',
                        h2:'修改密码成功，请重新登录!',
                    });
                    Dml.fun.winReload();
                }else if(data.msg){
                    Dml.fun.showValidateError($("#pwd"), data.msg);
                    Dml.fun.showValidateError($("#repwd"), data.msg);
                }
            }
        });
    });

    //个人资料头像
    $('.js-img-up').uploadPreview({ Img: ".js-img-show", Width: 94, Height: 94 ,Callback:function(){
        $('#jsAvatarForm').submit();
    }});


    //input获得焦点样式
    $('.perinform input[type=text]').focus(function(){
        $(this).parent('li').addClass('focus');
    });
    $('.perinform input[type=text]').blur(function(){
        $(this).parent('li').removeClass('focus');
    });


    verify(
        [
            {id: '#username', tips: Dml.Msg.epNickName, require: true},
            {id: '#real_name', tips: Dml.Msg.epName, require: true},
            {id: '#mobile', tips: Dml.Msg.epPhone, require: true},
            {id: '#email', tips: Dml.Msg.epMail, require: true}
        ]
    );


    //保存个人资料
    $('#jsEditUserBtn').on('click', function(){
        var _self = $(this),
            $jsEditUserForm = $('#jsEditUserForm')
            verify = verifySubmit(
            [
                {id: '#username', tips: Dml.Msg.epNickName, require: true},
                {id: '#real_name', tips: Dml.Msg.epName, require: true},
                {id: '#mobile_number', tips: Dml.Msg.epPhone, require: true},
                {id: '#email', tips: Dml.Msg.epMail, require: true}
            ]
        );
        if(!verify){
           return;
        }
        $.ajax({
            cache: false,
            type: 'post',
            dataType:'json',
            url:"/users/info/",
            data:$jsEditUserForm.serialize(),
            async: true,
            beforeSend:function(XMLHttpRequest){
                _self.val("保存中...");
                _self.attr('disabled',true);
            },
            success: function(data) {
                if(data.username){
                    _showValidateError($('#username'), data.user_name);
                }else if(data.real_name){
                   _showValidateError($('#real_name'), data.real_name);
                }else if(data.mobile){
                   _showValidateError($('#mobile_number'), data.mobile);
                }else if(data.mail){
                   _showValidateError($('#email'), data.email);

                }else if(data.status == "fail"){
                     Dml.fun.showTipsDialog({
                        title: '保存失败',
                        h2: data.msg
                    });
                }else if(data.status == "success"){
                    alert("保存成功");
                    setTimeout(function(){window.location.href = window.location.href;},1500);
                }
            },
            complete: function(XMLHttpRequest){
                _self.val("保存");
                _self.removeAttr("disabled");
            }
        });
    });


});