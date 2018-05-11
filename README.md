### JNI实战
   关于JNI开发的一些基本知识点的梳理
        在Android Studio 2.2 之后，工具中增加了 CMake 的支持，你可以这么认为，在 Android Studio 2.2 之后你有2种
   选择来编译你写的 c/c++ 代码。一个是 ndk-build + Android.mk + Application.mk 组合，另一个是 CMake + CMakeLists.txt 组合。
        这两种方式本身与Android代码和c/c++代码无关，只是不同的构建脚本和构建命令。此处以Android现在主推的后者进行实现

### 一些实战汇总，下面做下列举
    
   1. 根据app gradle的配置（CMake+CMakeLists.txt）,直接用项目配置的External Tools操作ndk-build进行编译生成.so二进制文件
    
   2. jarLibrary在Gradle中以做好打Jar的相关配置，目前觉得记录的蛮详尽的。
    在Terminal中输入./gradlew makeJar(或者更简单的方式双击选择AS右侧Gradle中的makeJar选项进行到处Jar)会自动生成响应的Jar在buil/libs目录下，操作指令的前提是
    你已经配置好了本地的Gradle环境变量。至于Jar的引用，则不再赘述。
### 添加aar的方法则如下：
   -  普通的AAR引入方式
   
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
   - 依赖了三方库的AAR引入方式
   
   在功能模块的build.gradle文件头部下添加“apply plugin: 'maven'”，然后配置相关的上传到Maven仓库的代码如下：
      
   ```uploadArchives {
          repositories {
              mavenDeployer {
                  pom.groupId = "com.aar.test" // Library包名
                  pom.artifactId = "remote-dependcies-release" // Library名称
                  pom.version = "1.1.3" // Library 的版本号
                  repository(url: "file://localhost/" + "Users/reesehu/Library/Android/sdk" + "/extras/android/m2repository/")
              }
          }
      }
    // 配置上传AAR所有的远程依赖上传至本地Maven仓库

   ```
   添加到新的项目中，首先需要在根目录的build.gradle中添加相关三方库的远程仓库链接，如下
   ```allprojects {
          repositories {
              google()
              jcenter()
              maven {
                  url 'https://dl.bintray.com/jetbrains/anko'
              } //引入AnKo
      //        maven {
      //            url "file:///Users/reesehu/Library/Android/sdk/extras/android/m2repository"
      //        }
              // 针对依赖了第三方库的AAR(remote-dependcies-release.aar)添加的远程链接
              maven {
                  url "http://dl.bintray.com/piasy/maven"
              }
              maven { url 'https://jitpack.io' }
          }
      }

```
   其次，在app或者其他功能Module的build.gradle下添加：
   ```    
   implementation 'com.aar.test:remote-dependcies-release:1.1.3'
   // 此处一个细节需要注意：如果新项目不需要引入AAR依赖的三方库，则可以在上面代码后面添加@aar实现选择性的引用。
   // 即此种方式不用再读取.pom文件中的依赖库相关配置
```
   完毕！！！
   
  - 依赖了三方库的AAR引入方式上传至远程Maven仓库
  
  以[bintray-release](https://github.com/novoda/bintray-release)工具进行上传到Bintray仓库，引入工具需要配置的方式，直接
  点击[传送门](https://github.com/novoda/bintray-release)了解一下即可，这里不再赘述。此处着重记录一些基本的配置和遇到的问题。
  首先，是publish的闭包配置，示例如下：
  ```
  // 使用bintray-release 上传至bintray,下面为publish闭包配置
  publish {
         userOrg = 'ternencehu' // bintray用户名
         repoName = 'brewer'
         groupId = 'com.sharepeng'
         artifactId = 'bintray-release'
         publishVersion = '1.5.0'
         desc = 'Oh hi, this is a nice description for a project, right?'
         website = 'https://github.com/novoda/bintray-release' // 一个与该项目网址相关的URL字符串。可以在这里使用Github 仓库。
     //    uploadName = 'FirstTestRepository' // 早bintray包中显示的名称，不设置默认为artifactId
     // https://brewfarmers.bintray.com/FirstTestRepository
     }

```
  
  其次需要特别注意Bintray账号选择注册个人开源账号。采用30天并未激活的企业账号时会出现一些上传失败的各种问题.所以特别提醒：
  
  ![这还能弄错吗？](https://github.com/hpuhsp/MyJNIDemo/tree/develop/Screenshots/702C0BF45444.png)

> 关于上传本地AAR到JCenter可参考[博客文章](https://blog.csdn.net/u014620028/article/details/78406167),个人觉得这个真的是手把手教学。
不清楚？再来一篇：[鸿洋的文章](https://blog.csdn.net/lmj623565791/article/details/51148825)
> PS:关于一些资源合并、多版本AAR等问题可以参考他人文章，[AAR的那些坑](https://www.jianshu.com/p/8c7acd1e926f?from=timeline)
### JNI的拓展应用

    > 第三部分，期待

