package com.intuit.library;

import java.util.Objects;

public class SimpleLibrary {

    public String hello(String name) {
    	if(Objects.isNull(name)) {
    		throw new RuntimeException("Parameter can't be null or empty");
    	}
    	
        return "Hello " + name;
    }
   
}
