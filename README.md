# mvvm_framework_in_swift

一个用Swift开发的MVVM框架应用于iOS APP。特点：可读性好，扩展性高，易用性强。
  希望有想法有能力一起来设计开发！
  

# 项目架构

## 采用MVVM设计主体框架，分层如下：
- 精简UIViewController
- 主体View实现
- ViewModel的DataBinding
- Service定制业务接口层
- Client通用基础业务层
- Model数据结构层


## 精简UIViewController
- 1，负责主体View的创建
- 2，DataBinding监听ViewModel的数据
- 3，更新View显示

## 主体View实现
- 1，引用ViewModel
- 2，管理自己和所有subview
- 3，对外提供View更新接口

## ViewModel的DataBinding
- 1，管理View所使用的数据，通过ObservableObject泛型实现DataBinding
- 2，提供业务接口给View调用
- 3，ViewModel调用Service层接口

## Service定制业务接口层
定制业务，应用相关

## Client通用基础业务层
基础业务可移植
 
## Model
数据模型

## 邮箱
- derekdu2022@gmail.com


# 版权信息

Code released under the [MIT License]

