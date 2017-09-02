





## 开发

多语言

https://medium.com/lean-localization/ios-localization-tutorial-938231f9f881



finderSync

https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/Finder.html



简单的教程

https://github.com/DeveloperLx/macOS_Development_Tutorials_translation



App Extension没有权限读~

取homeDirectory返回app的沙盒地址，直接写用户地址，报无法读

==> appEx默认打开了sandbox，并且无法关闭。把原~/.macnewfile改在app的sandbox的home目录下file:///Users/ch3n/Library/Containers/co.ch3n.MacNewFile.NewFileEx/Data/

（关于sandbox）

https://medium.com/macos-app-development/using-app-sandbox-for-macos-app-9bc90556f9ce



还是没法写

在supporting FIles下面的entitlements里面加

com.apple.security.temporary-exception.files.home-relative-path.read-write

https://developer.apple.com/library/content/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/AppSandboxTemporaryExceptionEntitlements.html



Appicon

https://github.com/kuyawa/AppIcons



App签名

http://nixwang.com/2015/01/07/sign-your-mac-app-with-developer-id/

https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/DistributingApplicationsOutside/DistributingApplicationsOutside.html

关键是要交钱688

查看签名

```
 codesign -dv /Applications/Whatever.app
```



Release Build

Choose **Product** -> **Scheme** -> **Edit Scheme**. Change the `Build Configuration` under the `Info` tab.



DMG

与拖动安装

https://github.com/sindresorhus/create-dmg

手动对DMG进行签名

```
codesign -s <identity> --keychain <full-path-to-keychain> <path-to-disk-image>
```



签名的原理

identity是什么

https://developer.apple.com/library/content/documentation/Security/Conceptual/CodeSigningGuide/Procedures/Procedures.html#//apple_ref/doc/uid/TP40005929-CH4-SW2

https://developer.apple.com/library/content/documentation/Security/Conceptual/CodeSigningGuide/Introduction/Introduction.html



TODO

Donate 觉得好用，赞助吃鸡

Blog link