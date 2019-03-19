__Spring boot goals:__
1.  Enable faster and better startup experience with spring
2.  Take Opinionated view but move out of the way quickly if needed
3.  Provide Non-functional support like embedded servers, dev tools, actuators etc
4.  No code generation Or XML configs

- Group ID used: org.springframework.boot
- Nomenclature for starters: `spring-boo-starter-*`
- Parent artifact with defaults: spring-boot-starter-parent
- For version migration check: `spring-boot-properties-migration artifact/pom`
- For executable fat jar creation use plugin: spring-boot-maven-plugin
- View contents of fat jar with: `jar tvf target/jarname.jar`
- Run spring boot fat jar: `java -jar target/jarname.jar`


__Spring-boot-start-parent:__
- Provides maven defaults
- Provides _dependency-management_; this ensures dependencies are not added to project without asking it in _dependency_
- Remember we must specify version number of this parent and only for this version number has to be explicitly specified for the rest check dependencies pom

__Spring-boot-parent provides:__
1.  Java compiler version
2.  UTF-8 encoding
3.  Resource filtering including `application.xml` Or `application.yml` with specific env. specific configs like `application-dev.yml` as well
4.  spring-boot-dependencies through inheritance
5.  Sesible plugin configs
6.  Repackage execution goal

__Spring-boot-dependencies__
- provides dependency management eliminating the need to provide version numbers
- Dependecies list is available as: `spring-boot-dependencies` bom
- Inherited by spring-boot-starter-parent
- Developers can omit <version> specification of a dependency when this bom or parent is used

