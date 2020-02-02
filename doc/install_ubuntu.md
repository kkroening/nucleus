Note: WIP; see other `install.md` doc


**Enable alt-left + alt-right keys in terminal**

Write the following to `~/.inputrc`:
```
"\e[1;3D": backward-word ### Alt left
"\e[1;3C": forward-word ### Alt right
```

See [stackexchange post 108098](https://unix.stackexchange.com/questions/108098/alt-left-to-skip-words-does-not-work-in-terminal-emulators).

**Enable CUDA capability for Tensorflow**

- Determine which version of CUDA to install by looking at the [supported build configurations](https://www.tensorflow.org/install/source#tested_build_configurations)
- Alternatively, install `tensorflow-gpu` and check the error message to see which version of CUDA it's expecting. e.g.:
```ImportError: libcublas.so.10.0: cannot open shared object file: No such file or directory```
- Download and install _CUDA Tookit XX.X_ from the [nvidia CUDA toolkit download page](https://developer.nvidia.com/cuda-toolkit-archive).  (The `deb (local)` seems to work fine)
- Download and install both the Runtime _and_ Developer library for UbuntuXX.XX (Deb) from the [nvidia cudnn download page](https://developer.nvidia.com/rdp/cudnn-download).  Install both together with `sudo dpkg -i libcudnn7*.deb`. (Optional: also download the code samples and user guide deb package)
- Reboot.  (Otherwise you'll see errors such as `Driver/library version mismatch` come out of tools like `nvidia-smi`)

