# pwnbox - a box 4 pwning

essentially, i just ran into a problem of not being able to run/debug x64 binaries on Apple Silicon macs, and i got really annoyed of running everything on a VPS, so i decided to throw binaries inside a docker container filled with essential tools instead.
probably going to modify this a lot in the future

### Prerequisites
```
brew install docker
brew install docker-buildx
brew install colima 
```
    
### Usage 
fire up colima
```
colima start -p x64 -a x86_64 -c 4 -m 2 -d 10 --vm-type qemu
```

build the image 
```
docker buildx build -t pwnbox .
```

run the container
```
./pwnbox.sh <binary>
```

profit :>
