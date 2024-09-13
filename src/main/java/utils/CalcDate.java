package utils;

import java.util.Date;


public final class CalcDate {


    //计算相差天数
    public static int calcDays (Date begin, Date end) {
        int days = 0;
        if (end == null) {
            days = 9999;
        } else {
            days = (int) ((end.getTime() - begin.getTime()) / (1000*3600*24));
        }
        return days;
    }

    /**
     * 计算两个时间差
     */
    public static String getDatePoor(Date nowDate, Date endDate)
    {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();
        // 计算差多少天
        long day = diff / nd;
        // 计算差多少小时
        long hour = diff % nd / nh;
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        // 计算差多少秒//输出结果
        // long sec = diff % nd % nh % nm / ns;
        if(day != 0 && hour != 0 && min != 0){
            return day + "天" + hour + "小时" + min + "分钟";
        }else if(day == 0 && hour != 0 && min != 0){
            return hour + "小时" + min + "分钟";
        }else if(day == 0 && hour == 0 && min != 0){
            return min + "分钟";
        }else{
            return day + "天" + hour + "小时" + min + "分钟";
        }

    }
}
