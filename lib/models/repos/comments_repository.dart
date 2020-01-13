import '../comment.dart';

class CommentsRepository {
  static List<Comment> loadComments() {
    List<Comment> allComments = <Comment>[
      Comment(
        id: 1,
        avatar: 'assets/img/gabriel.jpeg',
        content: 'Heloo babie',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 3,
      ),
      Comment(
        id: 2,
        avatar: 'assets/img/lupita.png',
        content: 'We doing okay',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 4,
      ),
      Comment(
        id: 2,
        avatar: 'assets/img/irene.png',
        content: 'Ayeeeeeeeeeeee',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 1,
      ),
      Comment(
        id: 3,
        avatar: 'assets/img/irene.png',
        content: 'Ayeeeeeeeeeeee',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 1,
      ),
      Comment(
        id: 4,
        avatar: 'assets/img/irene.png',
        content: 'Ayeeeeeeeeeeee',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 5,
      ),
      Comment(
        id: 5,
        avatar: 'assets/img/irene.png',
        content: 'Ayeeeeeeeeeeee',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 8,
      ),
      Comment(
        id: 6,
        avatar: 'assets/img/irene.png',
        content: 'We good??',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 10,
      ),
      Comment(
        id: 7,
        avatar: 'assets/img/irene.png',
        content: 'Bosss',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 12,
      ),
      Comment(
        id: 8,
        avatar: 'assets/img/gabriel.jpeg',
        content: 'Am cool n u???',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 7,
      ),
      Comment(
        id: 9,
        avatar: 'assets/img/gabriel.jpeg',
        content: 'We good love',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 2,
      ),
      Comment(
        id: 10,
        avatar: 'assets/img/gabriel.jpeg',
        content: 'We good love',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 13,
      ),
      Comment(
        id: 11,
        avatar: 'assets/img/gabriel.jpeg',
        content: 'We good love',
        timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
        caseId: 1,
      ),
    ];
    return allComments.toList();
  }
}
