# DTS app

用来学习flutter的第一个程序，实际上是给[DTS](https://www.dogcraft.top/talk/)的后端API配了一个包含有大部分功能的App。DTS是当年用来学习前后端分离与Restful API的一个项目，现在再拿来学习写flutter框架的App再合适不过了。

这个很简单的App分为四页，有一个抽屉菜单。采用`markdown_widget`来渲染markdown，采用`shared_preferences`来进行小规模数据的持久化，采用`dio`与`dio_http2_adapter`进行API的请求，采用`cached_network_image`来加载并缓存网络图片。

原则上，这个App的用户有且仅有我一个。

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
