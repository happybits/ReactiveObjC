// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReactiveObjC",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "ReactiveObjC", targets: ["ReactiveObjCWrapper"])
    ],
    targets: [
        .target(
            name: "ReactiveObjCWrapper",
            dependencies: ["ReactiveObjC"],
            path: "ReactiveObjCWrapper"
        ),
        // .binaryTarget(
        //     name: "ReactiveObjC",
        //     url: "https://github.com/happybits/ReactiveObjC/releases/download/XXX/ReactiveObjC.xcframework.zip",
        //     checksum: "32ccf036d2ec15935695704c56d9d622d09cc0e891d0351eee7321e9a2f8e793"
        // ),
        .binaryTarget(
            name: "ReactiveObjC",
            path: "ReactiveObjC.xcframework"
        )
    ]
)
