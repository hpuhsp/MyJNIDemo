### JNI实战
   关于JNI开发的一些基本知识点的梳理
        在Android Studio 2.2 之后，工具中增加了 CMake 的支持，你可以这么认为，在 Android Studio 2.2 之后你有2种
   选择来编译你写的 c/c++ 代码。一个是 ndk-build + Android.mk + Application.mk 组合，另一个是 CMake + CMakeLists.txt 组合。
        这两种方式本身与Android代码和c/c++代码无关，只是不同的构建脚本和构建命令。此处以Android现在主推的后者进行实现

   一些实战汇总，下面做下列举
    
   1、根据app gradle的配置（CMake+CMakeLists.txt）,直接用项目配置的External Tools操作ndk-build进行编译生成.so二进制文件
    
   2、jarLibrary在Gradle中以做好打Jar的相关配置，目前觉得记录的蛮详尽的。
    在Terminal中输入./gradlew makeJar(或者更简单的方式双击选择AS右侧Gradle中的makeJar选项进行到处Jar)会自动生成响应的Jar在buil/libs目录下，操作指令的前提是
    你已经配置好了本地的Gradle环境变量。至于Jar的引用，则不再赘述。而添加aar的方法则如下：
     
   ``` 
    // 在主工程中使用aar首先把aar包放到主工程的libs目录下，然后在主工程的build.gradle文件的dependencies中添加依赖
    compile(name: 'toollibrary-1.0', ext: 'aar') 
    // 其中name的值即使放到libs目录下的aar的名称，然后在app的build.gradle的android节点下添加如下内容即可：
     repositories {  
            flatDir {  
                dirs 'libs'  
            }  
        }
   ```

### JNI的拓展应用

    > 第三部分，期待

