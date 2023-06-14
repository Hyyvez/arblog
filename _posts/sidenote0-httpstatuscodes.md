---
title: 'http status code #side n0te'
excerpt: '介绍http状态码'
coverImage: '/assets/blog/sidenote0-httpstatuscodes/cover.PNG'
date: '2023-06-14T16:56:00+08:00'
ogImage:
  url: '/assets/blog/sidenote0-httpstatuscodes/cover.PNG'
---

## 前言
> 人生的第一次面试。  
> 最后问当用户输入了错误的账号或密码时，后端http状态码应该返回什么，不知道我怎么想的直接就回答了502，还说肯定是5开头的，虽然我知道4开头是用户错误，5开头是服务器错误。。但是不知道为什么那时就是没多想。。最后等通知了...99.999%的概率是挂了

## HTTP response status codes
其实在 [mdn web docs](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) 写得很完整。虽然常见的状态码也应该在开发API的过程中会慢慢熟悉而不需要太多死记硬背。
```text
Informational responses (100 – 199) 信息性状态码
Successful responses (200 – 299) 成功状态码
Redirection messages (300 – 399) 重定向状态码
Client error responses (400 – 499) 客户端错误状态码
Server error responses (500 – 599) 服务器错误状态码
```

## 常见的场景和对应的状态码
> *由 ChatGPT 生成*

| 示例                                       |状态码|
|:-----------------------------------------|:----|
| 当你访问一个不存在的网页时                            |404 Not Found|
| 当你在网上购物并提交订单时，如果订单成功创建                   |201 Created|
| 如果一个网站正在进行维护或不存在                         |503 Service Unavailable|
| 当你尝试登录某个网站，但输入了错误的用户名或密码                 |401 Unauthorized|
| 当你在在线论坛上发表评论或回复时，内容违反网站规定                |403 Forbidden|
| 当你使用一个已过期的购物优惠码来结算购物车中的商品                |400 Bad Request|
| 当你在某个新闻网站上点击一个新闻文章链接，但该文章已被删除或移动到其他位置    |301 Moved Permanently|
| 当你尝试访问一个在线视频流媒体平台上的热门视频，但该视频由于版权问题暂时无法播放 |503 Service Unavailable|

## 常见的状态码

2xx（Successful responses 成功状态码）：
```text
200 OK：请求成功，服务器成功处理了请求。
201 Created：请求已成功，并在服务器上创建了新的资源。
202 Accepted：请求已被接受进行处理，但处理尚未完成。
204 No Content：服务器成功处理了请求，但没有返回任何内容。
```
3xx（Redirection messages 重定向状态码）：
```text
301 Moved Permanently：请求的资源已永久移动到新位置。
302 Found：请求的资源临时移动到新位置。
303 See Other：请求的资源可以在不同的URI下被找到。
304 Not Modified：客户端的缓存资源是最新的，不需要再次传输。
```
4xx（Client error responses 客户端错误状态码）：
```text
400 Bad Request：服务器无法理解客户端发送的请求。
401 Unauthorized：请求需要用户认证。
403 Forbidden：服务器拒绝提供请求的资源。
404 Not Found：请求的资源在服务器上不存在。
```
5xx（Server error responses 服务器错误状态码）：
```text
500 Internal Server Error：服务器内部出现错误，在执行请求时遇到了错误。
501 Not Implemented：服务器不支持当前请求的功能。
502 Bad Gateway：服务器作为网关或代理，从上游服务器收到无效响应。
503 Service Unavailable：服务器当前无法处理请求，一段时间后可能恢复正常。
```


### 回答前言中的面试小问题
那么所有当用户输入了错误的账号或密码时，后端http状态码应该返回什么呢？  


这是用户的错误，所以应该是4开头的  
4开头常见的状态码：
```text
400 Bad Request：服务器无法理解客户端发送的请求。
401 Unauthorized：请求需要用户认证。
403 Forbidden：服务器拒绝提供请求的资源。
404 Not Found：请求的资源在服务器上不存在。
```
所以答案应该是401。

---

封面图：https://twitter.com/CatChangelog/status/1666222128046153728