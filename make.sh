#!/bin/sh

mkdir build

rm -r ./build/iTransmissionFramework.xcframework

xcodebuild -project Transmission.xcodeproj -target libtransmission -sdk iphonesimulator "LDFLAGS=-target arm64-apple-ios-simulator" -configuration Debug CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -destination generic/platform="iOS Simulator"

xcodebuild -project Transmission.xcodeproj -target libtransmission -sdk iphoneos -configuration Release CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -destination generic/platform=iOS


libtool -static -o ./build/Release-iphoneos/libITransmission.a ./build/Release-iphoneos/libtransmission.a ./build/Release-iphoneos/libb64.a ./build/Release-iphoneos/libdeflate.a ./build/Release-iphoneos/libdht.a ./build/Release-iphoneos/libevent.a ./build/Release-iphoneos/libminiupnp.a ./build/Release-iphoneos/libnatpmp.a ./build/Release-iphoneos/libpsl.a ./build/Release-iphoneos/libutp.a ./build/Release-iphoneos/libwildmat.a

libtool -static -o ./build/Debug-iphonesimulator/libITransmission.a ./build/Debug-iphonesimulator/libtransmission.a ./build/Debug-iphonesimulator/libb64.a ./build/Debug-iphonesimulator/libdeflate.a ./build/Debug-iphonesimulator/libdht.a ./build/Debug-iphonesimulator/libevent.a ./build/Debug-iphonesimulator/libminiupnp.a ./build/Debug-iphonesimulator/libnatpmp.a ./build/Debug-iphonesimulator/libpsl.a ./build/Debug-iphonesimulator/libutp.a ./build/Debug-iphonesimulator/libwildmat.a

mkdir -p ./build/include/libtransmission
mkdir -p ./build/include/fmt

find ./libtransmission -name "*.h" -exec cp "{}" ./build/include/libtransmission \;
find ./third-party/fmt/include/fmt -name "*.h" -exec cp "{}" ./build/include/fmt \;

xcodebuild -create-xcframework -library ./build/Release-iphoneos/libITransmission.a -headers ./build/include \
                               -library ./build/Debug-iphonesimulator/libITransmission.a -headers ./build/include \
                               -output ./build/iTransmissionFramework.xcframework