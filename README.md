# Youpk8.1

在Pixel2上实现Youpk8.1(android-8.1.0_r39)  

# 功能
1. 实现指令抽取壳的主动调用还原
2. 去除aosp中的指纹(build-type,build-tag等)
3. 去除ro.debuggable，防止检测

# 脚本使用指南
1. `backup.sh`在更改源码后备份一份原来的代码到`backup`文件夹下
2. `overwrite.sh`在更改源码后替换原来的`aosp`目录中的源码
> 文件树应为以下情况  
>  ~/work/aosp/ tree -L 2 .  
> .  
> ├── Youpk8.1  
> │   └── ...  
> └── aosp  
>     └── ...  
