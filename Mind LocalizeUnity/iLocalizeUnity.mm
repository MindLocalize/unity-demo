//
//  iLocalizeUnity.m
//
//  Created by iLocalize on 2020/9/29.
//  Copyright © 2020 AIHelp. All rights reserved.
//

#import "iLocalizeUnity.h"
#import <Foundation/Foundation.h>

#if defined(__cplusplus)
extern "C" {
#endif
    
    NSString* Mind_iLoc_charToNSString (const char* string)
    {
        if (string){
            return [NSString stringWithUTF8String: string];
        }else{
            return [NSString stringWithUTF8String: ""];
        }
    }

    const char* Mind_iLoc_NSStringToChar (NSString* string)
    {
        if (string){
            return string.UTF8String;
        }else{
            return @"".UTF8String;
        }
    }


    void unity_initBuild (const char* appKey, const char* language, bool isInternationalizing,  bool isBuildDebug) {
        NSString *_appKey = Mind_iLoc_charToNSString(appKey);
        NSString *_language = Mind_iLoc_charToNSString(language);
        [iLocalize initWithAppKey:_appKey language:_language isInternationalizing:isInternationalizing isDebug:isBuildDebug];
    }
    
    void unity_setOnInitializedCallback (GGTranslationPreparedCallback callBack) {
        [iLocalize setTranslationPreparedCallback:callBack];
    }

    const char* unity_getStringDefault_g2g(const char* code, const char* defaultStr) {
        NSString *_code = Mind_iLoc_charToNSString(code);
        NSString *_defaultStr = Mind_iLoc_charToNSString(defaultStr);
        NSString *valueStr = [iLocalize getStringWithCode:_code defaultString:_defaultStr];
        return strdup(Mind_iLoc_NSStringToChar(valueStr));
    }

    void unity_updateLanguage(const char* language) {
        NSString *_language = Mind_iLoc_charToNSString(language);
        [iLocalize updateLanguage:_language];
    }

    void unity_setLogEnable(bool enable) {
        [iLocalize setLogEnable:enable];
    }

    void unity_evaluateString(const char* code, const char* stringContent) {
        NSString *_code = Mind_iLoc_charToNSString(code);
        NSString *_stringContent = Mind_iLoc_charToNSString(stringContent);
        [iLocalize evaluateStringWithCode:_code stringContent:_stringContent];
    }

    void unity_enableEvaluateFunction(bool enable) {
        [iLocalize enableEvaluateFunction:enable];
    }

    void unity_updateUserInfo_g2g(const char* userId,const char* userTags) {
        iLocalizeUserConfigBuilder *configBuilder = [[iLocalizeUserConfigBuilder alloc] init];
        NSString *_userTags = Mind_iLoc_charToNSString(userTags);
        NSString *_userId = Mind_iLoc_charToNSString(userId);
        configBuilder.userTags = _userTags;
        configBuilder.userId = _userId;
        [iLocalize setUserConfig:configBuilder.build];
    }

    void unity_checkStringOverflow(const char* pageId, const char* stringId, const char* stringRealContent, float designWidth, float designHeight,float measuredWidth, float measuredHeight, const char* fontFamily,float fontSize,float lineSpacing,int textAlign, bool isBold, bool isItalic, bool isMultipleLine) {
        iLCheckOverflowConfigBuilder *overflowConfigBuilder = [[iLCheckOverflowConfigBuilder alloc] init];
        NSString *_pageId = Mind_iLoc_charToNSString(pageId);
        NSString *_stringId = Mind_iLoc_charToNSString(stringId);
        NSString *_stringRealContent = Mind_iLoc_charToNSString(stringRealContent);
        overflowConfigBuilder.pageId = _pageId;
        overflowConfigBuilder.stringId = _stringId;
        overflowConfigBuilder.stringRealContent = _stringRealContent;
        overflowConfigBuilder.designWidth = designWidth;
        overflowConfigBuilder.designHeight = designHeight;
        overflowConfigBuilder.measuredWidth = measuredWidth;
        overflowConfigBuilder.measuredHeight = measuredHeight;
        
        overflowConfigBuilder.fontFamily = Mind_iLoc_charToNSString(fontFamily);
        overflowConfigBuilder.fontSize = fontSize;
        overflowConfigBuilder.lineSpacing = lineSpacing;
        overflowConfigBuilder.textAlign = textAlign;
        overflowConfigBuilder.isBold = isBold;
        overflowConfigBuilder.isItalic = isItalic;
        overflowConfigBuilder.isMultipleLine = isMultipleLine;
        [iLocalize checkStringOverflow:overflowConfigBuilder.build];
    }
    
#if defined(__cplusplus)
}
#endif
