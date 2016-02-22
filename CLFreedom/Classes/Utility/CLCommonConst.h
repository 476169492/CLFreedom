//
//  CLCommonConst.h
//  ThumbLoan
//
//  Created by chenlei on 15/8/7.
//  Copyright (c) 2015年 zendai. All rights reserved.
//

#ifndef ThumbLoan_CLCommonConst_h
#define ThumbLoan_CLCommonConst_h


//MainStoryBoard
#define MAIN_SB [UIStoryboard storyboardWithName:@"Main" bundle:nil]

//登录注册StoryBoard
#define LOGIN_SB [UIStoryboard storyboardWithName:@"LoginAndRegist" bundle:nil]

//其他StoryBoard
#define COMMON_SB [UIStoryboard storyboardWithName:@"Common" bundle:nil]

//产品StoryBoard
#define PRODUCT_SB [UIStoryboard storyboardWithName:@"Product" bundle:nil]

//我的StoryBoard
#define MY_SB [UIStoryboard storyboardWithName:@"My" bundle:nil]



//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//主色(蓝色)
#define MAIN_COLOR [UIColor hexStringToColor:@"329de9"]
//辅助色(红色)
#define ASSIST_COLOR [UIColor hexStringToColor:@"fd3e25"]
//页面背景色(浅灰色)
#define BACKGROUND_COLOR [UIColor hexStringToColor:@"f4f4f4"]
//顶部nav.底部tab背景色(浅灰色)
#define TABBAR_BARTINT_COLOR [UIColor hexStringToColor:@"f7f9fb"]
//主文字颜色
#define MAIN_TEXT_COLOR [UIColor hexStringToColor:@"333333"]
//普通文字颜色
#define COMMON_TEXT_COLOR [UIColor hexStringToColor:@"666666"]
//辅助文字颜色
#define ASSIST_TEXT_COLOR [UIColor hexStringToColor:@"999999"]
//禁止色.分割线like line_heng的色值
#define UNABLE_TEXT_COLOR [UIColor hexStringToColor:@"d5d5d5"]

//用在较为特殊的需要特别突出的文字(如借款记录页面)
#define KFontOfSpecial           [UIFont systemFontOfSize:30.0]

//用在较重要的文字和按钮文字(如注册、登录、确认、取消等重要性按钮、导航栏
#define KFontOfImportantOne      [UIFont systemFontOfSize:18.0]
//用在列表菜单文字(如更多页面)
#define KFontOfImportantTwo      [UIFont systemFontOfSize:16.0]

//用于板块文字(特别适用于板块标题,如借款记录等页面)
#define KFontOfGeneralOne        [UIFont systemFontOfSize:15.0]
//用于大多数文字(特别适用于大段的文字)
#define KFontOfGeneralTwo        [UIFont systemFontOfSize:14.0]
//用于辅助性文字(如列表菜单的副标题、时间等)
#define KFontOfGeneralThree      [UIFont systemFontOfSize:12.0]

//用于辅助性文字(如小按钮文字)
#define KFontOfWeakerOne         [UIFont systemFontOfSize:11.0]
//用于辅助性文字(如底部tab icon文字等)
#define KFontOfWeakerTwo         [UIFont systemFontOfSize:10.0]


// AppStore地址
static NSString *StoreHtml                              = @"https://itunes.apple.com/cn/app/sui-zhi-dai/id986669936?mt=8";
static NSString *APP_ID                                 = @"986669936";
// 公司客服电话
static NSString *TELEPHONE_SERVICE                      = @"021-60799271";

//HTML地址
static NSString *TL404RemindHtml                        = @"http://www.suizhidai.com/404-none.html";
static NSString *SZDAboutWeHtml                         = @"https://s3.cn-north-1.amazonaws.com.cn/suizhidai/customer/common/about_suizhidai.html";

