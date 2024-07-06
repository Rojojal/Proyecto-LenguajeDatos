package com.project.demo.config;

import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig extends WebSecurityConfiguration {


    @Bean
    public SecurityFilterChain securityFilterChain (HttpSecurity http) throws Exception {
         return http.authorizeHttpRequests(auth -> auth
                .requestMatchers("/").permitAll()
                .requestMatchers("/register").permitAll()
                .requestMatchers("/login").permitAll()
                .requestMatchers("/usuarios/**").hasRole("ADMIN")
                .anyRequest().authenticated()
                )
                .formLogin(form -> form
                .defaultSuccessUrl("/", true)
                )
                .logout(config -> config
                .logoutSuccessUrl("/").permitAll())
                
                
                .build();
                
                


    }

    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails client = org.springframework.security.core.userdetails.User.withUsername("clientUser")
            .password(passwordEncoder().encode("clientPass"))
            .roles("client")
            .build();

        UserDetails admin = org.springframework.security.core.userdetails.User.withUsername("adminUser")
            .password(passwordEncoder().encode("adminPass"))
            .roles("admin")
            .build();

        return new InMemoryUserDetailsManager(client, admin);
    }


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

   

}