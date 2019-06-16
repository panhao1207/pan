package util;

import java.io.IOException;
import java.io.Reader;
import java.math.BigInteger;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

public class StringUtil {
	// private static Seq seq = new Seq();
	
	public static final Pattern PDigit = Pattern.compile("^\\d*$", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
	
	private static Logger logger = Logger.getLogger(StringUtil.class);

	/**
	 * UTF-8的三个字节的BOM
	 */
	public static final byte[] BOM = new byte[] { (byte) 239, (byte) 187, (byte) 191 };

	/**
	 * 获得一个 32 位UUID
	 * 
	 * @return String UUID
	 */
	public static String getUUID() {
		String s = UUID.randomUUID().toString();
		// 去掉“-”符号
		return s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) + s.substring(19, 23) + s.substring(24);
	}

	/**
	 * 
	 * 
	 * 功能说明 : 格式化对象，为空时输出“”
	 * 
	 * @param obj
	 * @return
	 */
	public static String nvl(Object obj) {
		if (obj == null) {
			return "";
		} else {
			return obj.toString();
		}
	}
	
	public static String nvl2Str(Object object,String str) {
		if (object == null) {
			return str;
		} else {
			return object.toString();
		}
	}

	/**
	 * Object to BigInteger
	 * 
	 * @param obj
	 * @return
	 */
	public static BigInteger toBigInteger(Object obj) {
		if (obj == null) {
			return BigInteger.valueOf(0);
		} else {
			try {
				return BigInteger.valueOf(toLong(obj));
			} catch (NumberFormatException e) {
				logger.debug(e.toString());
				return BigInteger.valueOf(0);
			}
		}
	}

	/**
	 * Object to Long
	 * 
	 * @param obj
	 * @return
	 */
	public static long toLong(Object obj) {
		if (obj == null) {
			return 0;
		} else {
			try {
				return Long.valueOf(obj.toString()).longValue();
			} catch (NumberFormatException e) {
				logger.debug(e.toString());
				return 0;
			}
		}
	}

	/**
	 * Object to Double
	 * 
	 * @param obj
	 * @return
	 */
	public static Double toDouble(Object obj) {
		if (obj == null || "null".equals(nvl(obj)) || "".equals(obj)) {
			return 0.00;
		} else {
			try {
				return Double.valueOf(obj.toString()).doubleValue();
			} catch (NumberFormatException e) {
				logger.debug(e.toString());
				return 0.00;
			}
		}
	}

	/**
	 * Object to Int
	 * 
	 * @param obj
	 * @return
	 */
	public static int toInt(Object obj) {
		if (obj == null) {
			return 0;
		} else {
			try {
				return Integer.valueOf(obj.toString()).intValue();
			} catch (NumberFormatException e) {
				logger.debug(e.toString());
				return 0;
			}
		}
	}

	/**
	 * Object to Short
	 * 
	 * @param obj
	 * @return
	 */
	public static short toShort(Object obj) {
		if (obj == null) {
			return 0;
		} else {
			try {
				return Short.valueOf(obj.toString()).shortValue();
			} catch (NumberFormatException e) {
				logger.debug(e.toString());
				return 0;
			}
		}
	}

	/**
	 * 
	 * 
	 * 功能说明 : 格式化 double ，保留2位小数
	 * 
	 * @param d
	 * @return
	 */
	public static String parseDouble(double d) {
		java.text.DecimalFormat df = new java.text.DecimalFormat("#0.00");
		return df.format(d);

	}

	/**
	 * 
	 * 
	 * 功能说明 : 取得sql中的列名
	 * 
	 * @param string
	 * @return string[]
	 */
	public static String[] parseCols(String sql) {
		if (sql == null) {
			return null;
		}
		String part = null;
		if (sql.indexOf("select ") == -1) {
			return null;
		}
		int begin = sql.indexOf("select ") + "select ".length();
		int end = sql.indexOf("from ");
		part = sql.substring(begin, end);
		if (part == null) {
			return null;
		}
		int index = 0;
		if ((index = part.toLowerCase().indexOf("distinct ")) != -1) {
			part = part.substring(index + "distinct ".length());
		}

		StringTokenizer st = new StringTokenizer(part, ",");
		if (st.countTokens() < 1) {
			return null;
		}

		String[] cols = new String[st.countTokens()];
		String[] dataCols = null;
		String dataStr = "";
		for (int i = 0; st.hasMoreTokens(); i++) {
			// int pos = 0;
			String s = st.nextToken();
			s = s.trim();

			if ((s.indexOf("as ")) != -1) {
				cols[i] = s.substring(s.indexOf("as ") + "as ".length()).trim();
				/*
				 * } else if ((s.indexOf("(")) != -1) { continue;
				 */

			} else if ((s.indexOf(")")) != -1) {
				continue;

			} else if ((s.indexOf(".")) != -1) {
				cols[i] = s.substring(s.indexOf(".") + ".".length()).trim();

			} else if ((s.indexOf(" ")) != -1) {
				cols[i] = s.substring(s.indexOf(" ") + " ".length()).trim();

			} else {
				cols[i] = s.trim();
			}
			if (cols[i].indexOf(")") != -1) {
				cols[i] = cols[i].substring(0, cols[i].indexOf(")"));
			}
			if (!dataStr.equals("")) {
				dataStr += ",";
			}
			dataStr += cols[i];
		}
		dataCols = dataStr.split(",");

		return dataCols;
	}

