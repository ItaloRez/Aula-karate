package prova.gorest;

import com.intuit.karate.junit5.Karate;

public class GoRestRunner {
  @Karate.Test
  Karate testeGoRestApi() {
    return Karate.run("go_rest_API").relativeTo(getClass());
  }
}
