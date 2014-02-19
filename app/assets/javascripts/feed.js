// $(window).bind("load", function() {
//    // code here
// });

// $( document ).ready(function() {


$( document ).ready(function() {

  $('.feedWrapper').css({
    "visibility": 'hidden'
  });

});


$(window).bind("load", preparePage);

function preparePage() {

  // Box filling algorithm.
  var verticalSpacing;
  var horizontalSpacing = verticalSpacing = 15;
  var columns = 3;
  var smallestHeights = new Array()
  for (var i=0; i<columns; i++) {
    smallestHeights[i] = 0;
  }

  $('.listingItem').each(function( index ) {

    // Find which column to add.
    console.log($(this).outerHeight());
    var height = $(this).outerHeight();
    var width = $(this).outerWidth();
    var columnIndex = indexOfSmallestValue(smallestHeights);

    // Compute left and top values.
    var left = columnIndex * (width + horizontalSpacing);
    var top = smallestHeights[columnIndex];
    smallestHeights[columnIndex] += height + verticalSpacing;

    // Add it to the display and updated smallestHeights array.
    console.log('Setting left:' + left + 'px');
    console.log('Setting top:' + top + 'px');
    $(this).css({
      "position": "absolute", 
      "left": left + 'px',
      "top": top + 'px'
    });



  });

  // Make Feed visible, and make it's height be that calculated.
  $('.feedWrapper').css({
    'visibility': 'visible',
    'height': (smallestHeights[indexOfLargestValue(smallestHeights)] /*+ 100 */ ) + 'px'
  });

  
}

function indexOfSmallestValue(arr) {
  var smallestValue = arr[0];
  var smallestIndex = 0;
  for (var i=1, n=arr.length; i<n; i++) {
    if (arr[i] < smallestValue) {
      smallestValue = arr[i];
      smallestIndex = i;
    }
  }
  return smallestIndex;
}

function indexOfLargestValue(arr) {
  var largestValue = arr[0];
  var largestIndex = 0;
  for (var i=1, n=arr.length; i<n; i++) {
    if (arr[i] > largestValue) {
      largestValue = arr[i];
      largestIndex = i;
    }
  }
  return largestIndex;
}