__List of najor starts and their underlying used dependency:__
[Starter list](https://docs.spring.io/spring-boot/docs/current/reference/html/using-boot-build-systems.html#using-boot-starter)

- You need to opt-in to auto-configuration by adding the @EnableAutoConfiguration or @SpringBootApplication

__Spring/Application components:__
- These annotations are automatically pickedup when @ComponentScan Or @SpringBootApplication is used at the top most packaged class
- @Configuration, @Component, @Controller, @Service, @Repository

@SpringBootApplication:
  == @Configuration + @EnableAutoConfiguration + @ComponentScan
  main method: Bootstrap spring application and run on server if tomcat present
  SpringApplication.run(Class, args) <-- Asking _spring application_ to run
  SpringApplicationBuilder - fluent Api Or If you need to build an ApplicationContext hierarchy (multiple contexts with a parent/child relationship)

@EnableAutoConfiguration : 
- Opinonated view of the spring application basing on classpath jars
- Developer must opt-in for spring to take opinionated view of application by using this annotation
- Import configurations and any user defined beans from a different package Or even a jar with: `@Import({ packagename.MyConfig.class, packagename.MyAnotherConfig.class })`

@Controller - sterotype annotation
    @RestController - @Controller + @ResponseBody
    @RequestMapping

Usage of @ComponentScan Or @SpringBootApplication - will enable spring to scan application for annotated components

__Ways to run spring boot application:__
1. Run as: `java jar - java -jar target/appname.jar`
2. With maven:`mvn spring-boot:run` at project root
3. Run in Debug mode: `java -jar myproject-0.0.1-SNAPSHOT.jar --debug``

Hot swapping:
- spring-boot-devtools
- Application restart vs reload: 
  Spring devtools 'restarts' app by using two classloaders. Libraries are loading tru base classloader, while changing code is loaded using `restart` classloader. When code changes, it dumps restart classloaders and creates a new restart classloader. Base classloader doesn't change making restarts faster.

When spring boot app fails to start `FailureAnalyzer interface` implementations will provide diagnostic information to the extent possible.

Use `SpringApplication.addListeners(…​` or `SpringApplicationBuilder.listeners(…​)` to register events that are actually triggered before the ApplicationContext is created and which we cannot register a listener on those as a @Bean

Which ApplicationContext to use: https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-web-environment

Get arguments passesd on to main method of app start by:
1. Autowire org.springframework.boot.ApplicationArguments
2. Get it from CommandLinePropertySource of Environment (Autowire Environment)

@ConfigurationProperties: to bind 'collection' valuues like @ConfigurationProperties(prefix="my")
@Value("${value from properties}")
- Getters and setters are usually mandatory, since binding of values from properties is through standard Java Beans property descriptors
-when you want to bind properties to third-party components that are outside of your control, @ConfigurationProperties can be applied on a public @Bean method
@ConfigurationProperties(prefix = "another")
@Bean
public AnotherComponent anotherComponent() {
	...
}

- Use profile annotation to restrict class availability only to specific spring profiles
@Profile("profile name here")
public class ExampleClass{

}

- spring.profiles.active: To specify which profiles should be activated
  spring.profiles.include: To include/append properties from a different profile instead of replacing the properties in the current active profile
  SpringApplication.xxmethodx() : Can also be used to set profiles


- Spring MVC:

    @Controller
    @RequestMapping(value="/example")
    public class ExampleClass{
        @RequestMapping(value="/getdata/{user}", method=RequestMethod.GET)
        public String getData(@RequestParam User user){ //Or by using @ParthVariable
            return new ResponseEntity("hello", HttpStatus.ok);
        }
    }

To implement custom serialization and deserialization of message in spring when using jackson implement:
@JsonComponent
public class Example {

	public static class Serializer extends JsonSerializer<SomeObject> {
		// ...
	}

	public static class Deserializer extends JsonDeserializer<SomeObject> {
		// ...
	}

}

** Error Handling:
By default spring mapps errors to /error mapping. It is registered as a “global” error page in the servlet container. Implement BasicErrorController child of ErrorController to provide custom implementation.
Or, Use @ControllerAdvice & @ExceptionHandler
ResponseEntityExceptionHandler can be implemented for implementation of common exceptions
On customizing error pages and other options refer:
https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-error-handling

- To register servlet components like Filters, listeners and even custom servlets use @ServletComponentScan & implement WebMvcConfigurer
- To custom configure embedded server, configure in properties file Or implement WebServerFactoryCustomizer

** Security:
1. Using @EnableWebSecurity and implementing WebSecurityConfigurereAdapter
2. Using, for OAuth, @EnableResourceServer and implementing ResourceServerConfigurereAdapter
    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
            .anonymous().and()
            .authorizeRequests()
            .antMatchers("/*.html").authenticated() //authenticate
            .antMatchers("/api/**").authenticated() //authenticate
            .antMatchers("/**").permitAll(); //permit others
    }

- JWT Tokens usage: https://www.baeldung.com/spring-security-oauth-jwt

** Database:
    HikariCP is used by spring boot (by default) for connection pooling
    spring-boot-starter-jdbc Or spring-boot-starter-data-jpa
    JdbcTemplate and NamedParameterJdbcTemplate classes are auto-configured by spring using properties in properties file and available for autowiring.

    - spring data jpa provides there key components:
        Hibernate: One of the most popular JPA implementations.
        Spring Data JPA: Makes it easy to implement JPA-based repositories.
        Spring ORMs: Core ORM support from the Spring Framework.
  - Entities:
    Define a class as entity with: @Entity, custom package and subpackages can be specified for entity scanning using @EntityScan
    @EnableJpaRepositories(basePackages={"packages containing repositories"}, entityManagerFactoryRef="entity manager name", transactionManagerRef="transaction manager name")
    JpaTransactionManager a sub-type of PlatformTransactionManager helps in transaction management
    For transaction management, use @EnableTransactionManagement
    
   - DB Auto creation in embedded H2 database:
     spring.h2.console.eabled=true //Enables browser based webpage for Database, access it with https://localhost:8080/h2 (try with h2-console)
     spring.jpa.generate-ddl=true
     spring.jpa.hibernate.ddl-auto=create-drop
     spring.datasource.platform=h2
     spring.datasource.url=jdbc:h2:mem:testdb
   
** Caching:
  Enable caching using @EnableCaching
  Use `spring.cache.type=` to specify which cache provider to use
  Set `spring.cache.type=none` to disable caching even though annotation is added to config.
  spring-boot-starter-cache pom provides caching capabilities

- Messaging: JMS or AMQP (Advanced Message Queuing protocol) can be used for message exchange
- User RestTemplate to consume Rest APIs. RestTemplateBuilder can be used to customize the rest RestTemplate
- Input validation:
  JSR-303 e.g. Hibernate validator is used for user input validation
  Annotate class to be validated with @Validated

** For Distributed transactions:
   Atomikos or Bitronix embedded transaction manager implementations can be used.
   JtaTransactionManager & @Transactional to be used to manage transactions.
   spring.jta.enabled=false to disable transaction management

Session management with spring: https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-session

** Spring Framework Core:
org.springframework.beans/org.springframework.context
org.springframework.context.ApplicationContext Or WebApplicationContext Or ClassPathXmlApplicationContext Or FileSystemXmlApplicationContext

- A spring bean can be defined in 3 ways:
  1. Using XML  2. Using @Component Or @Configuration 3. @Configuration + @Bean

- A bean can be retrieved using ApplicationContext, like:
  ApplicationContext context = new ClassPathXmlApplicationContext("services.xml", "daos.xml");
  PetStoreService service = context.getBean("petStore", PetStoreService.class);

  If using spring boot use @Autowrited:
  @Autowrited private ApplicationContext applicationContext;
  PetStoreService service = applicationContext.getBean(PetStoreService.class);

- Within the spring container each bean is represnted as of type BeanDefinition
https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html#beans-definition

- Explicitly register external object as spring bean by using DefaultListableBeanFactory, provided by applicationContext.getBeanFactory();
- Circular dependency: BeanCurrentlyInCreationException
  https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html#beans-dependency-resolution
- To inject prototype bean into singleton bean use:
  1. Implement ApplicationContextAware interface that provides ApplicationContext and then call applicationContext.getBean("B.class");
  2. Using Lookup method injection

** Spring scopes:
  - Singleton scoped bean: Single bean `per container`, and by creating multiple containers, multiple beans can be created of singleton scope.
  - Prototype scope: Spring container only creates prototype scoped beans and doesn't manage post creation so, calling destroy methods and other activities must be handled explicitly. the Spring container’s role in regard to a prototype-scoped bean is a replacement for the Java new operator.
  - Application, Session and Request scopes throw IllegalStateException when used with non-web application contexts, such as ClassPathXmlApplicationContext.
  - Accessing shorter scoped (e.g. Request scoped) beans in a longer scoped (e.g. singleton scoped) bean cannot be correctly achieved using autowring:
  1. Use AOP Scoped proxy 2. Autowire bean as ObjectFactory<MyTargetBean> and call getObject() 3. Use ObjectProvider<MyTargetBean> 4. Provider<MyTargetBean>
  - Method calls inside same call are direct, to route them through proxy, implement @Scope(proxyMode = ScopedProxyMode.TARGET_CLASS) on class. This is good case where class level cache is implemented where cached data of method2 result can be accessed by method1 instead of direct method call.
  - Spring's AOP based proxy creates CGLIB proxies, which only intercept public method calls. Alternative is to create JDK interface based proxies by setting proxy-target-class=false, but in this case collaboration must be through an interface.
  https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html#beans-factory-scopes-other-injection

** Bean lifecycle callbacks:
* Init & destroy:
  1. XML: init-method & destroy-method 2. Implement InitializingBean & DisposableBean 2. @PostConstruct & @PreDestroy 3.default-init-method & default-destroy-method
  - All the init & destroy approaches can be used at sametime, they are called in a specific order, refer:
  https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html#beans-factory-lifecycle-combined-effects
  - For Classes that implemented AutoClosable Or Closeable, assign special value `inferred` to the bean definition.
  - Initialization callback is performed immediately after all dependencies/collaborators are supplied when, the bean is still a rawbean without being fully created. AOP proxies only applied on fully created beans so it cannot be applied on Initialization or destroy methods.

* Startup and shutdown callbacks:
  - org.springframework.context.LifeCycle Interface defines contract that a bean implement if it has to perform its own start and stop activities in background when the application context starts and stops.
  - Use org.springframework.context.SmartLifecycle for fine grained control over autostartup as well its startup phases.

[Example guides](https://spring.io/guides/)
[Spring boot sample code](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples)

