package KarateUI.Test;

import com.intuit.karate.driver.WebDriver;
import com.intuit.karate.junit5.Karate;

class KarateRunner {
    public static WebDriver driver;

    @Karate.Test
    Karate testUsers() {
        return Karate.run("KarateUI").relativeTo(getClass());
    }


    }
