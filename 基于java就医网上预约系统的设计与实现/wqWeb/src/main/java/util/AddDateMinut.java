package util;

import java.io.IOException;
import java.io.Reader;
import java.math.BigInteger;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

public class AddDateMinut {
	
	 public static String addDateMinut(String day, int hour){   
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = null;   
	        try {   
	            date = format.parse(day);   
	        } catch (Exception ex) {   
	            ex.printStackTrace();   
	        }   
	        if (date == null)   
	            return "";   
	        Calendar cal = Calendar.getInstance();   
	        cal.setTime(date);   
	        cal.add(Calendar.HOUR, hour);// 24小时制   
	        date = cal.getTime();   
	        cal = null;   
	        return format.format(date);   
	    }
}
