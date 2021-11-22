# UML 上午 第 21 组 期中作业

## 用例图

![Usecase](D:/repositories/UML-Lesson/out/src/Usecase/Usecase.svg)

> 



## 类图

![类图](D:/repositories/UML-Lesson/out/src/Class/%E7%B1%BB%E5%9B%BE.svg)

> 基于 Go 语言编写的程序类，多数类使用了 Go 语言内置的 RWMutex 类进行读写的互斥访问。
>
> 根据使用的对象不同，分成了 客户端 Client ，主服务端 Master 和 储存端 Chunkserver。
>
> 客户端中，首先是需要 Master 服务器的地址和 `租约lease` 的变量作为主要的数据操作主体，提供增删改查、新建文件夹、追加写入、读写追加 Chunk 等方法，丰富客户端的使用。其次是 租约 作为权限的校验通过访问Master服务器获取到对应的访问时常、buffer 进而能顺利地对文件进行相关操作。
>
> Master中，对服务器的状态和服务器地址有变量的储存，对服务器初始化提供方法。与其他服务器之间的交流则通过 `RPC` 协议进行，为此提供了多个基于 `RPC` 协议的方法，如心跳包、获取到 `Primary Chunkserver`，增删改查文件等操作。另外则是要对 Chunkserver 进行管理的相关类，储存服务器的信息、文件的信息，并与Chunkserver进行通信的方法，如序列、反序列化、增删改查 Chunkserver 等。最重要的则是对文件储存时安排的 Namespace 进行管理，包括对 Namespace 进行 树 的格式化和反格式化，进行上锁以保证安全，增删改查树节点的操作。
>
> 并对类的功能进行归类和整合，规范化API的格式并提供给程序使用，因此建了 `gfs` 的包用以清晰的罗列。
>
> 其他则是工具类，ArraySet 用于简单的储存需要进行 `顺序化` 操作的顺序，并按照顺序依次完成服务。

## 活动图

### 主要

![活动图](D:/repositories/UML-Lesson/out/src/Activity/main/%E6%B4%BB%E5%8A%A8%E5%9B%BE.svg)

> 首先对用户是否进行注册进行校验，确认完成注册后对用户的权限进行校验和缓存，以防止用户错误的操作非其拥有的文件。
>
> 提供
>
> - 下载 Download
> - 上传 Upload
> - 罗列 List
> - 删除 Delete
>
> 四个操作



### 删除

![Delete](D:/repositories/UML-Lesson/out/src/Activity/section-delete/Delete.svg)

> 对文件进行删除则只是对文件重命名为 `datestamp` 时间日期格式的文件，以此标识该文件为隐藏文件不可用，等待 Master 或者 Chunkserver 进行回收操作
>
> Master 服务器会在空闲进行定期的垃圾回收操作，对待删除的块的索引进行删除，对孤立块删除索引和元文件，并通知 chunkserver 进行删除的操作。



### 下载



![Download](D:/repositories/UML-Lesson/out/src/Activity/section-download/Download.svg)

> 由客户端选择指定的文件，发送请求到 Master 中，Master 对文件的索引进行查找并找寻对应块所在的 chunkserver 位置，由 chunksever 向客户端进行数据流的传输。



### 罗列



![List](D:/repositories/UML-Lesson/out/src/Activity/section-list/List.svg)

> 客户端指定需要查询罗列的文件，向 Master 进行请求，Master 通过 Namespace 查询到对应的块之后发送请求到 Chunkserver，收集好块的信息后 Master 向客户端返回相应的信息。



### 上传

![Upload](D:/repositories/UML-Lesson/out/src/Activity/section-upload/Upload.svg)

> 客户端先请求一个租约，用来指明文件的储存具体信息。 Master 对文件进行检查，寻找是否已经存在进而分配 Replica 服务器给用户，返回服务器的相关信息。用户收到后进行数据推流。Replica 对用户推送过来的数据推送到所有的 次级replica 服务器，并按照顺寻通知解决 `mutation` 即文件变更的问题。如果有错误则在返回时包含错误信息。



### Master - Namespace 管理

![Master Function](D:/repositories/UML-Lesson/out/src/Activity/function-master/Master%20Function.svg)

> 对 `d1/d2/leaf` 文件，和目标地址 `a1/d2/leaf` 作为示例。
>
> 进行快照时，先对目标地址的上上级目录读锁，对上级目录写锁。
>
> 进行创建文件时，对原地址的上上级和目标地址的上级读锁，对目标地址写锁。
>
> 这种 **读写锁** 机制允许了文件的操作可以进行并发，防止了地址移除、重命名、快照时的不一致问题。
>
> 对文件地址进行序列化操作，能允许进行多重创建，即相同目录下可以有相同的文件名。
>
> 严格的顺序化机制也防止了死锁的发生。



### Chunkserver

![ChunkServer](D:/repositories/UML-Lesson/out/src/Activity/function-chunkserver/ChunkServer.svg)

> Chunkserver 的最主要的目标即对文件的管理更高效、条理化，同时尽可能的使用全部的机器，对每台机器的磁盘使用率保持基本相同，避免某台机器的储存利用率远远大于其他的服务器。
>
> 因此在 Master 要求新建文件时，尽可能满足上述要求的对新建的文件位置进行分配。
>
> 为保证最大的可用性，对任一台 Chunkserver 提供一个 `backup 备份` 和一个 `shadow 影子` 服务器，备份服务器是及时同步的，用来随时替代宕机的 chunkserver。影子服务器则是准及时同步，且内容是只读的。
>
> 对于数据的完整性，chunkserver 提供 32位 的文件校验，文件的校验信息的储存是独立于文件储存的空间中，且在每次返回时进行校验，对能够解决的数据不完整问题进行解决。
