# Typst 模板

> 参考 [simple-paper](https://github.com/jinhao-huang/SimplePaper.git)

`./template.typ` 为模板文件, 如果要使用模板，请在文档最上方加入:

```typst
#import "template.typ": *

#show: project.with(
  title: "TITLE",
  authors: (
    (
      name: "Wonderland",
      email: "example@com"
    ),
  ),
)


```

## 字体

- 正文部分，英文字体设置的是 「New Computer Modern」
- 代码字体设置的是「JetBrainsMono NF」
- 可以使用 `typst fonts| grep <>` 来查看字体是否可用, 如果不可用，可以在 `templated.typ` 中替换为系统可用的字体。

更详细的配置请移步 `template.typ`

## 显示效果

`main.typ` 的导出效果

![](./img/1.jpg)
![](./img/2.jpg)
![](./img/3.jpg)

## 导出 

- `typst c <file>`
- 使用 vscode 的 typst 插件导出

## 教程推荐

- [官方教程](https://typst.app/docs/tutorial/)
- [数学符号一览](https://typst.app/docs/reference/symbols/sym/)
- [中文教程](https://typst-doc-cn.github.io/tutorial/)
- [typst-example](https://github.com/sitandr/typst-examples-book)
- [视频教程](https://www.bilibili.com/video/BV1AJ4m1j7Sa)