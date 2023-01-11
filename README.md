# flutter_wechat_desktop

桌面版微信，适合企业内部开发桌面版的沟通工具，目前项目只在macos跑过，其他操作系统可自行配置

本项目只有UI没有接通服务

## Getting Started

![demo png](1.gif "demo")



![demo png](1_1.jpg "demo")



**使用的组件：**

自研ResizeWidget 组件：内部区域使用MouseRegion识别鼠标，然后GestureDetector的pan手势进行大小拖拽

第三方bitsdojo_window组件：可对窗口进行最大最小设置，设置window风格等，可参照swift代码中的NSWindow



**开发环境**

```
[✓] Flutter (Channel stable, 3.3.9, on macOS 13.0 22A380 darwin-x64, locale zh-Hans-CN)
    • Flutter version 3.3.9 on channel stable at /Users/xx/fvm/versions/3.3.9
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision b8f7f1f986 (7 weeks ago), 2022-11-23 06:43:51 +0900
    • Engine revision 8f2221fbef
    • Dart version 2.18.5
    • DevTools version 2.15.0
    • Pub download mirror https://pub.flutter-io.cn
    • Flutter download mirror https://storage.flutter-io.cn

[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14C18
    • CocoaPods version 1.11.3
```

