# mdpdf-docker

将Markdown转换为PDF的工具容器

## 使用

假设构建的镜像名为`mdpdf`，执行：

```shell
docker run --rm -v `pwd`:/mdpdf mdpdf -s gh-theme.css <YOUR.md>
```

即可在**当前目录**下生成`YOUR.pdf`文件，样式为仿Github的样式。

## 原理

`markdown-pdf`先将Markdown文件转换成HTML，再利用PhantomJS生成PDF。

>后期考虑使用Puppeteer对这个项目进行重构。

## 参考

https://github.com/alanshaw/markdown-pdf
https://hub.docker.com/r/dalibo/pandocker
https://hub.docker.com/r/alekzonder/puppeteer/dockerfile

