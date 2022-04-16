==============================
 ERROR TypeError: Cannot read property 'setParent' of undefined  
==============================
// make sure you have a similar structure:  //[File.ts]   // FORM   selectedModeFormControl: FormControl;   form: FormGroup;   selectedMode: any;    createForm(): void {     this.selectedModeFormControl = new FormControl('');      this.form = new FormGroup({       selectedMode: this.selectedModeFormControl,     });   }    //[File.html]  <form name="filters" [formGroup]="form">     <input (...) formControlName="selectedMode"> ...  </form>
  
==============================
193 at  2021-10-29T15:22:52.000Z
==============================
