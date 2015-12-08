//
//  PartnerConfig.h
//  AlipaySdkDemo
//
//  Created by ChaoGanYing on 13-5-3.
//  Copyright (c) 2013年 RenFei. All rights reserved.
//

#ifndef MQPDemo_PartnerConfig_h
#define MQPDemo_PartnerConfig_h

#pragma mark - 支付宝

#define AppScheme   @"com.aiitec.Quanshitong"

//合作商户ID。用签约支付宝账号登录ms.alipay.com后，在账户信息页面获取。
#define PartnerID @"2088911210596800"
//账户ID。用签约支付宝账号登录ms.alipay.com后，在账户信息页面获取。
#define SellerID  @"2088911210596800"

//安全校验码（MD5）密钥  用签约支付宝账号登录ms.alipay.com后，在密钥管理页面获取
//#define MD5_KEY @"n134ipp77y4bzxueq3n0y8k61i2zmeww"

//商户私钥，自助生成
#define PartnerPrivKey @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBANNbWGj41PaKyKycvHmhpDPNRgEufXM4fzobCDZ+RiHDjp5q4y1Trp3JB+Yck91z3ykme06ynom2NCpoGZnTQUvB1qO+YKz668PdAnofR5AsIIySw5BPa3zqShT1F8JEyPXOyX1HS0gtvsoea2JT1tBvTZAcJsEMWdvKt6aUCjdnAgMBAAECgYEAnhEhpJf8BUoz3Ev39Os7d3ZclYOkVKh7FgSjdsWnQ5cSMU31CrAb1mtDWggjWapPymG6NFgHkyxOBS0HgHBq0pVdyXO+crJqZgJHQWp4nECKhE/zvMS0tcgFBnMOIkJxcfC51AqFiHl5Lfu59fTraNhWHn/6ukTM3XxCYMOzmIkCQQD8HC9lwxwqDbD29gEvvcUxwCWq7BxJy+FjaXrdW9OMm8N9Ml3IMS4XZhqie8J+CFhPElVMMFimoYE/BGhhF0W7AkEA1p4wH9nv7z6a4kK18WcbkdpfZx4yRsTMeADCFJOJDc4/vGjDlBcyqCAEhEm+1b3vIrprHCE/FG//HVeHxXCERQJAMx/cFLzON1DzdAFLGE1Zcc9PVCvxSJ3JpQk82yrF6ZuktvzBu9kNSb1w5UZHmJtEnTRQi9S6BYB23zqbmCTKBQJAX7v8l5it0LjKejdr1Z06zRruB5+OqcbLtpQP/wG41zGzeKX66CpY7Gor2Z7Tw6CP9ZvWf5vM+Z7j3ADZjZcdSQJBAKwsvPy2+8WK1VhwVYr+5qaqM7kfFbUAaYnI2utACWXWA6dGFBcNlOYv7RV6sjiBG1wRJJVlq+YrCsvuebtXMvk="

//支付宝公钥，用签约支付宝账号登录ms.alipay.com后获取。
#define AlipayPubKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqKBGjUY6LKC2qRXaNSAjZMBFeKfTV9ezzxKr4 qlDTVwVTDcW2lVpCi0YiQcqaWSLVYTCOsivWcO+PjvbXaJJSm2d1Ea9kJr6SV3D4QZJc9kpEZ+qY tpnoEzG3fB7EyJF+aeimcqDfwVVWH5A2JvtPF5UKdfjVTC7E3OYCPcl4IQIDAQAB"

#endif

/** 支付宝异步回调URL. 如@"WS_WAP_PAYWAP/notify_url_app.php".  */
#define Alipay_Notify_Url       @"index/getAlipayNotify"
