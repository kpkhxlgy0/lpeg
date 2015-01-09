DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR_TO=$DIR/build_ios
rm -rf $DIR_TO
mkdir -p $DIR_TO

function build()
{
    PLATFORM=$1
    DIR_PLATFORM_TO=$DIR_TO/$PLATFORM
    mkdir -p $DIR_PLATFORM_TO
    cd $DIR_PLATFORM_TO && cd $_
    cmake -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DIOS_PLATFORM=$PLATFORM -GXcode ../../..
    xcodebuild -target lpeg -configuration Release
}

build SIMULATOR
build OS

DIR_SIM_TO=$DIR_TO/SIMULATOR
DIR_OS_TO=$DIR_TO/OS

cd $DIR_TO && cd $_
lipo -create $DIR_SIM_TO/Release-iphonesimulator/liblpeg.a $DIR_OS_TO/Release-iphoneos/liblpeg.a -output ./liblpeg.a
