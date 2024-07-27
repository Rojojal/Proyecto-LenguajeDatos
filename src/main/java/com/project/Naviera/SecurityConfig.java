package com.project.Naviera;

import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class SecurityConfig implements WebMvcConfigurer {

    @Bean
    public LocaleResolver localeResolver() {
        var slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.getDefault());
        slr.setLocaleAttributeName("session.current.locale");
        slr.setTimeZoneAttributeName("session.current.timezone");

        return slr;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        var lci = new LocaleChangeInterceptor();
        lci.setParamName("lang");
        return lci;
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }

    @Bean("messageSource")
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasenames("messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

     @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests((requests) -> requests
                .requestMatchers("/", "/index", "/errores/**", "/usuarios/**", 
                        "/sobreNosotros/**", "/visita/**", "/comentarios/**", "/contacto/**", "/ubicacion/**",
                        "/register/**", "/js/**", "/webjars/**", "/error**", "/css/**", "/adoptar/**", 
                        "/solicitudesAdopcion/guardar", "/enviarCorreo/**", "/create").permitAll()
                .requestMatchers("Los permisos q tiene un admin").hasRole("ADMIN")
                .requestMatchers("Los permisos q tiene el admin y el personal").hasAnyRole("ADMIN", "PERSONAL")
                .requestMatchers("Los permisos de usuarios").hasRole("USER")
            )
            .csrf(csrf -> csrf
                .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
            .formLogin((form) -> form
                .loginPage("/login").permitAll())
            .logout((logout) -> logout.permitAll());
        
        return http.build();
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
