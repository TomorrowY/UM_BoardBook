# UM_BoardBook
第三方友盟登录分享

简书地址：https://www.jianshu.com/p/ddc0989690c6

### 1.  集成友盟社会化组件流程
1.1  注册友盟账号
登陆[友盟官网](http://www.umeng.com)，在[我的产品](http://mobile.umeng.com/apps)页面添加新应用，然后获取到Appkey。
1.2  申请第三方账号
参照文档：[申请第三方账号](http://dev.umeng.com/social/ios/operation#2)
1.3  绑定第三方账号
参照文档：[绑定第三方账号到友盟后台](http://dev.umeng.com/social/ios/operation#3)
1.4  下载SDK
进入下载SDK页面[点击链接](https://developer.umeng.com/sdk/ios)，勾选自己需要的功能进行下载

### 注意：导入SDK 配置Other Linker Flags 加入-ObjC ，如集成运行报错如下错误：
Undefined symbols for architecture x86_64:
"_compress2", referenced from:
+[UMUtils deflatedDataPrefixedWith:level:source:] in UMCommon(UMUtils.o)
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
<hr> 解决办法：在Other Linker Flags 加入 -lz


