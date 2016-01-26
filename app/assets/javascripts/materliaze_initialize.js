$(document).ready(function() {
  // alert("hello");
    $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year
    format: 'yyyy-mm-dd' });

     $('#match1').click(function(){
        $("#match_question_background").fadeIn();
        $("#match_question1").fadeIn();
        return false;
      });

      $('#match2').click(function(){
        $("#match_question_background").fadeIn();
        $("#match_question2").fadeIn();
        return false;
      });

      $('#match3').click(function(){
        $("#match_question_background").fadeIn();
        $("#match_question3").fadeIn();
        return false;
      });

      $("#close").click(function(){
        $("#this").fadeOut();
        $("#this").fadeOut();
        return false;
      });
})