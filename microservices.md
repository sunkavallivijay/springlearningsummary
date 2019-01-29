### Microservices definition:
- An architectural style
- Small: A suite of small services each running in its own process (micro + services)
- Autonomous: Change to one service doesn't affect consuming services
- Communication: Service communicating with lightweight mechanisms, often HTTP Resource api

### Characteristics of a Microservice:
- Louse coupling: Change to a service should _never_ lead to change in other service(s)
- Highly Cohesive: Related behavior should be together and any changes to a behavior should fall within a service. If a change results in changes beyond _a_ service then the services are not cohesively defined.
- Bounded context: A Domain-Driven design concept where, the organization as well as the the teams are divided into a manageable bounded models **with each having specific responsibilites**.   
E.g. Product management team, Sales team, Order management team, Delivery management team, Warehouse management team, Finance team, Shared services team, HR Team etc and within the Product management team we can have Product Listing Services, Product Search and retrieval services, Sales analysis and reporting services, Order receiving service, Order status and reporting services etc....

### Benefits of Microservices:
- Respond to business changes faster with easy & faster development of focused services
- Technology heterogeneity
- Resilience
- Scaling
- Ease of deployment
- Organizational alignment
- Composability (AKA Composing software for reuse across organization)
- Optimizing for replacability (AKA writting code which is small and can be replaced with newer faster technologies; no legacy code)

### SOA & Microservices:
 Microservices are a specific approach for SOA; Same way as Scrum being a specific approach for Agile
 
### Packages Vs Shared Libraries Vs Modules:
- Packages help seperation of code with in the application
- Share libraries (libs) help share a reusable code
- Modules are similar to Shared Libs but difference is, modules can be deployed as seperate *process*. E.g. are OSGI is one approach that was introduced starting Java 9

### Strategic goals, Arechitecture principles, Practices:
- Strategic goals: are business goals of the organization. For e.g. Expanding business to another country Or Get Software products to market faster
- Arechitecture principles: are a set of Software architecture principles/guidelines to achieve the strategic goals for E.g. Build modular systems to enable deployment in another country Or Use distributed systems to scale to new users from new country, Use of agile methodology to achieve Faster market delivery of products
- Practices: talk exactly how principles will be applied. For e.g. Build modular systems using Spring framework and Restful architecture, Deliver product faster using Scrum methodology

### Responsibilities of an architect:
- Vision: Have a clearly communicated technical vision
- Empathy: Understand the impact of your decision on your customer and colleagues
- Collaboration: Work with other teams and team members to defina and execute vision
- Adapt: Change your set vision with the changing needs for your organization
- Autonomy: Find right balance between standards and enabling autonomy to the teams
- Governance: Set tangible goals/objectives against which progress on technical vision can be measured

### General points:
- Role of Architect in IT should be like a town planner, predicting future possibilities, constantly adapting to the changing landscape and people needs. It should not be like a building architect, which doesn't change with time.
- Zoning in town planning is similar to Service boundaries in IT Applications

- Seperation of concerns: Modularity and Encapsulation
- Scalability: Horizontal scalaing and work load distribution

### Scaling approaches:
- Horizontal scaling: means that you scale by adding more machines into your pool of resources whereas,
- Vertical scaling means that you scale by adding more power (CPU, RAM) to an existing machine


Microservices Spring boot example: 
https://www.youtube.com/watch?v=rlS9eH5tEnY&pbjreload=10  
https://blog.sapiensworks.com/post/2012/04/17/DDD-The-Bounded-Context-Explained.aspx (This is very good)  
https://www.martinfowler.com/bliki/BoundedContext.html  

### Testing:
#### Stubbing Vs Mocking:
- Stubbing is creating dumb objects that just respond with a value on request. E.g. Creating an stub object that gives 15,000 points when asked for customer 123
- Mocking is ensuring the call to object actually happened; this is like an additional check to stubbing. E.g. When a new customer (stub) object is created a loyality points object for this customer must get created, to validate this Mockig helps.
