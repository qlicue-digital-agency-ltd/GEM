import '../case.dart';

class CaseRepository {
  static List<Case> loadCases() {
    List<Case> allCases = <Case>[
      Case(
        id: 1,
        title: 'Custody of children',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/1.jpeg',
        likeStatus: false,
        adds: <int>[0, 2],
        author: 'Matias Muhando',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 0,
      ),
      Case(
        id: 2,
        title: 'Umilika wa mali',
        subtitle: 'Watoto wa nje ya ndoa',
        time: '2 years ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/2.jpeg',
        likeStatus: false,
        adds: <int>[3, 2],
        author: 'Kelvin John',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 4,
      ),
      Case(
        id: 3,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/3.jpeg',
        likeStatus: false,
        adds: <int>[4, 6],
        author: 'Martha Kachweka',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 120,
      ),
      Case(
        id: 4,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/4.jpeg',
        likeStatus: false,
        adds: <int>[6, 7],
        author: 'Pliscla Philipo',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 6,
      ),
      Case(
        id: 5,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/5.jpeg',
        likeStatus: false,
        adds: <int>[5, 0],
        author: 'Jimmy Eliau',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 4,
      ),
      Case(
        id: 6,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/6.jpeg',
        likeStatus: false,
        adds: <int>[2, 1],
        author: 'Henry Lyamuya',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 19,
      ),
      Case(
        id: 7,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/6.jpeg',
        likeStatus: false,
        adds: <int>[5, 0],
        author: 'Jimmy Eliau',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 20,
      ),
      Case(
        id: 8,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/1.jpeg',
        likeStatus: false,
        adds: <int>[0, 2],
        author: 'Matias Muhando',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 40,
      ),
      Case(
        id: 9,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/2.jpeg',
        likeStatus: false,
        adds: <int>[5, 1],
        author: 'Bro',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 14,
      ),
      Case(
        id: 10,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/3.jpeg',
        adds: <int>[7, 0],
        likeStatus: false,
        author: 'Kanjunju John',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 9,
      ),
      Case(
        id: 11,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/4.jpeg',
        likeStatus: false,
        adds: <int>[0, 2],
        author: 'Matias Muhando',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 12,
      ),
      Case(
        id: 12,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/5.jpeg',
        likeStatus: false,
        adds: <int>[4, 3],
        author: 'Msolpopa',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 3400,
      ),
      Case(
        id: 13,
        title: 'Relationship Case',
        subtitle: 'Divorce',
        time: '1 hour ago',
        body:
            'Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes toffee tart.',
        image: 'assets/img/relation/6.jpeg',
        likeStatus: false,
        adds: <int>[2, 5],
        author: 'Winny Makundi',
        paragraphs: <String>[
          'Tootsie roll soufflé candy canes caramels jujubes. Chocolate chocolate bar toffee dessert muffin macaroon. Cookie chocolate bar oat cake jelly muffin. Chocolate bar chocolate bar chocolate cake liquorice dragée fruitcake. Pastry soufflé icing gingerbread. Bear claw caramels apple pie lemon drops danish cookie. Tootsie roll tiramisu chocolate pudding macaroon donut chocolate cake macaroon apple pie. Gummi bears carrot cake tart soufflé pie. Donut chocolate bar chupa chups cheesecake topping tart marzipan. Topping soufflé macaroon chocolate bar dragée sugar plum candy pastry. Toffee cake cake dragée donut cake. Gummies jelly-o lemon drops chocolate cake tootsie roll cheesecake pie. Lemon drops sesame snaps candy jelly chocolate cake. Oat cake sesame snaps chupa chups apple pie icing danish.',
          'Ice cream candy chocolate bar bear claw topping muffin cake croissant carrot cake. Danish cotton candy ice cream. Apple pie sugar plum chocolate bar fruitcake. Dessert apple pie lemon drops gummies jelly beans wafer ice cream. Wafer chocolate ice cream. Jelly-o wafer caramels oat cake candy apple pie soufflé pudding pudding. Halvah pastry chocolate cake sugar plum croissant bonbon. Tart lollipop sugar plum tart sweet roll ice cream chocolate bar tart carrot cake. Candy canes carrot cake pudding jelly beans cupcake chocolate jujubes liquorice. Gummies dessert wafer candy carrot cake icing. Icing gummies biscuit bear claw cookie halvah liquorice apple pie. Sesame snaps topping pudding wafer. Cheesecake croissant cheesecake brownie gummi bears croissant cake.',
          'Chocolate cake candy sweet roll marzipan chocolate bar. Dragée cupcake pastry pastry apple pie sugar plum cake cake. Jelly beans chocolate danish. Marshmallow jelly tiramisu topping chocolate cake danish macaroon bear claw jelly-o. Bear claw dessert sweet. Chocolate cheesecake sweet roll brownie halvah halvah sugar plum. Marzipan jujubes bonbon icing marshmallow croissant tootsie roll icing. Wafer apple pie caramels tiramisu tart. Jelly bear claw pudding. Carrot cake pudding gummies gummies cookie caramels. Bonbon dragée gummies ice cream pudding cookie sweet roll bear claw. Danish pudding croissant apple pie jelly beans. Dragée marshmallow donut bonbon chocolate cake halvah toffee muffin.',
        ],
        likes: 2,
      )
    ];
    return allCases.toList();
  }
}
