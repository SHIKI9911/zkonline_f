# zkonline_f
运行环境：
mysql==5.27 
django==2.2
python==3.8
windows10

使用方法：
1、将sql文件导入至mysql数据库中，在settings.py中的DATABASE中将mysql的账号密码修改成你自己的账号密码
2、在命令行中进入到项目主目录，即含有requirements.txt的目录，然后运行pip install -r requirements.txt
3、运行本项目，在浏览器中输入127.0.0.1:8000/index进入网站主页，127.0.0.1:8000/xadmin进入项目的后台。超级管理员的账号为root，密码为654321
