class Questions {
  final int id, answer;
  final String question;
  final List<String> options;

  Questions(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});

  static const Map<String, List> lectures = {
    "Software Engineering": [
      {
        "id": 1,
        "question":
            "__ is a software development activity that is not a part of software processes.",
        "options": ['Validation', 'Specification', 'Development', 'Dependence'],
        "answer_index": 3,
      },
      {
        "id": 2,
        "question": "What does the study of an existing system refer to?",
        "options": [
          'Details of DFD',
          'Feasibility Study',
          'System Analysis',
          'System Planning'
        ],
        "answer_index": 2,
      },
      {
        "id": 3,
        "question":
            "Which of the following is involved in the system planning and designing phase of the Software Development Life Cycle (SDLC)?",
        "options": ['Sizing', 'Parallel run', 'Specification freeze', 'Word'],
        "answer_index": 3,
      },
      {
        "id": 4,
        "question": "What does RAD stand for?",
        "options": [
          'Rapid App Document',
          'Rapid App Development',
          'Relative App Development',
          'None of the above'
        ],
        "answer_index": 1,
      },
      {
        "id": 5,
        "question":
            "Which of the following prototypes does not associated with Prototyping Model?",
        "options": [
          'Domain Prototype',
          'Vertical Prototype',
          'Horizontal Prototype',
          'Diagonal Prototype'
        ],
        "answer_index": 3,
      },
      {
        "id": 6,
        "question": "What are the features of Software Code?",
        "options": [
          'Simplicity',
          'Accessibility',
          'Modularity',
          'All of the above'
        ],
        "answer_index": 3,
      },
      {
        "id": 7,
        "question":
            "Which of the following does not relate to Evolutionary Process Model?",
        "options": [
          'Incremental Model',
          'Concurrent Dev. Model',
          'WINWIN Spiral Model',
          'All of the above'
        ],
        "answer_index": 3,
      },
      {
        "id": 8,
        "question":
            "____________ is a software development activity that is not a part of software processes.",
        "options": ['Validation', 'Specification', 'Development', 'Dependence'],
        "answer_index": 3,
      },
      {
        "id": 9,
        "question": "Model selection is based on __________.",
        "options": [
          'Requirements',
          'Development team & users',
          'Project type & associated risk',
          'All of the above'
        ],
        "answer_index": 3,
      },
      {
        "id": 10,
        "question":
            " ________ is defined as the process of generating analysis and designing documents?",
        "options": [
          'Re-engineering',
          'Reverse engineering',
          'Software re-engineering',
          'Science and engineering'
        ],
        "answer_index": 1,
      },
    ],
    "Algorithm Analysis": [
      {
        "id": 1,
        "question": "Which of the following is not O(n^2)?",
        "options": [
          '(15^10) * n + 12099',
          'n^1.98',
          'n^3 / (sqrt(n))',
          '(2^20) * n'
        ],
        "answer_index": 2,
      },
      {
        "id": 2,
        "question": "What is the best time complexity of bubble sort?",
        "options": ['N^2', 'NlogN', 'N', 'N(logN)^2'],
        "answer_index": 2,
      },
      {
        "id": 3,
        "question":
            "What is the worst case time complexity of insertion sort where position of the data to be inserted is calculated using binary search?",
        "options": ['N', 'NlogN', 'N^2', 'N(logN)^2'],
        "answer_index": 3,
      },
      {
        "id": 4,
        "question":
            "The tightest lower bound on the number of comparisons, in the worst case, for comparison-based sorting is of the order of____",
        "options": ['N', 'N^2', 'NlogN', 'N(logN)^2'],
        "answer_index": 2,
      },
      {
        "id": 5,
        "question":
            "Which of the following algorithm implementations is similar to that of an insertion sort?",
        "options": ['Binary heap', 'Quick sort', 'Merge sort', 'Radix sort'],
        "answer_index": 3,
      },
      {
        "id": 6,
        "question":
            "What is the time complexity of Floyd–Warshall algorithm to calculate all pair shortest path in a graph with n vertices?",
        "options": ['O(n^2logn)', 'Theta(n^2logn)', 'Theta(n^4)', 'Theta(n^3)'],
        "answer_index": 3,
      },
      {
        "id": 7,
        "question":
            "A list of n string, each of length n, is sorted into lexicographic order using the merge-sort algorithm. The worst case running time of this computation is ______",
        "options": ['O (n log n)', 'O (n2 log n)', 'O (n2 + log n)', 'O (n2)'],
        "answer_index": 1,
      },
      {
        "id": 8,
        "question":
            "The minimum number of comparisons required to find the minimum and the maximum of 100 numbers is _____",
        "options": ['148', '147', '146', '145'],
        "answer_index": 0,
      },
      {
        "id": 9,
        "question":
            "Which of the following method is used for sorting in merge sort?",
        "options": ['Merging', 'Partitioning', 'Selection', 'Exchanging'],
        "answer_index": 0,
      },
      {
        "id": 10,
        "question":
            "Let T(n) be a function defined by the recurrence T(n) = 2T(n/2) + √n for n ≥ 2 and T(1) = 1 Which of the following statements is TRUE?",
        "options": [
          'T(n) = θ(log n)',
          'T(n) = θ(√n)',
          'T(n) = θ(n)',
          'T(n) = θ(n log n)'
        ],
        "answer_index": 2,
      },
    ],
    "Computer Networks": [
      {
        "id": 1,
        "question":
            "Different computers are connected to a LAN by a cable and _____",
        "options": [
          'Telephone lines',
          'Special wires',
          'Interface card',
          'Modem'
        ],
        "answer_index": 2,
      },
      {
        "id": 2,
        "question": "Fibre optics have maximum segment is _____",
        "options": ['100m', '200m', '500m', '2000m'],
        "answer_index": 3,
      },
      {
        "id": 3,
        "question":
            "Which of the following protocol allows an application program on one machine to send a datagram to an application program on another machine?",
        "options": ['SMTP', 'VMTP', 'X.25', 'UDP'],
        "answer_index": 3,
      },
      {
        "id": 4,
        "question":
            "A machine that connects two or more electronic mail systems and transfer mail messages among ____",
        "options": ['Bridges', 'User agent', 'Gateways', 'Mail gateway'],
        "answer_index": 3,
      },
      {
        "id": 5,
        "question": "The network layer is concerned with __________ of data.",
        "options": ['bits', 'frames', 'packets', 'bytes'],
        "answer_index": 2,
      },
      {
        "id": 6,
        "question":
            "A subset of a network that includes all the routers but contains no loops is called ________",
        "options": [
          'spanning tree',
          'spider structure',
          'spider tree',
          'special tree'
        ],
        "answer_index": 0,
      },
      {
        "id": 7,
        "question": "ICMP is primarily used for __________",
        "options": [
          'error and diagnostic functions',
          'addressing',
          'forwarding',
          'routing'
        ],
        "answer_index": 0,
      },
      {
        "id": 8,
        "question":
            "The protocol data unit (PDU) for the application layer in the Internet stack is _____",
        "options": ['Segment', 'Datagram', 'Message', 'Frame'],
        "answer_index": 2,
      },
      {
        "id": 9,
        "question":
            "The time taken by a packet to travel from client to server and then back to the client is called __",
        "options": ['STT', 'RTT', 'PTT', 'JTT'],
        "answer_index": 1,
      },
      {
        "id": 10,
        "question":
            "The default subnet mask for a class B network can be ______",
        "options": [
          '255.255.255.0',
          '255.0.0.0',
          '255.255.192.0',
          '255.255.0.0'
        ],
        "answer_index": 3,
      },
    ]
  };
}
