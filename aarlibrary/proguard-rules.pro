# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile
-dontshrink #不压缩
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/* #混淆时采用的算法，建议不要修改
-optimizationpasses 5 #指定压缩级别
-dontusemixedcaseclassnames#是否使用大小写混合
-keepattributes *Annotation*
-dontpreverify
-verbose # 混淆时是否生成mapping文件
-dontwarn android.support.v4.*
-ignorewarnings
# 设置类名和方法不能被混淆-----即指定位置的这些类和方法是需要暴露给调用者的
-keep class com.reesehu.aarlibrary.*{
public <methods>;
}
