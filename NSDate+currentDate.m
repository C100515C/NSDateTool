//
//  NSDate+currentDate.m
//  Dixon
//
//  Created by lcsj on 15/4/11.
//  Copyright (c) 2015年 LONGPF. All rights reserved.
//

#import "NSDate+currentDate.h"

@implementation NSDate (currentDate)
+(NSString *)getCurrentTimeWith:(NSString*)timeType{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:timeType];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    return dateTime;
}
+(NSString *)getCurrentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    return dateTime;
}

+(NSString *)getCurrentTimeWeekDate{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];

    [dateFormatter setDateFormat:@"yyyy-MM-dd EEE aaa hh:mm:ss"];//YYYY-MM-HH HH：MM：SS  yyyy-MM-dd HH:mm
    //            NSString *week = [NSDate weekdayStringFromDate:selectedDate];
    //            NSDateFormatter *format = [[NSDateFormatter alloc] init];
    dateFormatter.AMSymbol = @"上午";
    dateFormatter.PMSymbol = @"下午";
    dateFormatter.weekdaySymbols = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    NSString *destDateString = [dateFormatter stringFromDate:[NSDate date]];
    
    return destDateString;
    
}
+(NSString *)getDateStringWith:(NSString*)needDateType andDate:(NSString *)date andDateType:(NSString*)type{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:type];
    
    NSDate *tmp = [dateFormatter dateFromString:date];
    [dateFormatter setDateFormat:needDateType];

    return [dateFormatter stringFromDate:tmp];
}

+(NSString *)getCustomTimeWeekDateStringWith:(NSString*)date{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEE HH:mm:ss"];
    dateFormatter.weekdaySymbols = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    NSDate *tmpDate = [dateFormatter dateFromString:date];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:tmpDate];
    return destDateString;
}

+(NSString *)getCurrentTimeWeekDateStringWith:(NSString*)date{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEE aaa hh:mm:ss"];
    dateFormatter.AMSymbol = @"上午";
    dateFormatter.PMSymbol = @"下午";
    dateFormatter.weekdaySymbols = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
     NSDate *tmpDate = [dateFormatter dateFromString:date];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:tmpDate];
    return destDateString;
}

+(NSString *)getCustomWeekTimeDateStringWith:(NSString*)datestr andPeriod:(NSString *)period{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tmpDate = [dateFormatter dateFromString:datestr];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEE"];
//    dateFormatter.AMSymbol = @"上午";
//    dateFormatter.PMSymbol = @"下午";
//    dateFormatter.weekdaySymbols = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    NSString *destDateString = [dateFormatter stringFromDate:tmpDate];
    
    NSArray *periods = @[   @"凌晨 00:00-06:00",
                            
                            @"上午 06:00-12:00",
                            
                            @"下午 12:00-18:00",
                            
                            @"晚上 18:00-24:00"
                            ];
    int p = period.intValue-1 >3?0:period.intValue-1;
    destDateString = [NSString stringWithFormat:@"%@ %@",destDateString,periods[p]];
    return destDateString;
    
}
+(NSString *)getWeekTimeWeekDateStringWith:(NSString*)datestr{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tmpDate = [dateFormatter dateFromString:datestr];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd EEE aaa hh:mm:ss"];
    dateFormatter.AMSymbol = @"上午";
    dateFormatter.PMSymbol = @"下午";
    dateFormatter.weekdaySymbols = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    NSString *destDateString = [dateFormatter stringFromDate:tmpDate];
    
    return destDateString;
}

+(NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}

-(NSString *)getTimeString{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime=[formatter stringFromDate:self];
    return dateTime;
}

-(NSString *)getTimeStringOfday{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[formatter stringFromDate:self];
    return dateTime;
}


+(NSString *)getWeek:(NSString *)TimeString{
    NSString *year = [TimeString substringToIndex:4];
    NSString *str = [TimeString substringFromIndex:5];
    NSString *month = [str substringToIndex:2];
    NSString *str1 = [str substringFromIndex:3];
    NSString *day  =[str1 substringToIndex:2];
//    NSString *str2 = [str1 substringFromIndex:2];
//    NSString *time = [str2 substringToIndex:6];
    
    NSDateComponents *_comps = [[NSDateComponents alloc] init];
    [_comps setDay:[day integerValue]];
    [_comps setMonth:[month integerValue]];
    [_comps setYear:[year integerValue]];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *_date = [gregorian dateFromComponents:_comps];
    NSString *week = [self weekdayStringFromDate:_date];
    
    return week;
}

