var startTime;
var count = 0;
var endTime;
var raceTime;

function move_cell(id){
  var active = $(id).find('.active');
  $(active).next().addClass('active');
  $(active).removeClass('active');
  find_winner(active);
}

function find_winner(active){
  if ($(active).siblings(':last').hasClass('active')){
    var winnerID = $(active).parent().data('player');
    endTime = new Date();
    raceTime = (endTime - startTime)/1000;
    console.log(raceTime)
    parseFloat(raceTime);
    // subtract end - start --> race time
    // alert($(active).parent().attr('class'));
    $.post('/winner', {winnerID: winnerID, raceTime: raceTime});
  };
};

$(document).ready(function() {
  // alert(test);
  $('body').on('keyup', function(event){
    count++;
    if (count === 1) {startTime = new Date()};
    if (event.keyCode === 82){
      move_cell('#player1_strip');
    }
    if (event.keyCode === 85){
      move_cell('#player2_strip');
    }
    $('form').on('submit'), function(event){
      location.reload();
    };
  });
});





// when winner is found send ajax request to database
// player id is saved as winner in game table
// diplay player that won and game results
