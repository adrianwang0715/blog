# CS61A 教材中文版（第 2 / 3 / 4 章）

《Composing Programs》（CS 61A 配套教材）中文翻译。

- 原文：https://composingprograms.com/versions/v1/pages/21-introduction.html
- 版本：Version 1（2014 年）
- 翻译时间：2026-10-11
- 说明：**代码块、行内代码、公式一律保持原文**，仅正文译为简体中文；关键术语首次出现处标注英文。

---

## 第 2 章 用对象构建抽象

| 文件 | 标题 | 大小 |
|---|---|---|
| [2.1-Introduction.md](2.1-Introduction.md) | 2.1 引言 | 6.8 KB |
| [2.2-Data-Abstraction.md](2.2-Data-Abstraction.md) | 2.2 数据抽象 | 13.5 KB |
| [2.3-Sequences.md](2.3-Sequences.md) | 2.3 序列 | 31.5 KB |
| [2.4-Mutable-Data.md](2.4-Mutable-Data.md) | 2.4 可变数据 | 45.0 KB |
| [2.5-Object-Oriented-Programming.md](2.5-Object-Oriented-Programming.md) | 2.5 面向对象编程 | 31.7 KB |
| [2.6-Implementing-Classes-and-Objects.md](2.6-Implementing-Classes-and-Objects.md) | 2.6 实现类与对象 | 9.6 KB |
| [2.7-Recursive-Data-Structures.md](2.7-Recursive-Data-Structures.md) | 2.7 递归数据结构 | 31.1 KB |
| [2.8-Generic-Operations.md](2.8-Generic-Operations.md) | 2.8 泛型操作 | 29.4 KB |

## 第 3 章 解释计算机程序

| 文件 | 标题 | 大小 |
|---|---|---|
| [3.1-Introduction.md](3.1-Introduction.md) | 3.1 引言 | 2.5 KB |
| [3.2-Functional-Programming.md](3.2-Functional-Programming.md) | 3.2 函数式编程 | 12.1 KB |
| [3.3-Exceptions.md](3.3-Exceptions.md) | 3.3 异常 | 8.0 KB |
| [3.4-Interpreters-for-Languages-with-Combination.md](3.4-Interpreters-for-Languages-with-Combination.md) | 3.4 具有组合能力的语言的解释器 | 15.2 KB |
| [3.5-Interpreters-for-Languages-with-Abstraction.md](3.5-Interpreters-for-Languages-with-Abstraction.md) | 3.5 具有抽象能力的语言的解释器 | 9.9 KB |

## 第 4 章 数据处理

| 文件 | 标题 | 大小 |
|---|---|---|
| [4.1-Introduction.md](4.1-Introduction.md) | 4.1 引言 | 1.2 KB |
| [4.2-Implicit-Sequences.md](4.2-Implicit-Sequences.md) | 4.2 隐式序列 | 21.6 KB |
| [4.3-Declarative-Programming.md](4.3-Declarative-Programming.md) | 4.3 声明式编程 | 9.9 KB |
| [4.4-Unification.md](4.4-Unification.md) | 4.4 合一 | 10.2 KB |
| [4.5-Distributed-Computing.md](4.5-Distributed-Computing.md) | 4.5 分布式计算 | 12.5 KB |
| [4.6-Distributed-Data-Processing.md](4.6-Distributed-Data-Processing.md) | 4.6 分布式数据处理 | 9.6 KB |
| [4.7-Parallel-Computing.md](4.7-Parallel-Computing.md) | 4.7 并行计算 | 21.9 KB |

**共 20 节、446 个代码块**，已逐块与英文原文比对，内容完全一致。代码块按内容自动标注语言
（```python / ```scheme / ```bash）：Python 缩进、`>>>` 交互记录、Scheme 的 `>` 会话、logic 查询、
shell 命令均原样保留。

---

## 各节内容速览

### 第 2 章

- **2.1 引言**：对象隐喻、原生数据类型（int / float / complex / bool）
- **2.2 数据抽象**：有理数算术、构造器与选择器、抽象屏障、数据的性质
- **2.3 序列**：元组、序列迭代与解包、嵌套对、递归列表、字符串、序列处理
- **2.4 可变数据**：列表、字典、局部状态、非局部赋值的收益与代价、列表与字典的实现、分派字典、约束传播
- **2.5 面向对象编程**：类、实例、属性、方法、继承、消息传递、面向对象的程序设计
- **2.6 实现类与对象**：用函数与字典自举实现一个对象系统
- **2.7 递归数据结构**：树、集合、递归列表的树状表示、树上的递归
- **2.8 泛型操作**：类型分派、数据导向编程、类型转换、多态、虚函数与继承

### 第 3 章

- **3.1 引言**：解释器与编程语言概览
- **3.2 函数式编程**：Scheme 基础、Lambda 表达式、符号数据、递归与尾递归
- **3.3 异常**：抛出与捕获异常、断言、异常层级
- **3.4 具有组合能力的语言的解释器**：Calculator 语言、词法与语法分析、递归下降解析器、REPL
- **3.5 具有抽象能力的语言的解释器**：Scheme 求值器、环境与帧、过程与词法作用域

### 第 4 章

- **4.1 引言**：数据处理与数据流概览
- **4.2 隐式序列**：迭代器、可迭代对象、生成器、惰性求值
- **4.3 声明式编程**：数据库、事实与查询、`logic` 查询语言、递归规则
- **4.4 合一**：模式匹配、合一算法、逻辑式程序设计
- **4.5 分布式计算**：消息传递、客户端与服务器、对等网络
- **4.6 分布式数据处理**：MapReduce 模型、mapper / reducer、批处理
- **4.7 并行计算**：线程、多进程、竞态条件、同步与锁、死锁

## 配图说明

正文中的图片引用了原站相对路径 `../img/xxx.png`，对应的 10 张配图已一并下载到
`course/img/`，本地离线可直接显示：

- `barriers.png` —— 抽象屏障（2.2）
- `interface.png` —— 接口分层（2.2）
- `constraints.png` —— 约束网络（2.4）
- `multiple_inheritance.png` —— 多重继承（2.5）
- `set_trees.png` —— 树状集合（2.7）
- `star.png` / `sier.png` —— 星形 / 谢尔宾斯基三角递归作图（3.2）
- `factorial_machine.png` —— 阶乘求值过程（3.5）
- `clientserver.png` —— 客户端 / 服务器（4.5）
- `deadlock.png` —— 死锁（4.7）

---

## 尚未翻译

第 1 章（1.1–1.7）仍未翻译。如需补齐，可复用 `_tools/convert.py`（HTML → Markdown，
含代码语言自动识别）与 `_tools/check_struct.py`（结构校验）。

