import 'package:scoped_model/scoped_model.dart';

import 'connected_gem.dart';

class MainModel extends Model
    with
        ConnectedGemModel,
        UtilityModel,
        LoginModel,
        TipsModel,
        CasesModel,
        TradeModel,
        AddsModel,
        JobsModel,
        MenuModel,
        CommentModel,
        RelationshipModel,
        CatsModel,
        UserModel {}
