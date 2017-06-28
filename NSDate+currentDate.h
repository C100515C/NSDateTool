//
//  NSDate+currentDate.h
//  Dixon
//
//  Created by lcsj on 15/4/11.
//  Copyright (c) 2015年 LONGPF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (currentDate)

/**
 根据时间格式获得当前日期

 @param timeType timeType description
 @return return value description
 */
+(NSString *)getCurrentTimeWith:(NSString*)timeType;
+(NSString *)getCurrentTime;

/**
 获得日期 date对象

 @param dateString 日期字符串
 @return return value description
 */
+(NSDate *)dateFromString:(NSString *)dateString;

/**
 获得 日期为星期几

 @param inputDate inputDate description
 @return return value description
 */
+(NSString *)weekdayStringFromDate:(NSDate*)inputDate;

/**
 <#Description#>

 @param TimeString <#TimeString description#>
 @return <#return value description#>
 */
+(NSString *)getWeek:(NSString *)TimeString;

/**
 获得当前日期  格式如 2014-12-12 星期一 上午 12：00

 @return return value description
 */
+(NSString *)getCurrentTimeWeekDate;

/**
 日期转换成 格式如 2014-12-12 12：00

 @param date 传入日期  格式如 2014-12-12 星期一 上午 12：00
 @return return value description
 */
+(NSString *)getCurrentTimeWeekDateStringWith:(NSString*)date;

/**
 日期转换成 格式如 2014-12-12 星期一 上午 12：00

 @param datestr 格式如 2014-12-12 12：00
 @return return value description
 */
+(NSString *)getWeekTimeWeekDateStringWith:(NSString*)datestr;
+(NSString *)getCustomTimeWeekDateStringWith:(NSString*)date;
+(NSString *)getCustomWeekTimeDateStringWith:(NSString*)datestr andPeriod:(NSString *)period;
+(NSString *)getDateStringWith:(NSString*)needDateType andDate:(NSString *)date andDateType:(NSString*)type;


/**
 判断时间与当前时间 比较  早晚

 @param date 日期
 @param type 日期格式
 @return return value description
 */
+(int)dateIsOldWithCurrentDate:(NSString*)date andTimeType:(NSString*)type;
+(BOOL)timeIsOldWithCurrenttime:(NSInteger)period;

-(NSString *)getTimeString;
-(NSString *)getTimeStringOfday;

/**
 获取日历
 
 @param start 开始
 @param end 结束
 @param timeType 时间格式
 @return return value description
 */
+(NSArray*)getDateWith:(NSString *)start and:(NSString*)end andInitTimeType:(NSString*)initTimeType andTimeType:(NSString*)timeType andCalculation:(long long)unitTime;


/**
 时间戳
 
 @param Time 时间串
 @return return value description
 */
+(NSString*)formatTimeStr:(NSString*)Time;
/**
 *  时间戳
 *
 *  @param theTime 时间字符串
 *
 *  @return 时间
 */
+(NSString *)formatTime:(NSInteger)Time;
/**
 *  时间形式转换
 *
 *  @param theTime 时间string
 *
 *  @return 所需形式时间string
 */
+(NSString *)formatTime_Date:(NSString *)theTime;


/**
 *  时间形式转换
 *
 *  @param senconds 时间nsinteger
 *
 *  @return 所需形式时间string
 */
+(NSString *)formatTime_DateSeconds:(NSInteger )senconds;


/**
 *  获取时间
 *
 *  @param senconds 时间秒数
 *
 *  @return 时间戳字符串
 */
+(NSString*)formatTime_yyyy_MM_ddWith:(NSInteger)senconds;



@end