//About UMeng Share
static NSString *APP_SHARE_KEY                          = @"5dcaad136896";
static NSString *SINA_SHARE_KEY                         = @"1318197116";
static NSString *SINA_SHARE_SECRET                      = @"a6c77c9c5f835f1498315b778399198b";
static NSString *TX_QZONE_SHARE_KEY                     = @"801561173";
static NSString *TX_SHARE_SECRET                        = @"3pRsgoLzhofKVBmK";
static NSString *TX_WEIBO_SHARE_KEY                     = @"801561173";
static NSString *TX_WEIBO_SHARE_SECRET                  = @"926768c60b191d8441c1aa92209bafbf";
static NSString *WEICHAT_SHARE_KEY                      = @"wxe51b8867a7109639";
static NSString *SHARE_BACK_URL                         = @"http://www.zendai.com/";
static NSString *TARGET_TITLE_NAME                      = @"随指贷";
static NSString *GAODE_MAP_KEY                          = @"a08fdaf2952edba31705d9e963f84c6d";

//About Umeng
static NSString *UMeng_APP_KEY                          = @"5678bd4a67e58e3c03002a8d";

//CODE编码
static NSString *SZD_EXC_CODE_0000           = @"0000";  //成功
static NSString *SZD_EXC_CODE_1000           = @"1000";  //服务错误(程序错误)
static NSString *SZD_EXC_CODE_1001           = @"1001";  //服务错误(请求参数错误)
static NSString *SZD_EXC_CODE_1002           = @"1002";  //请重新登录(捕获多设备登录)
static NSString *SZD_EXC_CODE_1003           = @"1003";  //请重新登录(捕获多设备登录)
static NSString *SZD_EXC_CODE_1004           = @"1004";  //请重新登录
static NSString *SZD_EXC_CODE_1005           = @"1005";  //服务错误
static NSString *SZD_EXC_CODE_1006           = @"1006";  //您还未登录,请登录
static NSString *SZD_EXC_CODE_2001           = @"2001";  //服务错误
static NSString *SZD_EXC_CODE_2002           = @"2002";  //服务错误
static NSString *SZD_EXC_CODE_2003           = @"2003";  //服务错误
static NSString *SZD_EXC_CODE_2004           = @"2004";  //服务错误
static NSString *SZD_EXC_CODE_3001           = @"3001";  //服务错误
static NSString *SZD_EXC_CODE_3002           = @"3002";  //服务错误
static NSString *SZD_EXC_CODE_3003           = @"3003";  //服务错误
static NSString *SZD_EXC_CODE_3004           = @"3004";  //请不要重复操作
static NSString *SZD_EXC_CODE_4001           = @"4001";  //手机已注册
static NSString *SZD_EXC_CODE_5001           = @"5001";  //短信验证码无效
static NSString *SZD_EXC_CODE_5002           = @"5002";  //短信发送失败

static NSString *SZD_EXC_CODE_30003          = @"30003";  //资料未完善
static NSString *SZD_EXC_CODE_30004          = @"30004";  //资料未完善
static NSString *SZD_EXC_CODE_30005          = @"30005";  //资料未完善
static NSString *SZD_EXC_CODE_30006          = @"30006";  //资料未完善
static NSString *SZD_EXC_CODE_30007          = @"30007";  //职业身份不存在
static NSString *SZD_EXC_CODE_30008          = @"30008";  //资料未完善
static NSString *SZD_EXC_CODE_30009          = @"30009";  //资料未完善
static NSString *SZD_EXC_CODE_30015          = @"30015";  //资料未完善
static NSString *SZD_EXC_CODE_30201          = @"30201";  //服务错误
static NSString *SZD_EXC_CODE_30202          = @"30202";  //请勿频繁提交
static NSString *SZD_EXC_CODE_30301          = @"30301";  //服务错误
static NSString *SZD_EXC_CODE_30302          = @"30302";  //请申请正在处理中
static NSString *SZD_EXC_CODE_30303          = @"30303";  //服务错误
static NSString *SZD_EXC_CODE_30304          = @"30304";  //产品已下架




