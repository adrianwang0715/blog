---
title: Lab 03
published: 2026-10-11
description: CS61A Lab 03 学习笔记 —— 列表、列表推导式、for 语句与类型检查。
image: ''
tags: [CS61A, Python, 学习笔记]
category: 学习
draft: false
lang: ''
slug: lab-03
---

## 知识部分

### 1. 列表

列表中的每个位置都有一个索引，最左边的元素索引为 0。

```python
>>> list_of_values = [2, 1, 3, True, 3]
>>> nested_list = [2, [1, 3], [True, [3]]]
>>> list_of_values[0]
2
>>> nested_list[1]
[1, 3]
```

负索引从末尾开始计数，最右边的元素索引为 -1。

```python
>>> nested_list[-1]
[True, [3]]
```

添加列表会创建一个更长的列表，其中包含所添加列表的元素。

```python
>>> [1, 2] + [3] + [4, 5]
[1, 2, 3, 4, 5]
```

下面是一些例子：

```python
>>> s = [7//3, 5, [4, 0, 1], 2]
>>> s[0]
2
>>> s[2]
[4, 0, 1]
>>> s[-1]
2
>>> len(s)
4
>>> 4 in s
False
>>> 4 in s[2]
True
>>> s[2] + [3 + 2]
[4, 0, 1, 5]
>>> 5 in s[2]
False
>>> s[2] * 2
[4, 0, 1, 4, 0, 1]
>>> list(range(3, 6))
[3, 4, 5]
>>> range(3, 6)
range(3, 6)
>>> r = range(3, 6)
>>> [r[0], r[2]]
[3, 5]
>>> range(4)[-1]
3
```

### 2. 列表推导式

有两种形式：

```
[<expression> for <element> in <sequence>]
[<expression> for <element> in <sequence> if <conditional>]
```

下面是一个示例：它从 `[1, 2, 3, 4]` 开始，使用 `if i % 2 == 0` 挑出偶数元素 2 和 4，
然后用 `i*i` 对它们分别求平方。`for i` 的作用是为 `[1, 2, 3, 4]` 中的每个元素命名。

```python
>>> [i*i for i in [1, 2, 3, 4] if i % 2 == 0]
[4, 16]
```

这个列表推导式求值结果为一个列表，包含：

- `i*i` 的值
- 对于序列 `[1, 2, 3, 4]` 中的每个元素 `i`
- 对于哪个 `i % 2 == 0`

换句话说，这个列表推导式将创建一个新列表，其中包含原始列表 `[1, 2, 3, 4]` 中每个偶数元素的平方。

我们也可以将列表推导式改写为等价的 for 语句，例如上面的例子：

```python
>>> result = []
>>> for i in [1, 2, 3, 4]:
...     if i % 2 == 0:
...         result = result + [i*i]
>>> result
[4, 16]
```

### 3. for 语句

for 语句会为序列（如列表或范围）的每个元素执行代码。
每次执行代码时，紧跟在 for 后面的名称会绑定到序列中的不同元素。

```python
for <name> in <expression>:
    <suite>
```

首先，对 `<expression>` 进行求值。它必须求值为一个序列。然后，按顺序对序列中的每个元素：

1. `<name>` 与该元素绑定。
2. `<suite>` 被执行。

这是一个例子：

```python
for x in [-1, 4, 2, 0, 5]:
    print("Current elem:", x)
```

这将显示以下内容：

```
Current elem: -1
Current elem: 4
Current elem: 2
Current elem: 0
Current elem: 5
```

### 4. 类型检查

类型提示可以出现在 assignment 和 def 语句（以及其他少数地方）中，用以指示变量应具有的值类型，或函数应返回的值类型。

一个没有类型提示的示例：

```python
x = 4

def pair(y, z):
    return [y, z]
```

同样的示例，带有类型提示，表明 `x`、`y` 和 `z` 是整数，并且 `pair` 函数返回一个整数列表：

```python
x: int = 4

def pair(y: int, z: int) -> list[int]:
    return [y, z]
```

无论是否使用类型提示，代码的行为都完全相同。

## 代码练习

### 1. close_list

实现 `close_list`，它接受一个整数列表 `s` 和一个非负整数 `k`。它返回 `s` 中那些与其索引相差不超过 `k` 的元素组成的列表，即元素与其索引之差的绝对值小于或等于 `k`。

```python
def close_list(s: list[int], k: int) -> list[int]:
    """Return a list of the elements of s that are within k of their index.

    >>> t = [6, 2, 4, 3, 5]
    >>> close_list(t, 0)  # Only 3 is equal to its index
    [3]
    >>> close_list(t, 1)  # 2, 3, and 5 are within 1 of their index
    [2, 3, 5]
    >>> close_list(t, 2)  # 2, 3, 4, and 5 are all within 2 of their index
    [2, 4, 3, 5]
    """
    assert k >= 0
    return [___ for i in range(len(s)) if ___]
```

**解答：**

```python
assert k >= 0
return [s[i] for i in range(len(s)) if abs(s[i] - i) <= k]
```

### 2. make_onion

编写一个函数 `make_onion`，它接收两个单参数函数 `f` 和 `g`。它返回一个函数，该函数接收三个参数：`x`、`y` 和 `limit`。如果可以使用最多 `limit` 次对 `f` 和 `g` 的调用从 `x` 到达 `y`，则返回的函数返回 `True`，否则返回 `False`。

例如，如果 `f` 加 1，`g` 翻倍，那么通过四次调用可以从 5 达到 25：`f(g(g(f(5))))`。

```python
def make_onion(f, g):
    """Return a function can_reach(x, y, limit) that returns
    whether some call expression containing only f, g, and x with
    up to limit calls will give the result y.

    >>> up = lambda x: x + 1
    >>> double = lambda y: y * 2
    >>> can_reach = make_onion(up, double)
    >>> can_reach(5, 25, 4)      # 25 = up(double(double(up(5))))
    True
    >>> can_reach(5, 25, 3)      # Not possible
    False
    >>> can_reach(1, 1, 0)      # 1 = 1
    True
    >>> add_ing = lambda x: x + "ing"
    >>> add_end = lambda y: y + "end"
    >>> can_reach_string = make_onion(add_ing, add_end)
    >>> can_reach_string("cry", "crying", 1)      # "crying" = add_ing("cry")
    True
    >>> can_reach_string("un", "unending", 3)     # "unending" = add_ing(add_end("un"))
    True
    >>> can_reach_string("peach", "folding", 4)   # Not possible
    False
    """
    def can_reach(x, y, limit):
        if limit < 0:
            return ____
        elif x == y:
            return ____
        else:
            return can_reach(____, ____, limit - 1) or can_reach(____, ____, limit - 1)
    return can_reach
```

**解答：**

```python
def can_reach(x, y, limit):
    if limit < 0:
        return False
    elif x == y:
        return True
    else:
        return can_reach(f(x), y, limit - 1) or can_reach(g(x), y, limit - 1)
return can_reach
```
