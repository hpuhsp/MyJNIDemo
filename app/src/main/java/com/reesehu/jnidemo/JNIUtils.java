package com.reesehu.jnidemo;

/**
 * Function:
 * <br/>
 * Describe: 测试native方法
 * <br/>
 * Author: reese on 2018/3/8.
 * <br/>
 * Email: reese@jiuhuar.com
 */

public class JNIUtils {
    public JNIUtils() {
    }

    static {
        System.loadLibrary("hello");
    }

    public static native String getStringFromC();
}