//接口编号
static NSString *SZDActionHomeProduct                   = @"100001";       //首页产品列表接口
static NSString *SZDActionProductList                   = @"100002";       //产品列表接口
static NSString *SZDActionProductDetail                 = @"100003";       //产品详情接口
static NSString *SZDActionFillInApplyInfo               = @"100004";       //填写申请资料接口
static NSString *SZDActionUploadApplyInfo               = @"100005";       //申请资料提交接口
static NSString *SZDActionSureApply                     = @"100006";       //确认申请接口
static NSString *SZDActionSureApplyGetNote              = @"100007";       //确认申请获取短信接口
static NSString *SZDActionRequestMyAccount              = @"100021";       //请求我的账户
static NSString *SZDActionUserLogin                     = @"100009";       //登录接口
static NSString *SZDActionGetHomeBanner                 = @"100031";       //获取首页banner
static NSString *SZDActionGetRepaymentInfo              = @"100041";       //获取还款信息

static NSString *TLActionUserDeviceInfoCollect          = @"200013";       //用户设备信息采集接口


//友盟自定义事件
static NSString *UMengClick0001                         = @"0001";     //首页-点击定位
static NSString *UMengClick0002                         = @"0002";     //首页-点击消息
static NSString *UMengClick0003                         = @"0003";     //首页-购房贷款
static NSString *UMengClick0004                         = @"0004";     //首页-购车贷款
static NSString *UMengClick0005                         = @"0005";     //首页-家装贷款
static NSString *UMengClick0006                         = @"0006";     //首页-创业贷款
static NSString *UMengClick0007                         = @"0007";     //首页-普通贷款
static NSString *UMengClick0008                         = @"0008";     //首页-学生贷款
static NSString *UMengClick0009                         = @"0009";     //首页-查看更多
static NSString *UMengClick0010                         = @"0010";     //首页-查看产品详情

static NSString *UMengClick1001                         = @"1001";     //产品列表-查看产品详情
static NSString *UMengClick1002                         = @"1002";     //产品列表-月利率
static NSString *UMengClick1003                         = @"1003";     //产品列表-额度
static NSString *UMengClick1004                         = @"1004";     //产品列表-期限
static NSString *UMengClick1005                         = @"1005";     //产品详情-立即申请
static NSString *UMengClick1006                         = @"1006";     //填写申请资料-下一步
static NSString *UMengClick1007                         = @"1007";     //填写联系方式-确认申请
static NSString *UMengClick1008                         = @"1008";     //提交成功-返回首页

static NSString *UMengClick2001                         = @"2001";     //我的-拨打经理电话
static NSString *UMengClick2002                         = @"2002";     //我的-点击设置
static NSString *UMengClick2003                         = @"2003";     //设置-反馈意见
static NSString *UMengClick2004                         = @"2004";     //设置-关于我们
static NSString *UMengClick2005                         = @"2005";     //设置-退出登录
static NSString *UMengClick2006                         = @"2006";     //登录-发送验证码成功
static NSString *UMengClick2007                         = @"2007";     //登录-发送验证码失败
static NSString *UMengClick2008                         = @"2008";     //登录-登录成功
static NSString *UMengClick2009                         = @"2009";     //登录-登录失败



//NSUserDefault KEY
static NSString *DEVICEID                               = @"DEVICEID";     //设备UUID
static NSString *USERID                                 = @"USERID";       //USERID 唯一的用户标示
static NSString *USERMOBILE                             = @"USERMOBILE";   //使用者的手机号


static NSString *DEVICETOKEN                            = @"DEVICETOKEN";  //设备token(退出无需清除)
static NSString *ADDRESS                                = @"ADDRESS";      //地址
static NSString *OPENAPP                                = @"OPENAPP";      //打开app某个循环中次数


#endif
