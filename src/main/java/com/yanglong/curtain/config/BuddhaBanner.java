package com.yanglong.curtain.config;

import org.springframework.boot.Banner;
import org.springframework.core.env.Environment;

import java.io.PrintStream;

/**
 * Created by dx on 2016/9/2.
 * modify by DR.YangLong 纯属娱乐
 */
public class BuddhaBanner implements Banner {

    @Override
    public void printBanner(Environment environment, Class<?> sourceClass, PrintStream out) {
        out.append("                       _oo0oo_\n");
        out.append("                      o8888888o\n");
        out.append("                      88\" . \"88\n");
        out.append("                      (| -_- |)\n");
        out.append("                      0\\  =  /0\n");
        out.append("                   ____/`---'\\____\n");
        out.append("                .'  \\\\|     |//  `.\n");
        out.append("               /  \\\\|||  :  |||//  \\\n");
        out.append("              /  _||||| -:- |||||-  \\\n");
        out.append("             |   |   \\\\\\ -  /// |    |\n");
        out.append("             | \\_|   ''\\---/''  |     |\n");
        out.append("             \\  .-\\__   `-`  ___/-.   /\n");
        out.append("            ___`. .'    /--.--\\  `. .  __\n");
        out.append("        .\"\" '<  `.___\\_<|>_/___.'  >'\"\".\n");
        out.append("        | | :  `- \\`.;`\\ _ /`;.`/ - ` : | |\n");
        out.append("        \\  \\ `-.   \\_ __\\ /__ _/   .-` /  / \n");
        out.append("**********************************************************\n");
        out.append("                 佛祖保佑        BUG辟易                    \n");
        out.append("********************************************************** \n");
    }
}
