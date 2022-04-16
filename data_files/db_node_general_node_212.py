==============================
 ExpressionChangedAfterItHasBeenCheckedError: Expression has changed after it was checked. Previous value: 'ngIf: [object Object]'. Current value: 'ngIf: true'.  
==============================
// This type of error usually shows up beyond the initial development  // stages, when we start to have some more expressions in our  // templates, and we have typically started to use some of the  // lifecycle hooks like AfterViewInit. // below is the quick fix or workaround.  import { ChangeDetectorRef,AfterContentChecked} from '@angular/core'  export class example implements OnInit, AfterContentChecked {     ngAfterContentChecked() : void {         this.changeDetector.detectChanges();     } }  // for more detail about this type of error visit :  // https://blog.angular-university.io/angular-debugging/ 
  
==============================
212 at  2021-10-29T15:22:52.000Z
==============================
