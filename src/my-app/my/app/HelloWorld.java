package my.app;

import my.lib.MessageResolver;

public class HelloWorld {
    public static void main(String... args) {
        String target = (args.length > 0) ? args[0] : "world";
        String message = new MessageResolver().resolve(target);
        System.out.println(message);
    }
}