+(NSString *)weekdayStringFromDate:(NSDate*)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}
+(BOOL)timeIsOldWithCurrenttime:(NSInteger)period{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"H"];
    NSDate *nowDate = [NSDate date];
    NSString *nowTimeString = [formatter stringFromDate:nowDate];
    int p = 0;
    if (nowTimeString.intValue >=0 && nowTimeString.intValue<6) {
        p = 1;
    }else if (nowTimeString.intValue >=6 && nowTimeString.intValue<12){
        p = 2;
    }else if (nowTimeString.intValue >=12 && nowTimeString.intValue<18){
        p = 3;
    }else if (nowTimeString.intValue >=18 && nowTimeString.intValue<24){
        p = 4;
    }
    
    
    return period<p;
}

+(int)dateIsOldWithCurrentDate:(NSString*)date andTimeType:(NSString*)type{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    NSDate *nowDate = [NSDate date];
    NSString *year = [formatter stringFromDate:nowDate];
    
    [formatter setDateFormat:@"yyyy-MM-dd EEE"];
    NSString *nowDateString = [formatter stringFromDate:nowDate];
    
    [formatter setDateFormat:type];
    NSString *tmp = [NSString stringWithFormat:@"%@-%@",year,date];
    NSDate *dateTime= [formatter dateFromString:tmp];
    nowDate = [formatter dateFromString:nowDateString];
    
    NSTimeInterval dateSecond = [dateTime timeIntervalSince1970];
    NSTimeInterval nowSecond = [nowDate timeIntervalSince1970];
    
    return nowSecond-dateSecond;
}

/**
 获取日历
 
 @param start 开始
 @param end 结束
 @param timeType 时间格式
 @return return value description
 */
+(NSArray*)getDateWith:(NSString *)start and:(NSString*)end andInitTimeType:(NSString*)initTimeType andTimeType:(NSString*)timeType andCalculation:(long long)unitTime{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:timeType];
    if (initTimeType.length==0) {
        initTimeType = @"yyyy-MM-dd";
    }
    [formatter setDateFormat:initTimeType];

    NSDate *startDate = [formatter dateFromString:start];
    NSDate *endDate = [formatter dateFromString:end];
    
    NSMutableArray *dates = [NSMutableArray array];
    
    long long nowTime = [startDate timeIntervalSince1970]; //1471491674, //开始时间
    long long endTime = [endDate timeIntervalSince1970]; //1472528474,//结束时间
    long long dayTime = unitTime==0?60*60*24:unitTime;
    long long time = nowTime - nowTime%dayTime;
    
    [formatter setDateFormat:timeType];

    while (time<=endTime) {
        NSString *showOldDate = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
        [dates addObject:showOldDate];
        time += dayTime;
    }
    
    return dates;
}

#pragma mark - 时间戳
/**
 *  时间戳
 *
 *  @param theTime 时间字符串
 *
 *  @return 时间
 */
+(NSString *)formatTime:(NSInteger)Time{
    NSString *theTime=[self formatTime_Seconds:Time];
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss.S"];
    NSDate *destDate= [dateFormatter dateFromString:theTime];
    double timeGap = ([[NSDate date]timeIntervalSince1970] - [destDate timeIntervalSince1970]);
    if(timeGap < 60)
        formatTimeStr = @"1分钟内";
    else if(timeGap <= 3600)
    {
        int n = 1;
        while (++n*60 <= timeGap);
        formatTimeStr = [NSString stringWithFormat:@"%d分钟前", n-1];
    }
    else if(timeGap <= 24*3600)
    {
        int n = 1;
        while (++n*3600 <= timeGap);
        formatTimeStr = [NSString stringWithFormat:@"%d小时前", n-1];
    }else
    {
        //        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
        [dateFormatter setDateFormat:@"dd/MM HH:mm"];
        formatTimeStr = [dateFormatter stringFromDate:destDate];
    }
    return formatTimeStr;
    
}

+(NSString*)formatTimeStr:(NSString*)Time{
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:Time];
    double timeGap = ([[NSDate date]timeIntervalSince1970] - [destDate timeIntervalSince1970]);
    if(timeGap < 60)
        formatTimeStr = @"1分钟内";
    else if(timeGap <= 3600)
    {
        int n = 1;
        while (++n*60 <= timeGap);
        formatTimeStr = [NSString stringWithFormat:@"%d分钟前", n-1];
    }
    else if(timeGap <= 24*3600)
    {
        int n = 1;
        while (++n*3600 <= timeGap);
        formatTimeStr = [NSString stringWithFormat:@"%d小时前", n-1];
    }else if(timeGap <= 3*24*3600)
    {
        int n = 1;
        while (++n*24*3600 <= timeGap);
        formatTimeStr = [NSString stringWithFormat:@"%d天前", n-1];
    }
    else
    {
        //        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
        //        [dateFormatter setDateFormat:@"MM/dd HH:mm"];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        formatTimeStr = [dateFormatter stringFromDate:destDate];
    }
    return formatTimeStr;
}

