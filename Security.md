## SQL Injection:
* Even the good Hibernate; read HQL, can be injected
* Never put the input parameter in the query directly
  E.g. on Never do:
  1. Book.find("from Book as b where b.title ='" + params.title + "'")
  2. Book.find("from Book as b where b.title ='${params.title}'")
* You can avoid getting injecting by using *Nammed Or positional parameters*
  E.g. Always do:
  1. Book.find("from Book as b where b.title = ?", [params.title])
  2. Book.find("from Book as b where b.title = :title",[title: params.title])

## XSS - cross-site scripting injection:
* Involves attacker injecting script into our site either through data (containing script) sent to server whichis rendered back onto the site Or inject a script into the browser during data binding etc.
* Always ensure the orgination of a request is from your own Or permitted domains
* Correctly escape all the data rendered into Views; read HTML pages
* Prevent script (e.g. Javascript) inject in the data being fed to HTML pages by properly (HTML and Javascript) escaping the data
* Avoid client side redirections on user actions or inputs; can be exploited to redirect user post login to an attackers own phising site

## Cross-site request forgery:
* Sending attack commands from a website your server trusts
* An attacker can embed a link or script by other attack means for e.g. unescaped databindings, into our site which now becomes trusted
* Avoid remember-me cookies and duplicate form submissions (I didn't understand these, have to understand better later)

## HTML/URL Injection:
* Involves replacing expected inputs by HTML elements (containing script) Or URLs, 
* The data thus replaced when redisplayed on the website unescaped could be used to to distort page view Or run a script on page load times
* This can also be used to steal identity
* Main possible areas are in feedback forms and in comment sections of websites, which are not handled properly most of the times
E.g. When a comment on a news site is provided as below, If the below is displayed without escaping, "Hello, world!" is displayed forever to all users of the site until the comment is deleted
```
<html>
 <body>
  <script>
    alert( 'Hello, world!' );
  </script>
 </body>
</html>
```
## DDOS - Distributed denial of service:
* Attacking a server with considerable amount of load so that it cannot fullfill its actual user requests
* Also known as _putting tooooo much load_ on the server; it may knock down the server itself, most of the times the genuine requests just timeout
* Word _distributed_ in this came later, where multiple (compromised) systems; for e.g. Internet connected IoT device, are used to send request to the attacking system

## Cookies configuration:
* Always set cookie as HttpOnly, which tells browser that client script access of the cookie is forbidden


```
server:
    session:
        cookie:
            domain: example.org
            http-only: true
            path: /
            secure: true
```




##### References:
1. [Grails site](https://docs.grails.org/latest/guide/security.html)