	/**
	 * 
	 * 
	 * 功能说明 : 把 clob类型转换成 String
	 * 
	 * @param clob
	 * @return
	 */
	public static String clob2String(Clob clob) {
		if (clob == null) {
			return "";
		}
		try {
			Reader inStreamDoc = clob.getCharacterStream();

			char[] tempDoc = new char[(int) clob.length()];
			inStreamDoc.read(tempDoc);
			inStreamDoc.close();
			return new String(tempDoc);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException es) {
			es.printStackTrace();
		}

		return "";
	}

	/**
	 * 变更id的长度 changIdLength("1",6) => 000001
	 * 
	 * @param (String)strId 字符串id
	 * @param (int)intLen 长度
	 * @return String id
	 * @throws Exception
	 */
	public static String changIdLength(String strId, int intLen) {
		if (strId.length() == intLen) {

		} else if (strId.length() < intLen) {
			int len = intLen - strId.length();
			String zeroStr = "";
			for (int i = 0; i < len; i++) {
				zeroStr += "0";
			}
			strId = zeroStr + strId;

		} else {

		}
		return strId;
	}

	/**
	 * 
	 * Description : 将字符串的第一个字母转化为大写字母
	 * 
	 * @param str
	 * @return
	 */
	public static String uppperFirstBetter(String str) {

		return upperBetter(str, 0);
	}

	/**
	 * 
	 * Description : 将字符串的指定位置转化为大写字母
	 * 
	 * @param str
	 * @return
	 */
	public static String upperBetter(String str, int index) {

		char letters[] = new char[str.length()];

		for (int i = 0; i < str.length(); i++) {

			char letter = str.charAt(i);

			if (i == index) {

				letter = (char) (letter - 32);
			}

			letters[i] = letter;
		}

		return new String(letters);
	}

	/**
	 * 
	 * Description : 将字符串的指定位置转化为大写字母
	 * 
	 * @param str
	 * @return
	 */
	public static String upperBetterLoop(String str, List<Integer> indexs) {

		char letters[] = new char[str.length()];

		for (int i = 0; i < str.length(); i++) {

			char letter = str.charAt(i);

			for (int index : indexs) {
				if (index == i) {
					letter = (char) (letter - 32);
				}
			}

			letters[i] = letter;
		}

		return new String(letters);
	}

