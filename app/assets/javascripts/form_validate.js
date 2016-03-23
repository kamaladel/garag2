$(document).ready(function(){
   $("#new_visit").validate({
      rules: {
         owner_name: {
            required: true
               }
         },
         messages: {
            owner_name: "Required Field"
         }
     });
});