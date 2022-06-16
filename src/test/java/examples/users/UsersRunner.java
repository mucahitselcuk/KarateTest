package examples.users;

import com.intuit.karate.driver.WebDriver;
import com.intuit.karate.driver.chrome.ChromeWebDriver;
import com.intuit.karate.junit5.Karate;

class UsersRunner {
    public static WebDriver driver;

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }


    }
