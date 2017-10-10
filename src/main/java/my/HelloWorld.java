package my;

public class HelloWorld {
    public static void main(String... args) {
        String target = (args.length > 0) ? args[0] : "world";
        System.out.println("Hello, " + target + "!");
    }
}
