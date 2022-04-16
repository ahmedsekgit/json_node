==============================
 Eye Icon view in credit card Number Input field  
==============================
<script type="text/javascript">     $(function () {         $(".card-number input[type='password']").keyup(function (event) {             var len = $(this).val().toString().length;             if (len == 4) {                 $(this).next().focus();             }         });          $(".card-number input[type='button']").click(function () {             var number = 0;             $(".card-number input").not("input[type='button']").each(function (index, element) {                 number += $(element).val();             });             alert(number);         });     });    </script>  <!-- ####-####-####-#### --> <div class="card-number" >     <input type="password" value="" maxlength="4" />     <input type="password" value="" maxlength="4" />     <input type="password" value="" maxlength="4" />     <input type="text" value="" maxlength="4" />     <input type="button" value="go" /> </div>
  
==============================
213 at  2021-10-29T15:22:52.000Z
==============================