	/**
	 * 
	 * Description : 把map数组的第一个值返回重新组成数组
	 * 
	 * @param params
	 * @return
	 */
	public static Map<String, String> getParamMap(Map<String, String[]> params) {

		Map<String, String> map = new HashMap<String, String>();

		Iterator<String> it = params.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			String[] values = params.get(key);
			if (values.length > 0) {
				map.put(key, values[0]);
			}
		}
		return map;
	}

	// 计算字符串占用的字符长度
	public static int length(String value) {
		int valueLength = 0;
		String chinese = "[\u0391-\uFFE5]";
		/* 获取字段值的长度，如果含中文字符，则每个中文字符长度为3，否则为1 */
		for (int i = 0; i < value.length(); i++) {
			/* 获取一个字符 */
			String temp = value.substring(i, i + 1);
			/* 判断是否为中文字符 */
			if (temp.matches(chinese)) {
				/* 中文字符长度为2 */
				valueLength += 3;
			} else {
				/* 其他字符长度为1 */
				valueLength += 1;
			}
		}
		return valueLength;
	}

	/**
	 * 字符串是否为空，null或空字符串时返回true,其他情况返回false
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	/**
	 * 字符串是否不为空，null或空字符串时返回false,其他情况返回true
	 */
	public static boolean isNotEmpty(String str) {
		return !StringUtil.isEmpty(str);
	}

	/**
	 * 将一个数组拼成一个字符串，数组项之间以逗号分隔
	 */
	public static String join(Object[] arr) {
		return join(arr, ",");
	}

	/**
	 * 将一个二维数组拼成一个字符串，第二维以逗号分隔，第一维以换行分隔
	 */
	public static String join(Object[][] arr) {
		return join(arr, "\n", ",");
	}

	/**
	 * 将一个数组以指定的分隔符拼成一个字符串
	 */
	public static String join(Object[] arr, String spliter) {
		if (arr == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			if (i != 0) {
				sb.append(spliter);
			}
			sb.append(arr[i]);
		}
		return sb.toString();
	}

	/**
	 * 将一个二维数组拼成一个字符串，第二维以指定的spliter2参数分隔，第一维以换行spliter1分隔
	 */
	public static String join(Object[][] arr, String spliter1, String spliter2) {
		if (arr == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			if (i != 0) {
				sb.append(spliter2);
			}
			sb.append(join(arr[i], spliter2));
		}
		return sb.toString();
	}

	/**
	 * 将一个List拼成一个字符串，数据项之间以逗号分隔
	 * 
	 * @param <T>
	 */
	public static <T> String join(List<T> list) {
		return join(list, ",");
	}

	/**
	 * 将一个List拼成一个字符串，数据项之间以指定的参数spliter分隔
	 * 
	 * @param <T>
	 */
	public static <T> String join(List<T> list, String spliter) {
		if (list == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < list.size(); i++) {
			if (i != 0) {
				sb.append(spliter);
			}
			sb.append(list.get(i));
		}
		return sb.toString();
	}

	/**
	 * 
	 * Description : 将字符串数组中 每个形如member_id的字段转化成 memberId
	 * 
	 * @return
	 */
	public static String[] convertColumnToProperty(String[] strs) {
		String[] arr = new String[strs.length];
		for (int i = 0; i < strs.length; i++) {
			if (nvl(strs[i]).indexOf("_") < 0) {
				arr[i] = strs[i];
			} else {
				if (strs[i].indexOf("_") >= 0) {
					String[] tempArr = strs[i].split("_");
					StringBuffer sbBuffer = new StringBuffer();
					sbBuffer.append(tempArr[0]);
					for (int j = 1; j < tempArr.length; j++) {
						sbBuffer.append(uppperFirstBetter(tempArr[j]));
					}
					arr[i] = sbBuffer.toString();
				}
			}
		}
		return arr;
	}

	/**
	 * 
	 * Description : java版本的escape
	 * @param src
	 * @return
	 */
	public static String escape(String src) {
		int i;
		char j;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length() * 6);

		for (i = 0; i < src.length(); i++) {

			j = src.charAt(i);

			if (Character.isDigit(j) || Character.isLowerCase(j) || Character.isUpperCase(j))
				tmp.append(j);
			else if (j < 256) {
				tmp.append("%");
				if (j < 16)
					tmp.append("0");
				tmp.append(Integer.toString(j, 16));
			} else {
				tmp.append("%u");
				tmp.append(Integer.toString(j, 16));
			}
		}
		return tmp.toString();
	}

	/**
	 * 
	 * Description : java版本的unescape函数 
	 * @param src
	 * @return
	 */
	public static String unescape(String src) {
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(src.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(src.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}
	
	/**
	 * 
	 * Description : str to double 
	 * @param str
	 * @return
	 */
	public static Double str2Double(String str){
		try {
			return Double.parseDouble(str);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 
	 * Description : str to double null to 0
	 * @param str
	 * @return
	 */
	public static Double str2DoubleNullTo0(String str){
		Double d = str2Double(str);
		return d == null ? 0 : d;
	}
	
	
	/**
	 * 
	 * Description : str to double 
	 * @param str
	 * @return
	 */
	public static Integer str2Int(String str){
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 
	 * Description : str to double null to 0
	 * @param str
	 * @return
	 */
	public static Integer str2IntNullTo0(String str){
		Integer i = str2Int(str);
		return i == null ? 0 : i;
	}
	
	/**
	 * 判断字符串是否全部由数字组成
	 */
	public static boolean isDigit(String str) {
		if (StringUtil.isEmpty(str)) {
			return false;
		}
		return PDigit.matcher(str).find();
	}
	
	/**
	 * 计算一个字符串中某一子串出现的次数
	 */
	public static int count(String str, String findStr) {
		int lastIndex = 0;
		int length = findStr.length();
		int count = 0;
		int start = 0;
		while ((start = str.indexOf(findStr, lastIndex)) >= 0) {
			lastIndex = start + length;
			count++;
		}
		return count;
	}



	public static void main(String[] args) {
		System.out.println(count(",,,,,,", ","));
	}

}
