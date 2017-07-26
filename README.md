# exiv2ForAndroid
exiv2 for android and support xmp function.

#How to build
1.create standalone toolchain, which contains all the tools and system lib, header file.The platfrom should not lower than 21
./make-standalone-toolchain.sh --platform=android-21 --install-dir=~/my-android-toolchain --ndk-dir='/home/hzb/Android/Sdk/ndk-bundle/' --toolchain=arm-linux-androideabi-4.9

2. copy buildExiv2.sh and configure from "../modify file" to "../exiv2-trunk".

3. copy configure.ac from "../modify file" to "../exiv2-trunk/config"
	modify all the "lpthread" to "pthread", because android does not support lpthread.

4. copy actions.cpp from "../modify file" to "../exiv2-trunk/src"
	PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP is not defined in android, should use normal mutex.

5. copy buildExpat.sh from "../modify file" to "../expat-2.2.2

6. cd expat-2.2.2
	start build expat.
	
	
7. ./buildExpat.sh
	if success, you should find the result file under the jni/expat/, contains:include,libs,share.
	
8. go back the root path and mkdir expatlib(you can defined custom)
	copy include and lib dictionary from expat-2.2.2/jni/expat to expatlib
	
9. modify the --with-expat=../expatlib in the buildExiv2.sh

10. ./buildExiv2.sh
	if success, you can find the result file under the jni/exive2/, contains bin, include, lib, share

11. copy the include and lib of both expat and exiv2 to exivJni

12 goto the exivJni

13. ndk-build NDK_APPLICATION_PATH=. NDK_APPLICATION_MK=./Application.mk
	the result so file is in the ./libs
 
