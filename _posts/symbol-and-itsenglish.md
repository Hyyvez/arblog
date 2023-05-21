---
title: '各种标点符号的名称及其对应的英文'
excerpt: '我好菜啊'
coverImage: 'public/assets/blog/symbol-and-itsenglish/cover1.jpg'
date: '2023-05-19T22:23:00+08:00'
ogImage: 
    url: 'public/assets/blog/symbol-and-itsenglish/cover1.jpg'
---

## 各种标点符号的名称及其对应的英文


            |  符号  |              英文               |     中文     |
            |-------|---------------------------------|--------------|
            |   `   |       Backtick, backquote       |    反引号    |
            |   ~   |              Tilde              |    波浪号    |
            |   !   |        Exclamation Mark         |    惊叹号    |
            |   @   |            At Symbol            |      æt     |
            |   #   |      Hash Sign, Pound Sign      |     井号     |
            |   $   |           Dollar Sign           |   美元符号   |
            |   %   |          Percent Sign           |    百分号    |
            |   ^   |           Caret Symbol          |   插入符号   |
            |   &   |    Ampersand Symbol, and sign   |    和符号    |
            |   *   |         Asterisk Symbol         |     星号     |
            |   ()  |   Parentheses, Round Brackets   |    圆括号    |
            |   _   |       Hyphen, Minus Sign        |    连字符    |
            |   +   |            Plus Sign            |     加号     |
            |   _   |      Underscore, Underline      |    下划线    |
            |   =   |           Equals Sign           |     等号     |
            |   {}  |         Curly Brackets          |    大括号    |
            |   []  |    Brackets, Square Brackets    |    方括号    |
            |   :   |              Colon              |     冒号     |
            |   ;   |            Semicolon            |     分号     |
            |   "   |         Quotation Mark          |    双引号    |
            |   '   |           Apostrophe            |    单引号    |
            |   <>  |         Angle Brackets          |    尖括号    |
            |   ,   |              Comma              |     逗号     |
            |   .   |           Period, Dot           |     句号     |
            |   ?   |          Question Mark          |     问号     |
            |   /   |      Slash, Forward Slash       |     斜杠     |
            |   |   |          Vertical bar           |     竖杠     |
            |   \   |            Backslash            |    反斜杠    |

写这个博客是用 markdown 写的，实际上之前我也没接触过 markdown 。然后想到之后我要展示代码的时候，代码块的格式要怎么打出来，于是问了 chatGPT ，它说是要使用三个反引号，我并不知道反引号是哪一个... 然后才知道是1旁边那个键，所以干脆在上面列一个符号的中文及其对应英文

对了，markdown 用三个反引号显示文本中的```小代码块```，[显示代码块](https://www.markdownguide.org/basic-syntax/#code-blocks-1)用 tab，效果如下

    <html>
    <head>
    <title>Test</title>
    </head>

edited( date: '2023-05-20T23:56:00+08:00' ): 家人们谁懂啊，这个 next.js 的模板博客不支持 html 代码，显示 markdown 的表格也不正常，上面那个表格花了我好多时间弄出来，最终才发现当成代码块才能在网页中显示并且容易对齐

> edited( date: '2023-05-21T15:16:00+08:00' ): 我好菜啊，当我想把上面那句话设置成 blockquote 的时候，发现和 md 的表格一样，它也在网页中显示不了，然后我对着这个博客模板的源代码一直问 chatGPT 才找到解决的办法。  这个模板只是用 [remark-html](https://github.com/remarkjs/remark-html) 把 md 文件直接转换成带相应 html 标签的文本，所以如果要在网页中显示，我一开始还以为要在使用 [markdownToHtml](https://github.com/vercel/next.js/blob/canary/examples/blog-starter/lib/markdownToHtml.ts) 函数之后修改 class 属性才能通过 tailwind CSS 显示，甚至想写个 html 的 class 属性注入的函数。最后还是想到了，md 转 html 和 tailwind 这么冲突，网上肯定有对应的轮子吧，结果一谷歌就发现其实这个项目已经用 tailwind CSS 的 [@apply](https://dev.to/ewatch/styling-markdown-generated-html-with-tailwind-css-and-parsedown-328d) 写了一个[现成](https://github.com/vercel/next.js/blob/canary/examples/blog-starter/components/post-body.tsx)的了是我不知道。。所以！在这个项目里，在 [markdown-styles.module.css](https://github.com/vercel/next.js/blob/canary/examples/blog-starter/components/markdown-styles.module.css) 文件就可以进行所谓的 html 的 class 属性注入了！
至于为什么上面那个表格仍然不是 markdown 的表格，大概是因为 [remark-html](https://github.com/remarkjs/remark-html) 转换不了吧

> [封面图](https://twitter.com/tori_nankotsu96/status/1658536616313655296)：[https://twitter.com/tori_nankotsu96/status/1658536616313655296](https://twitter.com/tori_nankotsu96/status/1658536616313655296)


