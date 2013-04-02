class Tower {
  List<int> disks;
  int index;
  Tower(this.index) : disks = new List<int>();

  void add(int d) {
    if (!disks.isEmpty && disks.last <= d) {
      print("Error placing disk $d");
    } else {
      disks.add(d);
    }
  }

  void moveTopTo(Tower t) {
    int top = disks.removeLast();
    t.add(top);
  }

  void print_contents() {
    print("Contents of Tower ${index}: ${disks.toString()}");
  }

  void moveDisks(int n, Tower destination, Tower buffer) {
    if (n > 0) {
      String tag = "move_${n}_disk_from_${index}_to_${destination.index}_with_buffer_${buffer.index}";
      print("<$tag>");
      moveDisks(n - 1, buffer, destination);
      print("<move_top_from_${index}_to_${destination.index}>");
      print("<before>");
      print("<source_print>");
      print_contents();
      print("</source_print>");
      print("<destination_print>");
      destination.print_contents();
      print("</destination_print>");
      print("</before>");
      moveTopTo(destination);
      print("<after>");
      print("<source_path>");
      print_contents();
      print("</source_print>");
      print("<destination_print>");
      destination.print_contents();
      print("</destination_print>");
      print("</after>");
      print("</move_top_from_${index}_to_${destination.index}>");
      buffer.moveDisks(n - 1, destination, this);
      print("</$tag>");

    }
  }
}



void main() {

  // Set up code.
  int n = 5;
  List<Tower> towers = new List<Tower>(3);

  for (int i = 0; i < 3; i++) {
    towers[i] = new Tower(i);
  }

  for (int i = n - 1; i >= 0; i--) {
    towers[0].add(i);
  }

  // Copy and paste output into a .xml file and open it with internet explorer
  // towers[0].print();
  towers[0].moveDisks(n, towers[2], towers[1]);
  // towers[2].print();
}