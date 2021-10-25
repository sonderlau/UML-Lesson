# UML-Lesson

## 上手步骤

1.  clone 本仓库

2.  学习、了解并熟知 Google File System

3.  阅读使用编程语言实现的项目 推荐 goGFS

4.  每次作业发布时 阅读相关章节的 PlantUML 写法并仿照该写法完成任务

5.  使用 PlantUML 对源码编译并输出 PNG 或 SVG 类型的图片

6.  \[可选] 编写 `word` 文档并等待组长提交作业

## 项目结构说明

| 文件或文件夹                                                  | 说明               | 注                                         |
| ------------------------------------------------------- | ---------------- | ----------------------------------------- |
| plantuml.jar                                            | plantuml jar执行文件 | 可直接运行并输出                                  |
| src/                                                    | 编写uml图的源代码储存地址   | 建议使用`.puml`或`.wsd` 作为文件格式 当然`.txt`等格式也不影响 |
| reference/gfs-sosp2003.pdf                              | GFS 论文           | 纯英文版 可以到网上找译文                             |
| reference/PlantUML_Language_Reference_Guide_zh.pdf      | PlantUML 语法参考指南  |                                           |
| reference/goGFS                                         | 项目实现源码(Go)       | 推荐参考此项目 写的很好                              |
| reference/Google-File-System-Implementation-with-Python | 项目实现源码(Python)   |                                           |
| out/                                                    | 输出图片存放           | 推荐输出 `svg` 格式图片                           |
| docs/                                                   | 用于交作业的word文件存储   |                                           |

## 操作指南

### 环境搭建

*   Java **必需**

*   Graphviz **大部分图的绘制都需要 因此也是必需**

由于项目中 **二进制文件** 过多 因此使用了 `Git LFS`

[Git LFS 使用指南](https://www.jianshu.com/p/493b81544f80)

#### Java

网上下载安装即可

Orace AdoptOpenJDK 都可以

#### Graphviz

[Graphviz Download](https://www.graphviz.org/download/)

下载安装即可

### VS Code

推荐使用 VS Code 编辑文件，更加方便

在扩展中搜索 **PlantUML** 作者为 jebbs

下载后安装插件后 打开源码文件(`.wsd | .puml`)

右键选择 **预览光标位置图表** 打开即时预览图片

右键选择 **导出当前文件图表** 选择相应格式即可在 out 文件夹下找到对应的文件

> 推荐输出 `svg` 格式 其他格式有输出的结果不全的问题

### 命令行

```bash
java -jar plantuml.jar -svg /src/Class.wsd -o /out/
```

**不推荐使用 但如果有需要可以按照上述的格式进行输出**

### commit

每次完成之后记得使用 commit 并 push 你的提交

如果是非项目成员 可 Fork 后提交 `pull request`

### 参考资料

*   网友的 Demo 集合 [Real World PlantUML](https://real-world-plantuml.com/)

*   [PlantUML Homepage](https://plantuml.com/zh/)

*   Google File System 解读

    *   <https://cloud.tencent.com/developer/article/1783774>

    *   <https://duanmeng.github.io/2017/12/07/gfs-notes/>

    *   <https://mr-dai.github.io/gfs/>

    *   <https://andrewei1316.github.io/2020/10/05/google-file-system/>

*
