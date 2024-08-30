//
//  WebPProcessor.swift
//  Pods
//
//  Created by yeatse on 2016/10/19.
//
//

import Foundation
import Kingfisher

public struct WebPProcessor: ImageProcessor {

    public static let `default` = WebPProcessor()

    public let identifier = "com.yeatse.WebPProcessor"

    public init() {}

    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            return image
        case .data(let data):
            if data.isWebPFormat {
                let creatingOptions = ImageCreatingOptions(scale: options.scaleFactor, preloadAll: options.preloadAllAnimationData, onlyFirstFrame: options.onlyLoadFirstFrame)
                return KingfisherWrapper<KFCrossPlatformImage>.image(webpData: data, options: creatingOptions)
            } else {
                return DefaultImageProcessor.default.process(item: item, options: options)
            }
        }
    }

    public func processAsync(item: ImageProcessItem, options: KingfisherParsedOptionsInfo, handle: KFWebPAsymHandle?) {
        switch item {
        case .image(let image):
            handle?(image)
        case .data(let data):
            if data.isWebPFormat {
                var creatingOptions = ImageCreatingOptions(scale: options.scaleFactor, preloadAll: options.preloadAllAnimationData, onlyFirstFrame: options.onlyLoadFirstFrame)
                creatingOptions.serialCacheKey = options.serialCacheKey
                KingfisherWrapper<KFCrossPlatformImage>.imageAsync(webpData: data, options: creatingOptions) { image in
                    handle?(image)
                }

            } else {
                handle?(DefaultImageProcessor.default.process(item: item, options: options))
            }
        }
    }
}

