import java.util.ArrayList;
import java.util.List;

public class Q2 {
    public static void main(String[] args) {
        String result = "";
        for (String substring : getFourChars("Lorem at'", 4)) {
            String reversed = reverseString(substring);
            result += reversed;
        }
        System.out.println(result);
    }

    // grouping array into groups of 4 characters
    private static List<String> getFourChars(String S, int groupSize) {
        List<String> group = new ArrayList<String>();
        int count = S.length();
        for (int i = 0; i < count; i += groupSize) {
            group.add(S.substring(i, Math.min(count, i + groupSize)));
        }
        return group;
    }

    // reversing substring parts
    public static String reverseString(String S) {
        char[] chars = S.toCharArray();
        int H = S.length() / 2;
        int L = S.length() - 1;

        for (int j = 0; j < H; j++) {
            char temp = chars[j];
            chars[j] = chars[L - j];
            chars[L - j] = temp;
        }
        return new String(chars);
    }
}
