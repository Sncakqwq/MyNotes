# PyTorch 简介

## 1. 什么是 PyTorch？

**PyTorch 是一个开源的 Python 机器学习 / 深度学习框架**，主要用于**人工智能**领域，例如：

- 计算机视觉（CV）
- 自然语言处理（NLP）
- 深度学习
- 科学计算

PyTorch 底层使用 C++ 实现，同时提供 Python 接口，方便进行模型开发和训练。

## 2. PyTorch 的核心特点 ⭐

PyTorch 最重要的两个特点：

### ① Tensor（张量）计算

PyTorch 使用 **Tensor（张量）** 作为核心数据结构。

Tensor 可以简单理解为：

**一种用于存储和计算数据的多维数组。**

它与 NumPy 数组类似，但 PyTorch 的 Tensor 可以：

- 在 CPU / GPU 等设备上进行计算
- 进行高效的矩阵和张量运算
- 配合自动求导进行神经网络训练

因此：

> **Tensor 是学习 PyTorch 必须掌握的第一个核心概念。** 

------

### ② 自动微分（Autograd）

PyTorch 可以自动计算神经网络训练过程中需要的**梯度**。

简单理解：

```cc
输入数据
   ↓
神经网络
   ↓
得到预测结果
   ↓
计算 Loss
   ↓
反向传播
   ↓
计算梯度
   ↓
更新模型参数
```



PyTorch 的 `autograd` 会自动完成梯度计算。

以后你会经常看到：

```python
loss.backward()
```

它就是反向传播、计算梯度的关键步骤之一。

**现在不用急着完全理解 Autograd，后面会专门学习。**

# 3. PyTorch 的三个重要模块 ⭐

PyTorch 包含很多子模块，其中目前最需要记住三个：

```
torch
 ├── torch.nn
 ├── torch.optim
 └── torch.autograd
```

### `torch`

PyTorch 的基础模块。

主要负责：

- Tensor 创建
- Tensor 运算
- 数学运算
- GPU / CPU 操作等

------

### `torch.nn`

**神经网络模块。**

用于构建神经网络，例如：

```
nn.Linear
nn.Conv1d
nn.Conv2d
nn.LSTM
nn.GRU
```

以及最重要的：

```
nn.Module
```

以后你自己写神经网络模型时，基本都会接触 `nn.Module`。

------

### `torch.optim`

**优化器模块。**

负责根据梯度更新模型参数。

例如：

```
torch.optim.SGD
torch.optim.Adam
```

后面学习模型训练时会重点讲。

------

### `torch.autograd`

**自动求导模块。**

负责自动计算梯度，是神经网络反向传播的重要基础。

# 4. PyTorch 的基本训练逻辑 ⭐⭐⭐

这是这一节**最值得你提前建立的框架**。

以后学习 PyTorch，你会反复遇到下面这套流程：

```
数据
 ↓
Tensor
 ↓
神经网络模型
 ↓
前向传播
 ↓
得到预测结果
 ↓
计算 Loss
 ↓
Autograd 计算梯度
 ↓
Optimizer 更新参数
 ↓
重复训练
```

把这条链记住，后面学：

> ```
> Tensor → nn.Module → Loss → Autograd → Optimizer
> ```

的时候就不会觉得这些东西是一个个孤立的 API。