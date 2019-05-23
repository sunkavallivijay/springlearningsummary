node -v
npm -v
npm install -g @angular/cli (install angular command line interface or cli globally)
npm install -g @angular/cli@latest (upgrade angular cli)
ng -v

create angular project:
ng new projectname
ng new projectname -d (d flag shows the project strcture without creating the project)
ng new projectname --skip-tests (skip creating spec/test files)

check running:
ng serve -o Or ng s -o

File angular.js ( angular-cli.js - for older version of angular) is used for angular configuration
Check for versions being used in the project from file: package.json

Bootstrap install along with query: (Run from within the projectname folder)
npm install bootstrap@latestversionnumber query --save 
Update styles and scripts in angular.js to point this bootstrap and query

Generate a new component:
ng g c componentname (g for generate, c for component; its like saying: ng generate component componentname)
ng g c componentname --spec=false --flat=true (spec false means no test files; flat true says not put them in a seperate folder)

Routing module:
ng g m app-routig --flat=true --module=app (app-routing is module name which is standard and module=app says put in app module)
This create module file as: app-routing-module.ts and add it  to root module app.module.ts
export this with exports array and giving name as RouterModule 
routerLink attribute of anchor tag in html specifies our route names sets in app-routing
router-outlet directive tag is where the component is displayed
put the html is app.component.html file 

Template Forms Vs Reactive forms:
Template forms are not easy to unit test
HTML goes into template forms
Not good for complex forms

Reactive forms are dynamic, flexible
Also known as model driven forms
Requires more code than template forms
Angular's ReactiveFormsModule provides the funtionality
FormGroup & FormControl

Forms Api: 
https://angular.io/api/forms
Used to capture inputs entered in html form tag and do many things

Component
Module

Reference:
https://www.youtube.com/watch?v=Sm353aYNZxU&list=PL6n9fhu94yhWNJaDgh0mfae_9xoQ4E_Zj&index=1
