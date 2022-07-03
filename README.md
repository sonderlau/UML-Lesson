# UML-Lesson

**四人全部获得优秀🙂**

## 上手步骤

1.  clone 本仓库

2.  学习、了解并熟知 Google File System

3.  阅读使用编程语言实现的项目 推荐 goGFS

4.  每次作业发布时 阅读相关章节的 PlantUML 写法并仿照该写法完成任务

5.  使用 PlantUML 对源码编译并输出 PNG 或 SVG 类型的图片

6.  \[可选] 编写 `word` 文档并等待组长提交作业

## 项目结构说明

| 文件或文件夹                                              | 说明                     | 注                                 |
| --------------------------------------------------------- | ------------------------ | ---------------------------------- |
| `plantuml.jar`                                            |                          |                                    |
| `GoogleFileSystemDesignModel.mdl`                         | Rose 的导出文件          | 只用于交作业 不够美观              |
| `mid-term.md`                                             | 期中报告                 |                                    |
| `src/`                                                    | UML图的源代码            | 建议使用`.puml`或`.wsd` 文件格式   |
| `reference/gfs-sosp2003.pdf`                              | GFS 论文                 | 英文版 可以到网上找译文            |
| `reference/PlantUML_Language_Reference_Guide_zh.pdf`      | PlantUML 语法参考指南    |                                    |
| `reference/goGFS`                                         | 项目实现源码(Go)         | 推荐参考此项目 写的很好            |
| `reference/Google-File-System-Implementation-with-Python` | 项目实现源码(Python)     |                                    |
| `out/`                                                    | 输出图片存放             | 推荐 `svg` 格式                    |
| `docs/`                                                   | 用于交作业的word文件存储 | 项目内只保留期中和期末的 docx 文件 |

## 操作指南

### 环境搭建

*   Java **必需**

*   Graphviz **必需**

由于项目中 **二进制文件** 过多 因此使用了 `Git LFS`

[Git LFS 使用指南](https://www.jianshu.com/p/493b81544f80)

#### Java

网上下载安装即可

Orace 或 AdoptOpenJDK 都可以

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
java -jar plantuml.jar -charset utf-8 -svg /src/Class.wsd -o /out/
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
    *   `reference/Notes-Google File System.one` **个人总结笔记**
*   `reference/Notes-Google File System.pdf` **个人总结笔记** 为上一个的 pdf 导出



## 分工

| Chapter      | 人员     | 备注               |
| ------------ | -------- | ------------------ |
| Usecase      | 洪 潘    |                    |
| Class        | 刘       |                    |
| Activity     | 刘       |                    |
| Mid-Term     | 洪 潘 刘 | 整合前三次作业     |
| Sequence     | 刘 洪    |                    |
| Component    | 洪 潘 刘 |                    |
| Deployment   | 洪 潘 刘 |                    |
| Rose         | 洪 潘 刘 | 使用 Rose 重绘     |
| Final Report | 江       | 整合图表的最终报告 |



| 姓名 | 贡献度 |
| :--: | :----: |
|  刘  |  28 %  |
|  洪  |  25 %  |
|  潘  |  25 %  |
|  江  |  22 %  |



