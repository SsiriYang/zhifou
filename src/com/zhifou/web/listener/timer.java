package com.zhifou.web.listener;
import redis.clients.jedis.Jedis;
import java.text.SimpleDateFormat;
import java.util.*;

import com.zhifou.service.StatisticaldataService;
public class timer   {
    Timer timer;
    public timer(){

        Date time = getTime();
        System.out.println("指定时间time=" + time);
        timer = new Timer();
        timer.schedule(new TimerTaskTest02(), time);
    }
    public Date getTime(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 50);
        calendar.set(Calendar.SECOND, 00);
        Date time = calendar.getTime();
        return time;
    }
//    public static void main(String[] args) {
//        new timer();
//    }

    public class TimerTaskTest02 extends TimerTask {
        @Override
        public void run() {
            Jedis j = null;
            j = new Jedis("127.0.0.1", 6379);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String nowDate = "login:"+sdf.format(date);
            //一下命令等价redis 命令 bitcount login:2016-12-3
            //BitSet b = BitSet.valueOf(j.get("login:2016-12-3").getBytes());
            BitSet b = byteArray2BitSet(j.get(nowDate).getBytes());
            // the number of bit value 1
            int lognum = b.cardinality();
            System.out.println(nowDate + "   登入用户数量: " + lognum);
            // 2016-12-3 login operation user
            StatisticaldataService dateservice = new StatisticaldataService();
            dateservice.addday(lognum);
        }
    }
    public static BitSet byteArray2BitSet(byte[] bytes) {
        BitSet bitSet = new BitSet(bytes.length * 8);
        int index = 0;
        for (int i = 0; i < bytes.length; i++) {
            for (int j = 7; j >= 0; j--) {
                bitSet.set(index++, (bytes[i] & (1 << j)) >> j == 1 ? true
                        : false);
            }
        }
        return bitSet;
    }
}
