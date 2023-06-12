package aula_inatel.free_fake_API;

import com.intuit.karate.junit5.Karate;

class FakeAPIRunner {
    @Karate.Test
    Karate testFakeAPI() {
        return Karate.run("free_fake_API").relativeTo(getClass());
    }
}