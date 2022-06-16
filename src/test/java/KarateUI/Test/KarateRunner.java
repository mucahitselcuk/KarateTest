package KarateUI.Test;

import com.intuit.karate.junit5.Karate;

class KarateRunner {


    @Karate.Test
    Karate testUsers() {
        return Karate.run("KarateUI").relativeTo(getClass());
    }


    }
