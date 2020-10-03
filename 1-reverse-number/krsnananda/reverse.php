<?php
function reverse($num) {
  return is_numeric($num) ? strrev($num) : 'erro';
}

$inputs = ['123', '12', '0', 'lalala', '6641123456789018'];

foreach($inputs as $i) {
  echo 'Output: '.reverse($i)."\n";
}

// Output: 321
// Output: 21
// Output: 0
// Output: erro
// Output: 8109876543211466