/**
 *  时间形式转换
 *
 *  @param theTime 时间string
 *
 *  @return 所需形式时间string
 */
+(NSString *)formatTime_Date:(NSString *)theTime{
    
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss.S"];
    NSDate *destDate= [dateFormatter dateFromString:theTime];
    [dateFormatter setDateFormat:@"dd/MM HH:mm"];
    formatTimeStr = [dateFormatter stringFromDate:destDate];
    
    return formatTimeStr;
    
}

+(NSString*)formatTime_Date_yyyy_MM_dd_HH_mm_ss:(NSString*)theTime{
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:theTime];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    formatTimeStr = [dateFormatter stringFromDate:destDate];
    
    return formatTimeStr;
}
/**
 *  时间形式转换
 *
 *  @param senconds 时间nsinteger
 *
 *  @return 所需形式时间string
 */
+(NSString *)formatTime_DateSeconds:(NSInteger )senconds{
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:senconds-60*60*8];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    [dateFormatter setDateFormat:@"dd/MM HH:mm"];
    formatTimeStr = [dateFormatter stringFromDate:localeDate];
    
    return formatTimeStr;
}
/**
 *  时间形式转换
 *
 *  @param senconds 传入的秒数
 *
 *  @return 返回的时间格式字符串
 */
+(NSString *)formatTime_Seconds:(NSInteger )senconds{
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:senconds-60*60*8];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.S"];
    formatTimeStr = [dateFormatter stringFromDate:localeDate];
    
    return formatTimeStr;
}

+(NSString*)formatTime_yyyy_MM_ddWith:(NSInteger)senconds{
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:senconds-60*60*8];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    formatTimeStr = [dateFormatter stringFromDate:localeDate];
    
    return formatTimeStr;
}

+(NSString *)formatTime_HM_Seconds:(NSInteger )senconds{
    NSString *formatTimeStr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:senconds-60*60*8];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    [dateFormatter setDateFormat:@"HH:mm"];
    formatTimeStr = [dateFormatter stringFromDate:localeDate];
    
    return formatTimeStr;
}

+(NSString*)getAgeWith:(NSString*)birth{
    //    NSDate *now = [NSDate date];
    
    //    NSCalendar *calendar = [NSCalendar currentCalendar];
    //    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    //    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    //    NSInteger year = [dateComponent year];
    //    NSInteger month = [dateComponent month];
    //    NSInteger day = [dateComponent day];
    //    NSInteger hour = [dateComponent hour];
    //    NSInteger minute = [dateComponent minute];
    //    NSInteger second = [dateComponent second];
    
    //    计算年龄
    //    第一种仅仅得出年份差的年龄
    //计算年龄
    //    NSString *birth = @"1993-10-30";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //生日
    NSDate *birthDay = [dateFormatter dateFromString:birth];
    //当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
    //    MOSLog(@"currentDate %@ birthDay %@",currentDateStr,birth);
    NSTimeInterval time=[currentDate timeIntervalSinceDate:birthDay];
    int age = ((int)time)/(3600*24*365);
    //    MOSLog(@"year %d",age);
    /*
     //    另外一种得出详细到天的年龄
     NSCalendar *calendar = [NSCalendar currentCalendar];//定义一个NSCalendar对象
     
     NSDate *nowDate = [NSDate date];
     
     NSString *birth = @"1900-10-30";
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd"];
     //生日
     NSDate *birthDay = [dateFormatter dateFromString:birth];
     
     //用来得到详细的时差
     unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
     NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:nowDate options:0];
     
     if([date year] >0)
     {
     MOSLog(@"%@",[NSString stringWithFormat:(@"%ld岁%ld月%ld天"),(long)[date year],(long)[date month],(long)[date day]]) ;
     }
     else if([date month] >0)
     {
     MOSLog(@"%@",[NSString stringWithFormat:(@"%ld月%ld天"),(long)[date month],(long)[date day]]);
     }
     else if([date day]>0){
     MOSLog(@"%@",[NSString stringWithFormat:(@"%ld天"),(long)[date day]]);
     }
     else {
     MOSLog(@"0天");
     }*/
    return [NSString stringWithFormat:@"%d岁",age];
}

/**
 *  获取时分秒
 *
 *  @param totalSeconds 秒数
 *
 *  @return 时分秒字符串
 */
- (NSString *)timeFormatted:(int)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}



@end
