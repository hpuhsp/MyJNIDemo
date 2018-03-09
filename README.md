# MyJNIDemo
#### JNI实战
    * 关于JNI开发的一些基本知识点的梳理
    > 在Android Studio 2.2 之后，工具中增加了 CMake 的支持，你
    可以这么认为，在 Android Studio 2.2 之后你有2种选择来编译你写
    的 c/c++ 代码。一个是 ndk-build + Android.mk + Application.mk 组合，另
    一个是 CMake + CMakeLists.txt 组合。这两种方式本身与Android代码和c/c++代码无关
    ，只是不同的构建脚本和构建命令。此处以Android现在主推的后者进行实现

