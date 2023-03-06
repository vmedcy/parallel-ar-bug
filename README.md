# parallel-ar-bug

Reproducer project for https://bugs.launchpad.net/gcc-arm-embedded/+bug/1848002

## Steps to reproduce

* Download and install arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi.exe from https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
* Download ninja-win.zip from https://github.com/ninja-build/ninja/releases and add to PATH
* Start Windows terminal and execute commands:

      set PATH=C:\Program Files (x86)\Arm GNU Toolchain arm-none-eabi\12.2 rel1\bin;%PATH%
      where arm-none-eabi-ar
      ninja -t clean
      ninja

      [640/1000] Creating archive out-646.a
      FAILED: out-646.a
      cmd.exe /C "arm-none-eabi-ar qc out-646.a input1.o input2.o && arm-none-eabi-ranlib out-646.a"
      arm-none-eabi-ar: could not create temporary file whilst writing archive: no more archived files


* Issue is non-deterministic, on lucky days it may complete all 1000 rounds. To retry:

      ninja -t clean
      ninja

