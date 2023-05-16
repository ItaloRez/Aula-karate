package aula_inatel.star_wars;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("star_wars").relativeTo(getClass());
    }    

}
