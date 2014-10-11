AiitecOpenAPI
=============
第一次提交

mac下批量删除.svn文件

rm -rf 目录名字
-r 就是向下递归，不管有多少级目录，一并删除
-f 就是直接强行删除，不作任何提示的意思
打开终端，cd …命令进入到.svn所在的文件夹。

输入：find . -name ".svn"  -exec rm -Rf {} \; 回车
——————————————————————————————————————————————————————

#Xcode帮助文档目录： 
/Users/iMac/Library/Developer/Shared/Documentation/DocSets

cd /svnonline/github.com/AiitecOpenAPI/AiitecOpenAPISource
ls
appledoc -o ../documentation --project-name AiitecOpenAPI --project-company “爱特安为” --company-id com.aiitec ./AiitecOpenAPISource/AiitecOpenAPI/
或［生成html］
appledoc --no-create-docset --output ../documentation --project-name AiitecOpenAPI --project-company "爱特安为" --company-id com.aiitec ./AiitecOpenAPISource/AiitecOpenAPI/




cd /svnonline/github.com/AiitecOpenAPI/AiitecOpenAPIDemo/AiitecOpenAPIDemo/Supporting\ Classes/
cp -R /Users/iMac/Library/Developer/Xcode/DerivedData/AiitecOpenAPI-gososzuxaqyyvpfssoyimoeiwcpp/Build/Products/Debug-iphonesimulator/include AiitecOpenAPI
cp -R /Users/iMac/Library/Developer/Xcode/DerivedData/AiitecOpenAPI-gososzuxaqyyvpfssoyimoeiwcpp/Build/Products/Debug-iphonesimulator/libAiitecOpenAPI.a AiitecOpenAPI
