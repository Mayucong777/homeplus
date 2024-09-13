package utils;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public final class FormatDate {

    /**
     * 将毫秒转换为日期
     * @param millisecond 毫秒
     * @return 日期
     * @throws ParseException
     */
    public static Date mill2Date (long millisecond) throws ParseException {
        Date date = new Date(millisecond);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        System.out.println(format.format(date));
        date = format.parse(format.format(date));
        return date;
    }

    /**
     * 将字符串转换为日期
     * @param str 字符串
     * @return 日期
     */
    public static Date StrToDate(String str) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获得当前日期 yyyy-MM-dd HH:mm:ss
     * @author mayucong
     * @return 2022-4-26 20:39:38
     */
    public static String getCurrentTime() {
        // 小写的hh取得12小时，大写的HH取的是24小时
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        return df.format(date);
    }
}
