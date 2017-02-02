# Assignment 1

This repository contains the viewer code and data files you'll need for parts
2-5 of assignment 1.

## Getting Started
To begin, clone the repository:
```
git clone https://github.com/NYUGP17/Assignment_1
```

Next, please refer to part 1 of the assignment PDF ("First steps with LIBIGL")
for instructions on building LIBIGL and its dependencies.

## Building and Completing the Assignment
Once LIBIGL is set up (and pointed to by environment variable $LIBIGL_ROOT) you
should be able to build the viewer code:
```
mkdir build && cd build && cmake ..
make
```
Please report any problems you run into on this repository's Issues tab on
GitHub.

When the build completes successfully, begin implementing the missing blocks in
src/main.cpp as described by the assignment PDF.

## Submitting
When you are done with the assignment, you will submit it by pushing it to a
new repository on our NYUGP17 organization.

1. Create a **private** repository in https://github.com/NYUGP17/ called
   **Assignment1_USER**, where USER is your github username that you entered in
   the class survey.
2. Push your code to the repository:
```
git push https://github.com/NYUGP17/Assignment1_USER
```

## Travis-CI
Every submission must build on Linux before it can be graded/considered
complete. To check this, we will use Travis-CI, a tool for automatically
rebuilding your code each time it is pushed.

## Linux VM
If you have difficulties passing the build test and do not have access to a
Linux machine, you can use the VirtualBox VM we have configured for this
class:

[VirtualBox](http://virtualbox.org) is a free virtualization software that runs
on Windows, Linux, and Mac.

Unfortunately, VirtualBox only supports hardware acceleration for OpenGL version
2.1, so it cannot run the modern OpenGL viewer code on the GPU. However, the VM
we provided is configured to run in software emulation, which should be
sufficient to test if your code is working.
