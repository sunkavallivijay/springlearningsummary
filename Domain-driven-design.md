- Start with understand Domains
- Create scooters with Bounded context 
- Create a map of contexts; Context maps 
- Strive to use same terminology 
- start with top level domains and do drill down 

- Models or Entity should be rich containing behavior 
- entities with no behavior are anemic 
- entities must have an identity 
- Value objects 
- value objects should be immutable 
- Value objects should not have any side affects 
- string and date for example are value objects 
- Any change of value object gives a new object 
- Value object doesn't have identity 

###Aggregates: 
- Aggregates are objects/entities that change together 
- e.g. Customer aggregate: Customer entity + customer address entity
- aggregate root: top most entity 
- In above e.g. Customer is root
- Aggregates are cluster of objects that are treated as a unit for data operation 
- Aggregates are lily graph of related entities 
- Aggregates helps with logical seperation
- Entities should associate with other entities only at root aggregate 

Invariants: 
- Universal truths
- e.g. Start date always before end date 
- speed of light, value of PI
- Ensure invariants are not violated in our domain 
- Use primary keys or index or explicit validation 

- repositories must be for aggregate roots
- Anti corruption layer is like an adapter between bounded contexts
