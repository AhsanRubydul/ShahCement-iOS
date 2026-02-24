//
//  WKWebView+Scaling.m
//  ShahCement
//
//  Created by Saif Adel on 9/9/25.
//  Copyright © 2025 SmartMux Limited. All rights reserved.
//

#import <WebKit/WebKit.h>

@implementation WKWebView (Scaling)

- (void)setScalesPageToFit:(BOOL)enabled {
    NSString *js;
    if (enabled) {
        // Inject viewport for auto-fit
        js = @"var meta = document.querySelector('meta[name=viewport]');"
              "if (meta) {"
              "  meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');"
              "} else {"
              "  meta = document.createElement('meta');"
              "  meta.name = 'viewport';"
              "  meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';"
              "  document.getElementsByTagName('head')[0].appendChild(meta);"
              "}";
    } else {
        // Remove viewport to disable auto-fit
        js = @"var meta = document.querySelector('meta[name=viewport]');"
              "if (meta) { meta.parentNode.removeChild(meta); }";
    }
    
    [self evaluateJavaScript:js completionHandler:nil];
}

@end
