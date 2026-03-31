package com.intuit.library;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class SimpleLibraryTest {

	@Test
	public void testHello() {
		SimpleLibrary simpleLibrary = new SimpleLibrary();
		assertEquals("Hello World", simpleLibrary.hello("World"));
	}

	@Test
	public void testHelloWithInvalidParam() {
		SimpleLibrary simpleLibrary = new SimpleLibrary();
		RuntimeException thrown = assertThrows(RuntimeException.class, () -> simpleLibrary.hello(null),
				"Expected hello() to throw for null param, but it didn't");
		assertTrue(thrown.getMessage().contains("Parameter can't be null or empty"));
	}

}
