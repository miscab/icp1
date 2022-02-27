import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Iter "mo:base/Iter";


actor {
  func sort (arr:[var Int], start: Nat, end: Nat) : () {
    var i: Nat = start;
    var j: Nat = end;
    var key: Int = arr[i];
    var temp: Int = 0;

    while (i < j) {
      while (i < j and key < arr[j]) {
        j := j - 1;
      };

      if (i < j) {
        arr[i] := arr[j];
        i := i + 1;
      };

      while (i < j and arr[i] <= key) {
        i := i + 1;
      };

      if (i < j) {
        arr[j] := arr[i];
        j := j - 1;
      };
    };

    arr[i] := key;

    if (start < i) {
      sort(arr, start, j - 1);
    };
    
    if (i < end) {
      sort(arr, j + 1, end);
    };
  }; //sort

  public query func qsort(array:[Int]) : async [Int] {
    let arr:[var Int] = Array.thaw(array);
    sort(arr, 0, arr.size() - 1);
    Array.freeze<Int>(arr);
  };
};
