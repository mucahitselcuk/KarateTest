package ApiTest;

import com.intuit.karate.junit5.Karate;


class ApiTest {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("ApiTest").relativeTo(getClass());
    }
}