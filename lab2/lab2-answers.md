<h1>LAB 2 ANSWERS</h1>

<h2>Which relations have natural keys?</h2>

Customers (username), Theaters (theater_name) and Movies (imdb-key) are natural keys since they have buisness meaning. 

<h2> Is there a risk that any of the natural keys will ever change?</h2>

There is a risk of theater names changing, also usernames if namechange is allowed. 

<h2>Are there any weak entity sets?</h2>

Tickets and performances are weak entity sets. Tickets can not exist without users and performances whilst performances can not exist without theaters and movies. 

<h2>In which relations do you want to use an invented key. Why?</h2>

Ticket ID, to avoid competitors getting knowledge on sold tickets. 

<h2> There are at least two ways of keeping track of the number of seats available for each performance – describe them both, with their upsides and downsides </h2>

1. We have a sum capacity which subracts for each new ticket. Simple, low memory  
2. Log every new ticket transaction, the sum will keep track of the available seats. This works like a bank account and allows traceability.

