# MyJNIDemo
   ### JNI实战
    关于JNI开发的一些基本知识点的梳理
        在Android Studio 2.2 之后，工具中增加了 CMake 的支持，你可以这么认为，在 Android Studio 2.2 之后你有2种
    选择来编译你写的 c/c++ 代码。一个是 ndk-build + Android.mk + Application.mk 组合，另一个是 CMake + CMakeLists.txt 组合。
        这两种方式本身与Android代码和c/c++代码无关，只是不同的构建脚本和构建命令。此处以Android现在主推的后者进行实现

### 一些实战汇总：


    1、根据app gradle的配置（CMake+CMakeLists.txt）,直接用项目配置的External Tools操作ndk-build进行编译生成.so二进制文件
    
    2、jarLibrary在Gradle中以做好打Jar的相关配置，目前觉得记录的蛮详尽的。
    在Terminal中输入./gradlew makeJar会自动生成响应的Jar在buil/libs目录下，操作指令的前提是
    你已经配置好了本地的Gradle环境变量。至于Jar的引用，则不再赘述。