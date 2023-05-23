[1mdiff --git a/_posts/symbol-and-itsenglish.md b/_posts/symbol-and-itsenglish.md[m
[1mindex 2bcf26a..9184f2d 100644[m
[1m--- a/_posts/symbol-and-itsenglish.md[m
[1m+++ b/_posts/symbol-and-itsenglish.md[m
[36m@@ -43,14 +43,20 @@[m [mogImage:[m
 [m
 写这个博客是用 markdown 写的，实际上之前我也没接触过 markdown 。然后想到之后我要展示代码的时候，代码块的格式要怎么打出来，于是问了 chatGPT ，它说是要使用三个反引号，我并不知道反引号是哪一个... 然后才知道是1旁边那个键，所以干脆在上面列一个符号的中文及其对应英文[m
 [m
[31m-对了，markdown 用三个反引号显示文本中的```小代码块```，[显示代码块](https://www.markdownguide.org/basic-syntax/#code-blocks-1)用 tab，效果如下[m
[32m+[m[32m对了，markdown 用三个反引号显示文本中的```行内代码块```，或者用上下一对的三个反引号显示代码块，上面三个反引号的后面可以写上语言，赋值 class 属性，如下图。[m
 [m
[32m+[m[32m![code_block_example](/assets/blog/symbol-and-itsenglish/code_block_example.PNG "code_block_example")[m
[32m+[m
[32m+[m[32m也可以用 tab [显示代码块](https://www.markdownguide.org/basic-syntax/#code-blocks-1)，效果如下[m
[32m+[m
[32m+[m[32m```html[m
 <html>[m
 <head>[m
 <title>Test</title>[m
 </head>[m
[32m+[m[32m```[m
 [m
[31m-edited( date: '2023-05-20T23:56:00+08:00' ): 家人们谁懂啊，这个 next.js 的模板博客不支持 html 代码（应该是为了放在注入？），显示 markdown 的表格也不正常，上面那个表格花了我好多时间弄出来，最终才发现当成代码块才能在网页中显示并且容易对齐[m
[32m+[m[32medited( date: '2023-05-20T23:56:00+08:00' ): 家人们谁懂啊，这个 next.js 的模板博客不支持 html 代码（应该是为了防止注入？），显示 markdown 的表格也不正常，上面那个表格花了我好多时间弄出来，最终才发现当成代码块才能在网页中显示并且容易对齐[m
 [m
 > edited( date: '2023-05-21T15:16:00+08:00' ): 我好菜啊，当我想把上面那句话设置成 blockquote 的时候，发现和 md 的表格一样，它也在网页中显示不了，然后我对着这个博客模板的源代码一直问 chatGPT 才找到解决的办法。  这个模板只是用 [remark-html](https://github.com/remarkjs/remark-html) 把 md 文件直接转换成带相应 html 标签的文本，所以如果要在网页中显示，我一开始还以为要在使用 [markdownToHtml](https://github.com/vercel/next.js/blob/canary/examples/blog-starter/lib/markdownToHtml.ts) 函数之后修改 class 属性才能通过 tailwind CSS 显示，甚至想写个 html 的 class 属性注入的函数。最后还是想到了，md 转 html 和 tailwind 这么冲突，网上肯定有对应的轮子吧，结果一谷歌就发现其实这个项目已经用 tailwind CSS 的 [@apply](https://dev.to/ewatch/styling-markdown-generated-html-with-tailwind-css-and-parsedown-328d) 写了一个[现成](https://github.com/vercel/next.js/blob/canary/examples/blog-starter/components/post-body.tsx)的了是我不知道。。所以！在这个项目里，在 [markdown-styles.module.css](https://github.com/vercel/next.js/blob/canary/examples/blog-starter/components/markdown-styles.module.css) 文件就可以进行所谓的 html 的 class 属性注入了！[m
 至于为什么上面那个表格仍然不是 markdown 的表格，大概是因为 [remark-html](https://github.com/remarkjs/remark-html) 转换不了吧[m
[1mdiff --git a/components/intro.tsx b/components/intro.tsx[m
[1mindex 49fa9e5..b40bba7 100644[m
[1m--- a/components/intro.tsx[m
[1m+++ b/components/intro.tsx[m
[36m@@ -1,4 +1,3 @@[m
[31m-import { CMS_NAME } from '../lib/constants'[m
 [m
 const Intro = () => {[m
   return ([m
[1mdiff --git a/components/markdown-styles.module.css b/components/markdown-styles.module.css[m
[1mindex 7101f00..769d857 100644[m
[1m--- a/components/markdown-styles.module.css[m
[1m+++ b/components/markdown-styles.module.css[m
[36m@@ -30,12 +30,13 @@[m
   @apply text-blue-500 break-all;[m
 }[m
 [m
[31m-.markdown pre{[m
[31m-  @apply bg-gray-800 rounded-lg p-4;[m
[32m+[m[32m/*middle images*/[m
[32m+[m[32m.markdown img{[m
[32m+[m[32m  @apply mx-auto;[m
 }[m
 [m
[31m-.markdown code{[m
[31m-  @apply bg-gray-800 rounded-md p-1 text-white;[m
[32m+[m[32m.markdown pre{[m
[32m+[m[32m  @apply rounded-lg;[m
 }[m
 [m
 .markdown table{[m
[36m@@ -45,3 +46,4 @@[m
 .markdown td{[m
   @apply border border-gray-300 align-middle px-4 py-2 ;[m
 }[m
[41m+[m
[1mdiff --git a/components/meta.tsx b/components/meta.tsx[m
[1mindex 89a7c15..15e93c7 100644[m
[1m--- a/components/meta.tsx[m
[1m+++ b/components/meta.tsx[m
[36m@@ -1,6 +1,7 @@[m
 import Head from 'next/head'[m
 import { CMS_NAME, HOME_OG_IMAGE_URL } from '../lib/constants'[m
 [m
[32m+[m
 const Meta = () => {[m
   return ([m
     <Head>[m
[1mdiff --git a/components/post-body.tsx b/components/post-body.tsx[m
[1mindex 6a8ed33..48f0cd5 100644[m
[1m--- a/components/post-body.tsx[m
[1m+++ b/components/post-body.tsx[m
[36m@@ -1,15 +1,23 @@[m
 import markdownStyles from './markdown-styles.module.css'[m
[32m+[m[32mimport {rehype} from 'rehype'[m
[32m+[m[32mimport rehypePrism from 'rehype-prism-plus'[m
[32m+[m
 [m
 type Props = {[m
     content: string[m
 }[m
 [m
 const PostBody = ({ content }: Props) => {[m
[32m+[m[32m    const classedInjectedContent =[m
[32m+[m[32m        rehype()[m
[32m+[m[32m        .use(rehypePrism)[m
[32m+[m[32m        .processSync(content)[m
[32m+[m
     return ([m
         <div className="max-w-3xl mx-auto">[m
             <div[m
                 className={markdownStyles['markdown']}[m
[31m-        dangerouslySetInnerHTML={{ __html: content }}[m
[32m+[m[32m                dangerouslySetInnerHTML={{ __html: classedInjectedContent }}[m
             />[m
         </div>[m
     )[m
[1mdiff --git a/interfaces/post.ts b/interfaces/post.ts[m
[1mindex 179bf74..0916ad4 100644[m
[1m--- a/interfaces/post.ts[m
[1m+++ b/interfaces/post.ts[m
[36m@@ -5,7 +5,7 @@[m [mtype PostType = {[m
   title: string[m
   date: string[m
   coverImage: string[m
[31m-  author: Author[m
[32m+[m[32m  author?: Author[m
   excerpt: string[m
   ogImage: {[m
     url: string[m
[1mdiff --git a/lib/markdownToHtml.ts b/lib/markdownToHtml.ts[m
[1mindex 7601920..195cf9a 100644[m
[1m--- a/lib/markdownToHtml.ts[m
[1m+++ b/lib/markdownToHtml.ts[m
[36m@@ -7,6 +7,7 @@[m [mimport rehypeStringify from 'rehype-stringify'[m
 [m
 [m
 [m
[32m+[m
 export default async function markdownToHtml(markdown: string) {[m
   const result = await unified()[m
       .use(remarkParse)[m
[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mindex e6b3a82..bcb43d3 100644[m
[1m--- a/package-lock.json[m
[1m+++ b/package-lock.json[m
[36m@@ -13,6 +13,8 @@[m
         "next": "latest",[m
         "react": "^18.2.0",[m
         "react-dom": "^18.2.0",[m
[32m+[m[32m        "rehype": "^12.0.1",[m
[32m+[m[32m        "rehype-prism-plus": "^1.5.1",[m
         "rehype-stringify": "^9.0.3",[m
         "remark": "^14.0.2",[m
         "remark-gfm": "^3.0.1",[m
[36m@@ -22,6 +24,7 @@[m
         "typescript": "^4.7.4"[m
       },[m
       "devDependencies": {[m
[32m+[m[32m        "@tailwindcss/typography": "^0.5.9",[m
         "@types/node": "^18.0.3",[m
         "@types/react": "^18.0.15",[m
         "@types/react-dom": "^18.0.6",[m
[36m@@ -290,6 +293,34 @@[m
         "tslib": "^2.4.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/@tailwindcss/typography": {[m
[32m+[m[32m      "version": "0.5.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@tailwindcss/typography/-/typography-0.5.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-t8Sg3DyynFysV9f4JDOVISGsjazNb48AeIYQwcL+Bsq5uf4RYL75C1giZ43KISjeDGBaTN3Kxh7Xj/vRSMJUUg==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "lodash.castarray": "^4.4.0",[m
[32m+[m[32m        "lodash.isplainobject": "^4.0.6",[m
[32m+[m[32m        "lodash.merge": "^4.6.2",[m
[32m+[m[32m        "postcss-selector-parser": "6.0.10"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependencies": {[m
[32m+[m[32m        "tailwindcss": ">=3.0.0 || insiders"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/@tailwindcss/typography/node_modules/postcss-selector-parser": {[m
[32m+[m[32m      "version": "6.0.10",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/postcss-selector-parser/-/postcss-selector-parser-6.0.10.tgz",[m
[32m+[m[32m      "integrity": "sha512-IQ7TZdoaqbT+LCpShg46jnZVlhWD2w6iQYAcYXfHARZ7X1t/UGhhceQDs5X0cGqKvYlHNOuv7Oa1xmb0oQuA3w==",[m
[32m+[m[32m      "dev": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "cssesc": "^3.0.0",[m
[32m+[m[32m        "util-deprecate": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/@types/debug": {[m
       "version": "4.1.7",[m
       "resolved": "https://registry.npmjs.org/@types/debug/-/debug-4.1.7.tgz",[m
[36m@@ -330,6 +361,11 @@[m
       "resolved": "https://registry.npmjs.org/@types/parse5/-/parse5-6.0.3.tgz",[m
       "integrity": "sha512-SuT16Q1K51EAVPz1K29DJ/sXjhSQ0zjvsypYJ6tlwVsRV9jwW5Adq2ch8Dq8kDBCkYnELS7N7VNCSB5nC56t/g=="[m
     },[m
[32m+[m[32m    "node_modules/@types/prismjs": {[m
[32m+[m[32m      "version": "1.26.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@types/prismjs/-/prismjs-1.26.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZTaqn/qSqUuAq1YwvOFQfVW1AR/oQJlLSZVustdjwI+GZ8kr0MSHBj0tsXPW1EqHubx50gtBEjbPGsdZwQwCjQ=="[m
[32m+[m[32m    },[m
     "node_modules/@types/prop-types": {[m
       "version": "15.7.5",[m
       "resolved": "https://registry.npmjs.org/@types/prop-types/-/prop-types-15.7.5.tgz",[m
[36m@@ -377,7 +413,7 @@[m
       "version": "3.1.3",[m
       "resolved": "https://registry.npmjs.org/anymatch/-/anymatch-3.1.3.tgz",[m
       "integrity": "sha512-KMReFUr0B4t+D+OBkjR3KYqvocp2XaSzO55UcB6mgQMd3KbcE+mWTyvVV7D/zsdEbNnV6acZUutkiHQXvTr1Rw==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "normalize-path": "^3.0.0",[m
         "picomatch": "^2.0.4"[m
[36m@@ -475,7 +511,7 @@[m
       "version": "2.2.0",[m
       "resolved": "https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.2.0.tgz",[m
       "integrity": "sha512-jDctJ/IVQbZoJykoeHbhXpOlNBqGNcwXJKJog42E5HDPUwQTSdjCHdihjj0DlnheQ7blbT6dHOafNAiS8ooQKA==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "engines": {[m
         "node": ">=8"[m
       }[m
[36m@@ -493,7 +529,7 @@[m
       "version": "3.0.2",[m
       "resolved": "https://registry.npmjs.org/braces/-/braces-3.0.2.tgz",[m
       "integrity": "sha512-b8um+L1RzM3WDSzvhm6gIz1yfTbBt6YTlcEKAvsmqCZZFw46z626lVj9j1yEPW33H5H+lBQpZMP1k8l+78Ha0A==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "fill-range": "^7.0.1"[m
       },[m
[36m@@ -604,11 +640,20 @@[m
         "url": "https://github.com/sponsors/wooorm"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/character-reference-invalid": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/character-reference-invalid/-/character-reference-invalid-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-iBZ4F4wRbyORVsu0jPV7gXkOsGYjGHPmAyv+HiHG8gi5PtC9KI2j1+v8/tlibRvjoWX027ypmG/n0HtO5t7unw==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/chokidar": {[m
       "version": "3.5.3",[m
       "resolved": "https://registry.npmjs.org/chokidar/-/chokidar-3.5.3.tgz",[m
       "integrity": "sha512-Dr3sfKRP6oTcjf2JmUmFJfeVMvXBdegxB0iVQ5eb2V10uFJUCAS8OByZdVAyVb8xXNz3GjjTgj9kLWsZTqE6kw==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "funding": [[m
         {[m
           "type": "individual",[m
[36m@@ -635,7 +680,7 @@[m
       "version": "5.1.2",[m
       "resolved": "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz",[m
       "integrity": "sha512-AOIgSQCepiJYwP3ARnGx+5VnTu2HBYdzbGP45eLw1vr3zB3vZLeyed1sC9hnbcOc9/SrMyM5RPQrkGz4aS9Zow==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "is-glob": "^4.0.1"[m
       },[m
[36m@@ -891,7 +936,7 @@[m
       "version": "7.0.1",[m
       "resolved": "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz",[m
       "integrity": "sha512-qOo9F+dMUmC2Lcb4BbVvnKJxTPjCm+RRpe4gDuGrzkL7mEVl/djYSu2OdQ2Pa302N4oqkSg9ir6jaLWJ2USVpQ==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "to-regex-range": "^5.0.1"[m
       },[m
[36m@@ -1184,6 +1229,18 @@[m
         "url": "https://opencollective.com/unified"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/hast-util-to-string": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/hast-util-to-string/-/hast-util-to-string-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-02AQ3vLhuH3FisaMM+i/9sm4OXGSq1UhOOCpTLLQtHdL3tZt7qil69r8M8iDkZYyC0HCFylcYoP+8IO7ddta1A==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/hast": "^2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/unified"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/hast-util-whitespace": {[m
       "version": "2.0.1",[m
       "resolved": "https://registry.npmjs.org/hast-util-whitespace/-/hast-util-whitespace-2.0.1.tgz",[m
[36m@@ -1218,6 +1275,13 @@[m
         "url": "https://github.com/sponsors/wooorm"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/immutable": {[m
[32m+[m[32m      "version": "4.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/immutable/-/immutable-4.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-0AOCmOip+xgJwEVTQj1EfiDDOkPmuyllDuTuEX+DDXUgapLAsBIfkg3sxCYyCEA8mQqZrrxPUGjcOQ2JS3WLkg==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true[m
[32m+[m[32m    },[m
     "node_modules/inflight": {[m
       "version": "1.0.6",[m
       "resolved": "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz",[m
[36m@@ -1232,11 +1296,33 @@[m
       "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz",[m
       "integrity": "sha512-k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ=="[m
     },[m
[32m+[m[32m    "node_modules/is-alphabetical": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-alphabetical/-/is-alphabetical-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-FWyyY60MeTNyeSRpkM2Iry0G9hpr7/9kD40mD/cGQEuilcZYS4okz8SN2Q6rLCJ8gbCt6fN+rC+6tMGS99LaxQ==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/is-alphanumerical": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-alphanumerical/-/is-alphanumerical-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-hmbYhX/9MUMF5uh7tOXyK/n0ZvWpad5caBA17GsC6vyuCqaWliRG5K1qS9inmUhEMaOBIW7/whAnSwveW/LtZw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "is-alphabetical": "^2.0.0",[m
[32m+[m[32m        "is-decimal": "^2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/is-binary-path": {[m
       "version": "2.1.0",[m
       "resolved": "https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz",[m
       "integrity": "sha512-ZMERYes6pDydyuGidse7OsHxtbI7WVeUEozgR/g7rd0xUimYNlvZRE/K2MgZTjWy725IfelLeVcEM97mmtRGXw==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "binary-extensions": "^2.0.0"[m
       },[m
[36m@@ -1278,6 +1364,15 @@[m
         "url": "https://github.com/sponsors/ljharb"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/is-decimal": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-decimal/-/is-decimal-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-AAB9hiomQs5DXWcRB1rqsxGUstbRroFOPPVAomNk/3XHR5JyEZChOyTWe2oayKnsSsr/kcGqF+z6yuH6HHpN0A==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/is-extendable": {[m
       "version": "0.1.1",[m
       "resolved": "https://registry.npmjs.org/is-extendable/-/is-extendable-0.1.1.tgz",[m
[36m@@ -1290,7 +1385,7 @@[m
       "version": "2.1.1",[m
       "resolved": "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz",[m
       "integrity": "sha512-SbKbANkN603Vi4jEZv49LeVJMn4yGwsbzZworEoyEiutsN3nJYdbO36zfhGJ6QEDpOZIFkDtnq5JRxmvl3jsoQ==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "engines": {[m
         "node": ">=0.10.0"[m
       }[m
[36m@@ -1299,7 +1394,7 @@[m
       "version": "4.0.3",[m
       "resolved": "https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz",[m
       "integrity": "sha512-xelSayHH36ZgE7ZWhli7pW34hNbNl8Ojv5KVmkJD4hBdD3th8Tfk9vYasLM+mXWOZhFkgZfxhLSnrwRr4elSSg==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "is-extglob": "^2.1.1"[m
       },[m
[36m@@ -1307,11 +1402,20 @@[m
         "node": ">=0.10.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/is-hexadecimal": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/is-hexadecimal/-/is-hexadecimal-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-DgZQp241c8oO6cA1SbTEWiXeoxV42vlcJxgH+B3hi1AiqqKruZR3ZGF8In3fj4+/y/7rHvlOZLZtgJ/4ttYGZg==",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/is-number": {[m
       "version": "7.0.0",[m
       "resolved": "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz",[m
       "integrity": "sha512-41Cifkg6e8TylSpdtTpeLVMqvSBEVzTttHvERD741+pnZ8ANv0004MRL43QKPDlK9cGvNp6NZWZUBlbGXYxxng==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "engines": {[m
         "node": ">=0.12.0"[m
       }[m
[36m@@ -1403,6 +1507,24 @@[m
         "node": ">=8"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/lodash.castarray": {[m
[32m+[m[32m      "version": "4.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.castarray/-/lodash.castarray-4.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-aVx8ztPv7/2ULbArGJ2Y42bG1mEQ5mGjpdvrbJcJFU3TbYybe+QlLS4pst9zV52ymy2in1KpFPiZnAOATxD4+Q==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lodash.isplainobject": {[m
[32m+[m[32m      "version": "4.0.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.isplainobject/-/lodash.isplainobject-4.0.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-oSXzaWypCMHkPC3NvBEaPHf0KsA5mvPrOPgQWDsbg8n7orZ290M0BmC/jgRZ4vcJ6DTAhjrsSYgdsW/F+MFOBA==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/lodash.merge": {[m
[32m+[m[32m      "version": "4.6.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/lodash.merge/-/lodash.merge-4.6.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-0KpjqXRVvrYyCsX1swR/XTK0va6VQkQM6MNo7PqW77ByjAhoARA8EfrP1N4+KlKj8YS0ZUCtRT/YUuhyYDujIQ==",[m
[32m+[m[32m      "dev": true[m
[32m+[m[32m    },[m
     "node_modules/longest-streak": {[m
       "version": "3.1.0",[m
       "resolved": "https://registry.npmjs.org/longest-streak/-/longest-streak-3.1.0.tgz",[m
[36m@@ -2356,7 +2478,7 @@[m
       "version": "3.0.0",[m
       "resolved": "https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz",[m
       "integrity": "sha512-6eZs5Ls3WtCisHWp9S2GUy8dqkpGi4BVSz3GaqiE6ezub0512ESztXUwUB6C6IKbQkY2Pnb/mD4WYojCRwcwLA==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "engines": {[m
         "node": ">=0.10.0"[m
       }[m
[36m@@ -2428,6 +2550,30 @@[m
         "node": ">=6"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/parse-entities": {[m
[32m+[m[32m      "version": "4.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parse-entities/-/parse-entities-4.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-SWzvYcSJh4d/SGLIOQfZ/CoNv6BTlI6YEQ7Nj82oDVnRpwe/Z/F1EMx42x3JAOwGBlCjeCH0BRJQbQ/opHL17w==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/unist": "^2.0.0",[m
[32m+[m[32m        "character-entities": "^2.0.0",[m
[32m+[m[32m        "character-entities-legacy": "^3.0.0",[m
[32m+[m[32m        "character-reference-invalid": "^2.0.0",[m
[32m+[m[32m        "decode-named-character-reference": "^1.0.0",[m
[32m+[m[32m        "is-alphanumerical": "^2.0.0",[m
[32m+[m[32m        "is-decimal": "^2.0.0",[m
[32m+[m[32m        "is-hexadecimal": "^2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parse-numeric-range": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parse-numeric-range/-/parse-numeric-range-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-twN+njEipszzlMJd4ONUYgSfZPDxgHhT9Ahed5uTigpQn90FggW4SA/AIPq/6a149fTbE9qBEcSwE3FAEp6wQQ=="[m
[32m+[m[32m    },[m
     "node_modules/parse5": {[m
       "version": "6.0.1",[m
       "resolved": "https://registry.npmjs.org/parse5/-/parse5-6.0.1.tgz",[m
[36m@@ -2464,7 +2610,7 @@[m
       "version": "2.3.1",[m
       "resolved": "https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz",[m
       "integrity": "sha512-JU3teHTNjmE2VCGFzuY8EXzCDVwEqB2a8fsIvwaStHhAWJEeVd1o1QD80CU6+ZdEXXSLbSsuLwJjkCBWqRQUVA==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "engines": {[m
         "node": ">=8.6"[m
       },[m
[36m@@ -2715,7 +2861,7 @@[m
       "version": "3.6.0",[m
       "resolved": "https://registry.npmjs.org/readdirp/-/readdirp-3.6.0.tgz",[m
       "integrity": "sha512-hOS089on8RduqdbhvQ5Z37A0ESjsqz6qnRcffsMU3495FuTdqSm+7bhJ29JvIOsBDEEnan5DPu9t3To9VRlMzA==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "picomatch": "^2.2.1"[m
       },[m
[36m@@ -2723,11 +2869,69 @@[m
         "node": ">=8.10.0"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/refractor": {[m
[32m+[m[32m      "version": "4.8.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/refractor/-/refractor-4.8.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-/fk5sI0iTgFYlmVGYVew90AoYnNMP6pooClx/XKqyeeCQXrL0Kvgn8V0VEht5ccdljbzzF1i3Q213gcntkRExg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/hast": "^2.0.0",[m
[32m+[m[32m        "@types/prismjs": "^1.0.0",[m
[32m+[m[32m        "hastscript": "^7.0.0",[m
[32m+[m[32m        "parse-entities": "^4.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "github",[m
[32m+[m[32m        "url": "https://github.com/sponsors/wooorm"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/regenerator-runtime": {[m
       "version": "0.13.11",[m
       "resolved": "https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.13.11.tgz",[m
       "integrity": "sha512-kY1AZVr2Ra+t+piVaJ4gxaFaReZVH40AKNo7UCX6W+dEwBo/2oZJzqfuN1qLq1oL45o56cPaTXELwrTh8Fpggg=="[m
     },[m
[32m+[m[32m    "node_modules/rehype": {[m
[32m+[m[32m      "version": "12.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/rehype/-/rehype-12.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-ey6kAqwLM3X6QnMDILJthGvG1m1ULROS9NT4uG9IDCuv08SFyLlreSuvOa//DgEvbXx62DS6elGVqusWhRUbgw==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/hast": "^2.0.0",[m
[32m+[m[32m        "rehype-parse": "^8.0.0",[m
[32m+[m[32m        "rehype-stringify": "^9.0.0",[m
[32m+[m[32m        "unified": "^10.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/unified"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/rehype-parse": {[m
[32m+[m[32m      "version": "8.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/rehype-parse/-/rehype-parse-8.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-MJJKONunHjoTh4kc3dsM1v3C9kGrrxvA3U8PxZlP2SjH8RNUSrb+lF7Y0KVaUDnGH2QZ5vAn7ulkiajM9ifuqg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/hast": "^2.0.0",[m
[32m+[m[32m        "hast-util-from-parse5": "^7.0.0",[m
[32m+[m[32m        "parse5": "^6.0.0",[m
[32m+[m[32m        "unified": "^10.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "type": "opencollective",[m
[32m+[m[32m        "url": "https://opencollective.com/unified"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/rehype-prism-plus": {[m
[32m+[m[32m      "version": "1.5.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/rehype-prism-plus/-/rehype-prism-plus-1.5.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-mowYefSfrIkMMxkb0fwuEXlvc5nA9b1vQ6mzujM81Qx28RI0mo7jCHsBZ2tJ4eIJKXdFn+EdPkZZBGB10K02vg==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "hast-util-to-string": "^2.0.0",[m
[32m+[m[32m        "parse-numeric-range": "^1.3.0",[m
[32m+[m[32m        "refractor": "^4.7.0",[m
[32m+[m[32m        "rehype-parse": "^8.0.2",[m
[32m+[m[32m        "unist-util-filter": "^4.0.0",[m
[32m+[m[32m        "unist-util-visit": "^4.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/rehype-stringify": {[m
       "version": "9.0.3",[m
       "resolved": "https://registry.npmjs.org/rehype-stringify/-/rehype-stringify-9.0.3.tgz",[m
[36m@@ -2892,6 +3096,24 @@[m
         "node": ">=6"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/sass": {[m
[32m+[m[32m      "version": "1.62.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/sass/-/sass-1.62.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-NHpxIzN29MXvWiuswfc1W3I0N8SXBd8UR26WntmDlRYf0bSADnwnOjsyMZ3lMezSlArD33Vs3YFhp7dWvL770A==",[m
[32m+[m[32m      "optional": true,[m
[32m+[m[32m      "peer": true,[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "chokidar": ">=3.0.0 <4.0.0",[m
[32m+[m[32m        "immutable": "^4.0.0",[m
[32m+[m[32m        "source-map-js": ">=0.6.2 <2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "sass": "sass.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=14.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/scheduler": {[m
       "version": "0.23.0",[m
       "resolved": "https://registry.npmjs.org/scheduler/-/scheduler-0.23.0.tgz",[m
[36m@@ -3101,7 +3323,7 @@[m
       "version": "5.0.1",[m
       "resolved": "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz",[m
       "integrity": "sha512-65P7iz6X5yEr1cwcgvQxbbIw7Uk3gOy5dIdtZ4rDveLqhrdJP+Li/Hx6tyK0NEb+2GCyneCMJiGqrADCSNk8sQ==",[m
[31m-      "dev": true,[m
[32m+[m[32m      "devOptional": true,[m
       "dependencies": {[m
         "is-number": "^7.0.0"[m
       },[m
[36m@@ -3192,6 +3414,16 @@[m
         "url": "https://opencollective.com/unified"[m
       }[m
     },[m
[32m+[m[32m    "node_modules/unist-util-filter": {[m
[32m+[m[32m      "version": "4.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/unist-util-filter/-/unist-util-filter-4.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-RynicUM/vbOSTSiUK+BnaK9XMfmQUh6gyi7L6taNgc7FIf84GukXVV3ucGzEN/PhUUkdP5hb1MmXc+3cvPUm5Q==",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "@types/unist": "^2.0.0",[m
[32m+[m[32m        "unist-util-is": "^5.0.0",[m
[32m+[m[32m        "unist-util-visit-parents": "^5.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "node_modules/unist-util-generated": {[m
       "version": "2.0.1",[m
       "resolved": "https://registry.npmjs.org/unist-util-generated/-/unist-util-generated-2.0.1.tgz",[m
[1mdiff --git a/package.json b/package.json[m
[1mindex 72a154d..7444534 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -18,6 +18,8 @@[m
     "next": "latest",[m
     "react": "^18.2.0",[m
     "react-dom": "^18.2.0",[m
[32m+[m[32m    "rehype": "^12.0.1",[m
[32m+[m[32m    "rehype-prism-plus": "^1.5.1",[m
     "rehype-stringify": "^9.0.3",[m
     "remark": "^14.0.2",[m
     "remark-gfm": "^3.0.1",[m
[36m@@ -27,6 +29,7 @@[m
     "typescript": "^4.7.4"[m
   },[m
   "devDependencies": {[m
[32m+[m[32m    "@tailwindcss/typography": "^0.5.9",[m
     "@types/node": "^18.0.3",[m
     "@types/react": "^18.0.15",[m
     "@types/react-dom": "^18.0.6",[m
[1mdiff --git a/pages/_app.tsx b/pages/_app.tsx[m
[1mindex 6ac887c..d5fb9f6 100644[m
[1m--- a/pages/_app.tsx[m
[1m+++ b/pages/_app.tsx[m
[36m@@ -1,5 +1,6 @@[m
 import { AppProps } from 'next/app'[m
 import '../styles/index.css'[m
[32m+[m[32mimport  '../styles/prismJs-aHighlighter.css'[m
 [m
 export default function MyApp({ Component, pageProps }: AppProps) {[m
   return <Component {...pageProps} />[m
[1mdiff --git a/pages/_document.tsx b/pages/_document.tsx[m
[1mindex 54e8bf3..15bc54b 100644[m
[1m--- a/pages/_document.tsx[m
[1m+++ b/pages/_document.tsx[m
[36m@@ -3,7 +3,10 @@[m [mimport { Html, Head, Main, NextScript } from 'next/document'[m
 export default function Document() {[m
   return ([m
     <Html lang="en">[m
[31m-      <Head />[m
[32m+[m[32m        <Head>[m
[32m+[m[32m            <link rel="stylesheet" href="/styles/prismJs-aHighlighter.css" />[m
[32m+[m[32m        </Head>[m
[32m+[m
         <body>[m
         <Main />[m
         <NextScript />[m
[1mdiff --git a/pages/posts/[slug].tsx b/pages/posts/[slug].tsx[m
[1mindex 84fdc28..c73ef93 100644[m
[1m--- a/pages/posts/[slug].tsx[m
[1m+++ b/pages/posts/[slug].tsx[m
[36m@@ -1,28 +1,29 @@[m
[31m-import { useRouter } from 'next/router'[m
[31m-import ErrorPage from 'next/error'[m
[31m-import Container from '../../components/container'[m
[31m-import PostBody from '../../components/post-body'[m
[31m-import Header from '../../components/header'[m
[31m-import PostHeader from '../../components/post-header'[m
[31m-import Layout from '../../components/layout'[m
[31m-import { getPostBySlug, getAllPosts } from '../../lib/api'[m
[31m-import PostTitle from '../../components/post-title'[m
[31m-import Head from 'next/head'[m
[31m-import { CMS_NAME } from '../../lib/constants'[m
[31m-import markdownToHtml from '../../lib/markdownToHtml'[m
[31m-import type PostType from '../../interfaces/post'[m
[32m+[m[32mimport { useRouter } from 'next/router';[m
[32m+[m[32mimport ErrorPage from 'next/error';[m
[32m+[m[32mimport Container from '../../components/container';[m
[32m+[m[32mimport PostBody from '../../components/post-body';[m
[32m+[m[32mimport Header from '../../components/header';[m
[32m+[m[32mimport PostHeader from '../../components/post-header';[m
[32m+[m[32mimport Layout from '../../components/layout';[m
[32m+[m[32mimport { getPostBySlug, getAllPosts } from '../../lib/api';[m
[32m+[m[32mimport PostTitle from '../../components/post-title';[m
[32m+[m[32mimport Head from 'next/head';[m
[32m+[m[32mimport { CMS_NAME } from '../../lib/constants';[m
[32m+[m[32mimport markdownToHtml from '../../lib/markdownToHtml';[m
[32m+[m[32mimport type PostType from '../../interfaces/post';[m
[32m+[m
 [m
 type Props = {[m
[31m-  post: PostType[m
[31m-  morePosts: PostType[][m
[31m-  preview?: boolean[m
[31m-}[m
[32m+[m[32m  post: PostType;[m
[32m+[m[32m  morePosts: PostType[];[m
[32m+[m[32m  preview?: boolean;[m
[32m+[m[32m};[m
 [m
 export default function Post({ post, morePosts, preview }: Props) {[m
[31m-  const router = useRouter()[m
[31m-  const title = `${post.title} | ${CMS_NAME}'s blog`[m
[32m+[m[32m  const router = useRouter();[m
[32m+[m[32m  const title = `${post.title} | ${CMS_NAME}'s blog`;[m
   if (!router.isFallback && !post?.slug) {[m
[31m-    return <ErrorPage statusCode={404} />[m
[32m+[m[32m    return <ErrorPage statusCode={404} />;[m
   }[m
   return ([m
       <Layout preview={preview}>[m
[36m@@ -49,14 +50,14 @@[m [mexport default function Post({ post, morePosts, preview }: Props) {[m
           )}[m
         </Container>[m
       </Layout>[m
[31m-  )[m
[32m+[m[32m  );[m
 }[m
 [m
 type Params = {[m
   params: {[m
[31m-    slug: string[m
[31m-  }[m
[31m-}[m
[32m+[m[32m    slug: string;[m
[32m+[m[32m  };[m
[32m+[m[32m};[m
 [m
 export async function getStaticProps({ params }: Params) {[m
   const post = getPostBySlug(params.slug, [[m
[36m@@ -67,11 +68,9 @@[m [mexport async function getStaticProps({ params }: Params) {[m
     'content',[m
     'ogImage',[m
     'coverImage',[m
[31m-  ])[m
[31m-[m
[31m-  const content = await markdownToHtml(post.content || '')[m
[31m-  //console.log(content)[m
[32m+[m[32m  ]);[m
 [m
[32m+[m[32m  const content = await markdownToHtml(post.content || '');[m
 [m
   return {[m
     props: {[m
[36m@@ -80,11 +79,11 @@[m [mexport async function getStaticProps({ params }: Params) {[m
         content,[m
       },[m
     },[m
[31m-  }[m
[32m+[m[32m  };[m
 }[m
 [m
 export async function getStaticPaths() {[m
[31m-  const posts = getAllPosts(['slug'])[m
[32m+[m[32m  const posts = getAllPosts(['slug']);[m
 [m
   return {[m
     paths: posts.map((post) => {[m
[36m@@ -92,8 +91,8 @@[m [mexport async function getStaticPaths() {[m
         params: {[m
           slug: post.slug,[m
         },[m
[31m-      }[m
[32m+[m[32m      };[m
     }),[m
     fallback: false,[m
[31m-  }[m
[32m+[m[32m  };[m
 }[m
[1mdiff --git a/public/assets/blog/symbol-and-itsenglish/code_block_example.PNG b/public/assets/blog/symbol-and-itsenglish/code_block_example.PNG[m
[1mnew file mode 100644[m
[1mindex 0000000..949b35c[m
Binary files /dev/null and b/public/assets/blog/symbol-and-itsenglish/code_block_example.PNG differ
[1mdiff --git a/styles/prismJs-aHighlighter.css b/styles/prismJs-aHighlighter.css[m
[1mnew file mode 100644[m
[1mindex 0000000..0f4fe7f[m
[1m--- /dev/null[m
[1m+++ b/styles/prismJs-aHighlighter.css[m
[36m@@ -0,0 +1,140 @@[m
[32m+[m[32m/*[m
[32m+[m[32m * Synthwave '84 Theme originally by Robb Owen [@Robb0wen] for Visual Studio Code[m
[32m+[m[32m * Demo: https://marc.dev/demo/prism-synthwave84[m
[32m+[m[32m *[m
[32m+[m[32m * Ported for PrismJS by Marc Backes [@themarcba][m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mcode[class*="language-"],[m
[32m+[m[32mpre[class*="language-"] {[m
[32m+[m[32m    color: #f92aad;[m
[32m+[m[32m    text-shadow: 0 0 2px #100c0f, 0 0 5px #dc078e33, 0 0 10px #fff3;[m
[32m+[m[32m    background: none;[m
[32m+[m[32m    font-family: Consolas, Monaco, 'Andale Mono', 'Ubuntu Mono', monospace;[m
[32m+[m[32m    font-size: 1em;[m
[32m+[m[32m    text-align: left;[m
[32m+[m[32m    white-space: pre;[m
[32m+[m[32m    word-spacing: normal;[m
[32m+[m[32m    word-break: normal;[m
[32m+[m[32m    word-wrap: normal;[m
[32m+[m[32m    line-height: 1.5;[m
[32m+[m
[32m+[m[32m    -moz-tab-size: 4;[m
[32m+[m[32m    -o-tab-size: 4;[m
[32m+[m[32m    tab-size: 4;[m
[32m+[m
[32m+[m[32m    -webkit-hyphens: none;[m
[32m+[m[32m    -moz-hyphens: none;[m
[32m+[m[32m    -ms-hyphens: none;[m
[32m+[m[32m    hyphens: none;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/* Code blocks */[m
[32m+[m[32mpre[class*="language-"] {[m
[32m+[m[32m    padding: 1em;[m
[32m+[m[32m    margin: .5em 0;[m
[32m+[m[32m    overflow: auto;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m:not(pre) > code[class*="language-"],[m
[32m+[m[32mpre[class*="language-"] {[m
[32m+[m[32m    background-color: transparent !important;[m
[32m+[m[32m    background-image: linear-gradient(to bottom, #2a2139 75%, #34294f);[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/* Inline code */[m
[32m+[m[32m:not(pre) > code[class*="language-"] {[m
[32m+[m[32m    padding: .1em;[m
[32m+[m[32m    border-radius: .3em;[m
[32m+[m[32m    white-space: normal;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.comment,[m
[32m+[m[32m.token.block-comment,[m
[32m+[m[32m.token.prolog,[m
[32m+[m[32m.token.doctype,[m
[32m+[m[32m.token.cdata {[m
[32m+[m[32m    color: #8e8e8e;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.punctuation {[m
[32m+[m[32m    color: #ccc;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.tag,[m
[32m+[m[32m.token.attr-name,[m
[32m+[m[32m.token.namespace,[m
[32m+[m[32m.token.number,[m
[32m+[m[32m.token.unit,[m
[32m+[m[32m.token.hexcode,[m
[32m+[m[32m.token.deleted {[m
[32m+[m[32m    color: #e2777a;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.property,[m
[32m+[m[32m.token.selector {[m
[32m+[m[32m    color: #72f1b8;[m
[32m+[m[32m    text-shadow: 0 0 2px #100c0f, 0 0 10px #257c5575, 0 0 35px #21272475;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.function-name {[m
[32m+[m[32m    color: #6196cc;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.boolean,[m
[32m+[m[32m.token.selector .token.id,[m
[32m+[m[32m.token.function {[m
[32m+[m[32m    color: #fdfdfd;[m
[32m+[m[32m    text-shadow: 0 0 2px #001716, 0 0 3px #03edf975, 0 0 5px #03edf975, 0 0 8px #03edf975;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.class-name {[m
[32m+[m[32m    color: #fff5f6;[m
[32m+[m[32m    text-shadow: 0 0 2px #000, 0 0 10px #fc1f2c75, 0 0 5px #fc1f2c75, 0 0 25px #fc1f2c75;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.constant,[m
[32m+[m[32m.token.symbol {[m
[32m+[m[32m    color: #f92aad;[m
[32m+[m[32m    text-shadow: 0 0 2px #100c0f, 0 0 5px #dc078e33, 0 0 10px #fff3;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.important,[m
[32m+[m[32m.token.atrule,[m
[32m+[m[32m.token.keyword,[m
[32m+[m[32m.token.selector .token.class,[m
[32m+[m[32m.token.builtin {[m
[32m+[m[32m    color: #f4eee4;[m
[32m+[m[32m    text-shadow: 0 0 2px #393a33, 0 0 8px #f39f0575, 0 0 2px #f39f0575;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.string,[m
[32m+[m[32m.token.char,[m
[32m+[m[32m.token.attr-value,[m
[32m+[m[32m.token.regex,[m
[32m+[m[32m.token.variable {[m
[32m+[m[32m    color: #f87c32;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.operator,[m
[32m+[m[32m.token.entity,[m
[32m+[m[32m.token.url {[m
[32m+[m[32m    color: #67cdcc;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.important,[m
[32m+[m[32m.token.bold {[m
[32m+[m[32m    font-weight: bold;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.italic {[m
[32m+[m[32m    font-style: italic;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.entity {[m
[32m+[m[32m    cursor: help;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.token.inserted {[m
[32m+[m[32m    color: green;[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/tailwind.config.js b/tailwind.config.js[m
[1mindex eb65df1..f18ad3d 100644[m
[1m--- a/tailwind.config.js[m
[1m+++ b/tailwind.config.js[m
[36m@@ -1,4 +1,5 @@[m
 /** @type {import('tailwindcss').Config} */[m
[32m+[m
 module.exports = {[m
   content: ['./components/**/*.tsx', './pages/**/*.tsx'],[m
   theme: {[m
