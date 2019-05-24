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
Requires more code than template formsring
Angular's ReactiveFormsModule provides the funtionality
FormGroup & FormControl

To set value in forms use: setValue and patchValue methods
setValue must be provided with values for all the form group control else will error out, this helps to make sure we didn't miss any element
patchValue can take only the control for which one wants to set values; this might lead to problem if any control element is accidentally missed as it doesn't give any warning or error
Using FormBuilder to create forms helps reduce boilerplate code also allowing to specify default values

Form validation:
Validator class from @angular/forms module can be used for validation
FormGroup, FormControl, FormBuilder and Validator are all part of forms api of angular
Validator has methods for validation, which must be specified next to default value with a comma in formbuilder

To display validation failure message touched and dirty should be checked on the formcontrol
formcontrol.valid can be checked to know if a particular element is in valid state i.e. no validation failures

ValueChanges:
To get values on change in a FormGroup Or FormControl use `ValueChanges.subscribe` method which acts as event subscriber. This is part of angular forms itself
e.g 
For formcontrol value change: this.formgroup.get(formcontrol).valueChanges.subscribe(value: string){do with value here}
For any value change in entire formgroup: this.formgroup.valueChanges.subscribe(value: any){JSON.toStringify(value);}

Loop tru formGroup:
Object.keys(formgroup.controls) gives list of all controls in the formgroup
To disable a formcontrol: just use formcontrol.disabled(). Similarly you can call many other methods like markdirty()

Forms Api: 
https://angular.io/api/forms
Used to capture inputs entered in html form tag and do many things

Component   
Module

Reference:
https://www.youtube.com/watch?v=Sm353aYNZxU&list=PL6n9fhu94yhWNJaDgh0mfae_9xoQ4E_Zj&index=1
