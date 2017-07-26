# exiv2ForAndroid
exiv2 for android and support xmp function.

#How to build
1.create standalone toolchain, which contains all the tools and system lib, header file. and the platfrom should not lower than 21
./make-standalone-toolchain.sh --platform=android-21 --install-dir=~/my-android-toolchain --ndk-dir='/home/hzb/Android/Sdk/ndk-bundle/' --toolchain=arm-linux-androideabi-4.9

2. copy buildExiv2.sh and configure from "../modify file" to "../exiv2-trunk".

2. copy configure.ac from "../modify file" to "../exiv2-trunk/config"
	modify all the "lpthread" to "pthread", because android does not support lpthread.

3. copy actions.cpp from "../modify file" to "../exiv2-trunk/src"
	PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP is not defined in android, should use normal mutex.

4. copy buildExpat.sh from "../modify file" to "../expat-2.2.2

5. cd expat-2.2.2
	start build expat.
	
	
6. ./buildExpat.sh
	if success, you should find the result file under the jni/expat/, contains:include,libs,share.
	
7. go back the root path and mkdir expatlib(you can defined custom)
	copy include and lib dictionary from expat-2.2.2/jni/expat to expatlib
	
8. modify the --with-expat=../expatlib in the buildExiv2.sh

9. ./buildExiv2.sh
	if success, you can find the result file under the jni/exive2/, contains bin, include, lib, share

10. copy the include and lib of both expat and exiv2 to exivJni

11 goto the exivJni

12. ndk-build NDK_APPLICATION_PATH=. NDK_APPLICATION_MK=./Application.mk
	the result so file is in the ./libs
 