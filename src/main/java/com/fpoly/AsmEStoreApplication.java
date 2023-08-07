package com.fpoly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AsmEStoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(AsmEStoreApplication.class, args);
	}

}
