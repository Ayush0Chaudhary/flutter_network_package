import 'dart:collection';

class HuffmanNode implements Comparable<HuffmanNode> {
  late String character;
  late int frequency;
  late HuffmanNode left;
  late HuffmanNode right;

  HuffmanNode(this.character, this.frequency, this.left, this.right);

  @override
  int compareTo(HuffmanNode other) {
    return frequency - other.frequency;
  }
}

class HuffmanTree {
  late HuffmanNode root;

  HuffmanTree(List<HuffmanNode> nodes) {
    PriorityQueue<HuffmanNode> priorityQueue = PriorityQueue();
    priorityQueue.addAll(nodes);

    while (priorityQueue.length > 1) {
      HuffmanNode left = priorityQueue.removeFirst();
      HuffmanNode right = priorityQueue.removeFirst();
      HuffmanNode internalNode = HuffmanNode('', left.frequency + right.frequency, left, right);
      // priorityQueue.add(internalNode);
    }

    root = priorityQueue.removeFirst();
  }

  Map<String, String> buildCodes() {
    Map<String, String> codes = {};
    _buildCodesRecursive(root, '', codes);
    return codes;
  }

  void _buildCodesRecursive(HuffmanNode node, String code, Map<String, String> codes) {
    if (node.character.isNotEmpty) {
      codes[node.character] = code;
      return;
    }

    _buildCodesRecursive(node.left, '$code${0}', codes);
    _buildCodesRecursive(node.right, '$code${1}', codes);
  }
}

String compress(String input) {
  Map<String, int> frequencyMap = {};
  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    frequencyMap[char] = (frequencyMap[char] ?? 0) + 1;
  }

  List<HuffmanNode> nodes = [];
  frequencyMap.forEach((char, frequency) {
    // nodes.add(HuffmanNode(char, frequency, HuffmanNode('', 0, null, null), HuffmanNode('', 0, null, null)));
  });

  HuffmanTree huffmanTree = HuffmanTree(nodes);
  Map<String, String> codes = huffmanTree.buildCodes();

  StringBuffer compressed = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    compressed.write(codes[input[i]]);
  }

  return compressed.toString();
}


class PriorityQueue<T> {
  List<T> _list = [];

  void add(T element, int priority) {
    _list.add({'element': element, 'priority': priority} as T);
    // _list.sort((a, b) => a['priority'].compareTo(b['priority']));
  }

  T removeFirst() {
    if (_list.isEmpty) {
      throw StateError('PriorityQueue is empty');
    }
    return _list.removeAt(0);
  }

  int get length => _list.length;

  void addAll(List<HuffmanNode> nodes) {

  //TODO: Write method

  }

  // void add(HuffmanNode internalNode) {}
}
